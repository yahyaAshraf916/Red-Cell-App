import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:red_cell_app/home.dart';
import 'package:red_cell_app/models/custom_text_form_field_2.dart';
import 'package:red_cell_app/models/donate_model.dart';
import 'package:red_cell_app/provider/list_provider.dart';
import 'package:red_cell_app/screens/chats/cubit/social_cubit.dart';

class AddDonatePost extends StatefulWidget {
  AddDonatePost({super.key});

  @override
  State<AddDonatePost> createState() => _AddDonatePostState();
}

class _AddDonatePostState extends State<AddDonatePost> {
  late Color color = Colors.white;
  late Color malet = Color.fromARGB(1000, 226, 78, 90);
  late Color maleback = Colors.white;
  late Color frmalet = Color.fromARGB(1000, 226, 78, 90);
  late Color femaleback = Colors.white;
  bool isSelect = false;
  static final RegExp nameRegExp = RegExp('[a-zA-Z]');
  GlobalKey<FormState> myKey = GlobalKey<FormState>();

  String? userName;

  String? patientName;

  String? requiredType = "O-";

  String? phoneNumber;

  String? numberUnit;

  String? validTime;

  String? hospitalName;

  String? addrees;

  String requestType = "Blood";

  String imgRequestType = "imgRequest";

  DateTime selectDateTime = DateTime.now();

  bool isSelected1 = false;
  bool isSelected2 = false;
  bool isSelected3 = false;
  late ListProvider provider;
  String? _dropDownValue;
  var donationCollection;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    provider = Provider.of(context);
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,

          ///title
          title: const Text(
            "Request details",
            style: TextStyle(
              color: Color(0xff24277B),
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Form(
            key: myKey,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(12),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 3,
                                blurRadius: 7,
                              ),
                            ]),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Request Type ",
                                  style: TextStyle(
                                      color: Color(0x63000000),
                                      fontSize: 28,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.left,
                                ),
                                const SizedBox(
                                  height: 15,
                                ),

