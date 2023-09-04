import 'dart:math';
import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' show basename;
import 'package:firebase_storage/firebase_storage.dart';

class GetDataFromFirebase extends StatefulWidget {
  final String documentId;

  GetDataFromFirebase(this.documentId);

  @override
  State<GetDataFromFirebase> createState() => _GetDataFromFirebaseState();
}

class _GetDataFromFirebaseState extends State<GetDataFromFirebase> {
  Uint8List? imgPath;
  String? imgName;
  String? urlImg;

  getImgUrl({required imgName, required imgPath}) async {
    final storageRef = FirebaseStorage.instance.ref("$imgName");
    //await storageRef.putFile(imgPath);
    UploadTask uploadTask = storageRef.putData(imgPath);
    TaskSnapshot snapshot = await uploadTask;

    ///get img url
    String url = await snapshot.ref.getDownloadURL();
    return url;
  }

  uploadImage2Screen(ImageSource source) async {
    Navigator.pop(context);
    final XFile? pickedImg = await ImagePicker().pickImage(source: source);
    try {
      if (pickedImg != null) {
        imgPath = await pickedImg.readAsBytes();
        setState(() {
          //imgPath = File(pickedImg.path);
          imgName = basename(pickedImg.path);
          int random = Random().nextInt(9999999);
          imgName = "$random$imgName";
          print(imgPath);
          print(imgName);
          //urlImg=  getImgUrl(imgName: imgName, imgPath: imgPath);
        });
        print("sssssssssssssssssssssssssssssssss");
        final storageRef = FirebaseStorage.instance.ref("$imgName");
        //await storageRef.putFile(imgPath);
        UploadTask uploadTask = storageRef.putData(imgPath!);
        TaskSnapshot snapshot = await uploadTask;

        ///get img url
        urlImg = await snapshot.ref.getDownloadURL();
        print("imggggg $urlImg");

        setState(() {
          FirebaseFirestore.instance
              .collection('users')
              .doc(FirebaseAuth.instance.currentUser!.uid)
              .update({"profileImg": urlImg});
        });
      } else {
        print("NO img selected");
      }
    } catch (e) {
      print("Error => $e");
    }
  }

  showmodel() {
    return showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(22),
          height: 170,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () async {
                  await uploadImage2Screen(ImageSource.camera);
                },
                child: const Row(
                  children: [
                    Icon(
                      Icons.camera,
                      size: 30,
                    ),
                    SizedBox(
                      width: 11,
                    ),
                    Text(
                      "From Camera",
                      style: TextStyle(fontSize: 20),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 22,
              ),
              GestureDetector(
                onTap: () {
                  uploadImage2Screen(ImageSource.gallery);
                },
                child: Row(
                  children: const [
                    Icon(
                      Icons.photo_outlined,
                      size: 30,
                    ),
                    SizedBox(
                      width: 11,
                    ),
                    Text(
                      "From Gallery",
                      style: TextStyle(fontSize: 20),
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  final dialogUsernameController = TextEditingController();
  final credential = FirebaseAuth.instance.currentUser;
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  String? onChange;

  myDialog(Map data, dynamic mykey) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(11)),
          child: Container(
            color: Colors.white,
            padding: EdgeInsets.all(22),
            height: 200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                    controller: dialogUsernameController,
                    
                    decoration: InputDecoration(
                     
                      focusedBorder: OutlineInputBorder(
                        
                        borderSide: BorderSide(
                          
                          color: Colors.red,
                        ),
                      ),
                      hintText: "  ${data[mykey]}    ",
                    )),
                SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextButton(
                        onPressed: () {
                          setState(() {
                            dialogUsernameController.text.isEmpty
                                ? null
                                : FirebaseFirestore.instance
                                    .collection('users')
                                    .doc(FirebaseAuth.instance.currentUser!.uid)
                                    .update(
                                        {mykey: dialogUsernameController.text});
                            dialogUsernameController.text = '';
                          });
                          setState(() {
                            Navigator.pop(context);
                          });
                        },
                        child: Text(
                          "Edit",
                          style: TextStyle(fontSize: 17, color: Colors.black),
                        )),
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          "Cancel",
                          style: TextStyle(fontSize: 17, color: Colors.black),
                        )),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(widget.documentId).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text("Something went wrong");
        }

        if (snapshot.hasData && !snapshot.data!.exists) {
          return Text("Document does not exist");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> userData =
              snapshot.data!.data() as Map<String, dynamic>;
          return Container(
            height: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage("assets/Edit Profile Bg.png"),
              fit: BoxFit.cover,
            )),
            child: SingleChildScrollView(
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 40.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            Container(
                              width: 162,
                              height: 162,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(26),
                                image: userData["profileImg"] == "imgProfile"
                                    ? const DecorationImage(
                                        image: AssetImage(
                                            "assets/images/img_profile.jpg"),
                                        fit: BoxFit.cover,
                                      )
                                    : DecorationImage(
                                        image: NetworkImage(
                                            userData["profileImg"]),
                                        fit: BoxFit.cover,
                                      ),
                              ),
                            ),
                            InkWell(
                              onTap: () async {
                                showmodel();
                              },
                              child: CircleAvatar(
                                radius: 25,
                                backgroundColor: Colors.grey,
                                child: Icon(
                                  size: 25,
                                  Icons.edit,
                                  color: HexColor("#E24E59"),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: const Text(
                      "user name",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 8),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                      margin: EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                          border: Border.all(width: 1),
                          borderRadius: BorderRadius.circular(12)),
                      child: Row(
                        children: [
                          Text(
                            userData["userName"],
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Spacer(),
                          IconButton(
                              onPressed: () {
                                myDialog(userData, "userName");
                              },
                              icon: Icon(Icons.edit))
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    child: const Text(
                      "Email",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 8),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                      margin: EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                          border: Border.all(width: 1),
                          borderRadius: BorderRadius.circular(12)),
                      child: Row(
                        children: [
                          Text(
                            userData["email"],
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Spacer(),
                          IconButton(
                              onPressed: () {
                                myDialog(userData, "email");
                              },
                              icon: Icon(Icons.edit))
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    child: const Text(
                      "Phone Number",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 8),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                      margin: EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                          border: Border.all(width: 1),
                          borderRadius: BorderRadius.circular(12)),
                      child: Row(
                        children: [
                          Text(
                            userData["phone"],
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Spacer(),
                          IconButton(
                              onPressed: () {
                                myDialog(userData, "phone");
                              },
                              icon: Icon(Icons.edit))
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text(
                          "Gender",
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * .34,
                        ),
                        const Text(
                          "Year of Birth",
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 13,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                          margin: EdgeInsets.symmetric(horizontal: 20),
                          decoration: BoxDecoration(
                              border: Border.all(width: 1),
                              borderRadius: BorderRadius.circular(12)),
                          child: Row(
                            children: [
                              Text(
                                userData["gender"],
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Spacer(),
                              IconButton(
                                  onPressed: () {
                                    myDialog(userData, "gender");
                                  },
                                  icon: Icon(Icons.edit))
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                          margin: EdgeInsets.only(left: 15, right: 20),
                          decoration: BoxDecoration(
                              border: Border.all(width: 1),
                              borderRadius: BorderRadius.circular(12)),
                          child: Row(
                            children: [
                              Text(
                                userData["dateOfBirthday"],
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Spacer(),
                              IconButton(
                                  onPressed: () {
                                    myDialog(userData, "dateOfBirthday");
                                  },
                                  icon: Icon(Icons.edit))
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        }

        return Center(
            child: CircularProgressIndicator(
          color: Colors.red,
        ));
      },
    );
  }
}