                                ///choose request type you need
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: ElevatedButton(
                                            onPressed: () async {
                                              setState(() {
                                                isSelected1
                                                    ? isSelected1 = false
                                                    : isSelected1 = true;
                                                isSelected2 = false;
                                                isSelected3 = false;
                                                requestType = "Blood";
                                                imgRequestType =
                                                    "assets/images/blood-type (1).png";
                                              });
                                            },
                                            style: ButtonStyle(
                                              padding:
                                                  MaterialStateProperty.all(
                                                      EdgeInsets.all(20)),
                                              shadowColor:
                                                  MaterialStateProperty.all(
                                                      Colors.grey),
                                              backgroundColor:
                                                  MaterialStateProperty.all(
                                                      isSelected1
                                                          ? Color.fromARGB(
                                                              1000, 226, 78, 90)
                                                          : Colors.white),
                                              shape: MaterialStateProperty.all<
                                                  RoundedRectangleBorder>(
                                                RoundedRectangleBorder(
                                                  side: BorderSide(
                                                      color: Colors.grey,
                                                      width: 0.5),
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                ),
                                              ),
                                            ),
                                            child: Column(
                                              children: [
                                                Image.asset(
                                                  "assets/images/blood-type (1).png",
                                                ),
                                                Text("Blood",
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: isSelected1
                                                            ? Colors.white
                                                            : Color.fromARGB(
                                                                1000,
                                                                226,
                                                                78,
                                                                90))),
                                              ],
                                            )),
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: ElevatedButton(
                                            onPressed: () async {
                                              setState(() {
                                                isSelected2
                                                    ? isSelected3 = false
                                                    : isSelected2 = true;
                                                isSelected1 = false;
                                                isSelected3 = false;
                                                requestType = "Plasma";
                                                imgRequestType =
                                                    "assets/images/plasma_image.png";
                                              });
                                            },
                                            style: ButtonStyle(
                                              padding:
                                                  MaterialStateProperty.all(
                                                      EdgeInsets.all(20)),
                                              shadowColor:
                                                  MaterialStateProperty.all(
                                                      Colors.grey),
                                              backgroundColor:
                                                  MaterialStateProperty.all(
                                                      isSelected2
                                                          ? Color.fromARGB(
                                                              1000, 226, 78, 90)
                                                          : Colors.white),
                                              shape: MaterialStateProperty.all<
                                                  RoundedRectangleBorder>(
                                                RoundedRectangleBorder(
                                                  side: BorderSide(
                                                      color: Colors.grey,
                                                      width: 0.5),
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                ),
                                              ),
                                            ),
                                            child: Column(
                                              children: [
                                                Image.asset(
                                                  "assets/images/plasma_image.png",
                                                ),
                                                Text("Plasma",
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: isSelected2
                                                            ? Colors.white
                                                            : Color.fromARGB(
                                                                1000,
                                                                226,
                                                                78,
                                                                90))),
                                              ],
                                            )),
                                      ),
                                    ),
                                    Expanded(
                                        child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: ElevatedButton(
                                          onPressed: () async {
                                            setState(() {
                                              isSelected3
                                                  ? isSelected3 = false
                                                  : isSelected3 = true;
                                              isSelected2 = false;
                                              isSelected1 = false;
                                              requestType = "  Platelets";
                                              imgRequestType =
                                                  "assets/images/platelets_image.png";
                                            });
                                          },
                                          style: ButtonStyle(
                                            padding: MaterialStateProperty.all(
                                                EdgeInsets.all(20)),
                                            shadowColor:
                                                MaterialStateProperty.all(
                                                    Colors.grey),
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                                    isSelected3
                                                        ? const Color.fromARGB(
                                                            1000, 226, 78, 90)
                                                        : Colors.white),
                                            shape: MaterialStateProperty.all<
                                                RoundedRectangleBorder>(
                                              RoundedRectangleBorder(
                                                side: BorderSide(
                                                    color: Colors.grey,
                                                    width: 0.5),
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                              ),
                                            ),
                                          ),
                                          child: Column(
                                            children: [
                                              Image.asset(
                                                "assets/images/platelets_image.png",
                                              ),
                                              Text("Platelets",
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: isSelected3
                                                          ? Colors.white
                                                          : Color.fromARGB(1000,
                                                              226, 78, 90))),
                                            ],
                                          )),
                                    )),
                                  ],
                                ),

                                ///doner information
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 12.0),
                                  child: CustomTextFromField2(
                                      name: "Patient name",
                                      validator: (value) => value!.isEmpty
                                          ? 'Enter Your Name'
                                          : (nameRegExp.hasMatch(value)
                                              ? null
                                              : 'Enter a Valid Name'),
                                      onChanged: (value) {
                                        patientName = value;
                                      },
                                      textInputType: TextInputType.text),
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            bottom: 20.0, right: 8.0, left: 5),
                                        child: DropdownButtonFormField(
                                          decoration: InputDecoration(
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                color: Colors.grey,
                                              ),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              borderSide: const BorderSide(
                                                color: Colors.grey,
                                              ),
                                            ),
                                          ),
                                          hint: _dropDownValue == null
                                              ? Text('Blood type')
                                              : Text(
                                                  _dropDownValue!,
                                                ),
                                          isExpanded: true,
                                          iconSize: 30.0,
                                          items: [
                                            'O+',
                                            'O-',
                                            'A+',
                                            'A-',
                                            'B+',
                                            'B-',
                                            'AB+',
                                            'AB-',
                                          ].map(
                                            (val) {
                                              return DropdownMenuItem<String>(
                                                value: val,
                                                child: Text(val),
                                              );
                                            },
                                          ).toList(),
                                          onChanged: (val) {
                                            setState(
                                              () {
                                                _dropDownValue = val;
                                                requiredType = val;
                                              },
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 8.0),
                                        child: CustomTextFromField2(
                                          textInputType: TextInputType.number,
                                          name: "Number of unites",
                                          maxLength: 2,
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return "Enter valid number of unites";
                                            }
                                          },
                                          onChanged: (value) {
                                            numberUnit = value;
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            bottom: 20.0, right: 8),
                                        child: GestureDetector(
                                          onTap: () {
                                            showMyDatePker();
                                          },
                                          child: Container(
                                            padding: EdgeInsets.all(20),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(18),
                                                border: Border.all(
                                                    color: Colors.grey,
                                                    width: 1.5)),
                                            child: Text(
                                              '${selectDateTime.day}/ ${selectDateTime.month}/${selectDateTime.year}',
                                              textAlign: TextAlign.center,
                                              style: const TextStyle(
                                                fontSize: 14,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 8.0),
                                        child: CustomTextFromField2(
                                          maxLength: 11,
                                          validator: (value) {
                                            if (value!.isEmpty ||
                                                value.length != 11) {
                                              return "Enter valid phone number";
                                            }
                                          },
                                          textInputType: TextInputType.number,
                                          name: "Phone number",
                                          onChanged: (value) {
                                            phoneNumber = value;
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                              ]),
                        ),
                      ),
                    ),

                    ///hospital information
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(12),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 3,
                                blurRadius: 7,
                              ),
                            ]),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Hospital info",
                                style: TextStyle(
                                  color: Color(0xff24277B),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22,
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 12.0),
                                child: CustomTextFromField2(
                                  textInputType: TextInputType.name,
                                  name: "Hospital name",
                                  validator: (value) => value!.isEmpty
                                      ? 'Enter Your Name'
                                      : (nameRegExp.hasMatch(value)
                                          ? null
                                          : 'Enter a Valid Name'),
                                  onChanged: (value) {
                                    hospitalName = value;
                                  },
                                ),
                              ),
                              CustomTextFromField2(
                                textInputType: TextInputType.name,
                                name: "Address",
                                ifInvaildName: "Please enter Hospital Name",
                                validator: (value) => value!.isEmpty
                                    ? 'Enter Your Name'
                                    : (nameRegExp.hasMatch(value)
                                        ? null
                                        : 'Enter a Valid Name'),
                                onChanged: (value) {
                                  addrees = value;
                                },
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    ///done for donate
                    InkWell(
                      onTap: () {
                        setState(() {
                          addOnClick();
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.all(18),
                        decoration: BoxDecoration(
                          color: Color(0xffd6666e),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Center(
                            child: Text(
                          "Done",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold),
                        )),
                      ),
                    )
                  ],
                ),
              ),
            )));
  }

  void addOnClick() {
    if (myKey.currentState!.validate()) {
      donationCollection =
          FirebaseFirestore.instance.collection(DonateModel.collectionName);

      var emptyDoc = donationCollection.doc();

      print(imgRequestType);
      emptyDoc.set({
        "profileImg": SocialCubit.get(context).userModel!.profileImg,
        "userName": SocialCubit.get(context).userModel!.userName,
        "id": emptyDoc.id,
        "patientName": patientName,
        "address": addrees,
        "validTime": selectDateTime.millisecondsSinceEpoch,
        "hospitalName": hospitalName,
        "numberUnit": numberUnit,
        "phoneNumber": phoneNumber,
        "requiredType": requiredType,
        "requestType": requestType,
        "imgRequest": imgRequestType,
        "uid": FirebaseAuth.instance.currentUser!.uid,
      }).timeout(Duration(milliseconds: 500), onTimeout: () {
        provider.fetchOrderListFromFireStore();
      });
      showDialog(
        context: context,
        builder: (context) => const AlertDialog(
          title: Text("successfully"),
          content: Text("Added to home"),
        ),
      );
      Navigator.pushReplacement(
          context,
          CupertinoPageRoute(
            builder: (context) => home_screen(),
          ));
    }
  }

  void showMyDatePker() async {
    selectDateTime = await showDatePicker(
          context: context,
          initialDate: selectDateTime,
          firstDate: DateTime.now(),
          lastDate: DateTime.now().add(
            Duration(days: 365),
          ),
        ) ??
        DateTime.now();
    setState(() {});
  }
}

class Gender {
  String name;
  String image;
  bool isSelected;

  Gender(this.name, this.image, this.isSelected);
}
