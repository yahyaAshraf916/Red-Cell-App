/*
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:red_cell_app/screens/signUp/second_sign_up_screen.dart';

import '../login/login.dart';

//import 'package:google_sign_in/google_sign_in.dart';

class singUp extends StatefulWidget {
  const singUp({Key? key}) : super(key: key);

  @override
  State<singUp> createState() => _singUpState();
}

class _singUpState extends State<singUp> {
  var credential;
  var user;
  var txt = '';
  late String uId;

  account(String email, String pass, BuildContext context) async {
    try {
      user = FirebaseAuth.instance.currentUser;
      credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: "${email}",
        password: "${pass}",
      );
      uId=credential.user!.uid;

      print("------------------00");
      print(credential);
      await user?.sendEmailVerification();
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => second_sign_up_screen(
              username: con1.text, email: con2.text, password: con3.text,uId: uId,)));
      setState(() {
        txt = '';
      });
      print("/////////////////////////////////////");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        setState(() {
          txt = 'The password provided is too weak.';
        });
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        setState(() {
          txt = 'The account already exists for that email.';
        });
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  bool visabletext = true;
  var con1 = TextEditingController();
  var con2 = TextEditingController();
  var con3 = TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text("sign up",
            style: TextStyle(
                color: Colors.black,
                fontSize: 25,
                fontWeight: FontWeight.w900)),
      ),
      body: Container(
        height: double.infinity,
        color: Colors.white,
        child: ListView(
          children: [
            /////////////////////////////////signup_with_google_and_facebook///////////////////////////////////////////////////////////////
            Container(
              padding: EdgeInsets.fromLTRB(10, 4, 10, 1),
              margin: EdgeInsets.fromLTRB(10, 4, 10, 1),
              child: Row(
                children: [
                  googel_facebook_signup("FaceBook", 15, 0, 15, 0,
                      Color.fromARGB(1000, 68, 89, 147)),
                  googel_facebook_signup("Google", 0, 15, 0, 15,
                      Color.fromARGB(1000, 107, 173, 129)),
                ],
              ),
            ),
            ///////////////////////////////text_faild_for_Signup/////////////////////////////////////////////////////////////////
            lableoftextfaild("enter your name"),
            textfaild('username', TextInputType.name, false, con1),
            lableoftextfaild("email address"),
            textfaild('email', TextInputType.emailAddress, false, con2),
            lableoftextfaild("enter your password"),
            Container(
              padding: EdgeInsets.fromLTRB(10, 4, 10, 1),
              margin: EdgeInsets.fromLTRB(10, 4, 10, 1),
              child: TextField(
                controller: con3,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(
                  suffix: IconButton(
                      onPressed: () {
                        if (visabletext == true) {
                          setState(() {
                            visabletext = false;
                          });
                        } else {
                          setState(() {
                            visabletext = true;
                          });
                        }
                        print(visabletext);
                      },
                      icon: Icon(visabletext == true
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  hintText: 'password',
                ),
                obscureText: visabletext,
              ),
            ),
            SizedBox(
              height: 50,
            ),
            /////////////////////////////////////////////////////////notifyrd///////////////////////////////////////////////////
            Center(
              child: Text("${txt}",
                  style: TextStyle(color: Color.fromARGB(1000, 226, 78, 90))),
            ),
            SizedBox(
              height: 50,
            ),
            //////////////////////////////////////conferm_botton//////////////////////////////////////////////////////////
            Container(
                height: 70,
                padding: EdgeInsets.fromLTRB(10, 4, 10, 1),
                margin: EdgeInsets.fromLTRB(10, 4, 10, 1),
                child: conferm_botton()),
            //////////////////////////////////////login_botton//////////////////////////////////////////////
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("already have an account?",
                      style: TextStyle(color: Colors.grey)),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (context) => SignIn()));
                      },
                      child: Text(
                        "login",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 19,
                            fontWeight: FontWeight.w500),
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  //////////////////////////////////////////////////function////////////////////////////////////////////////////
  ///////////////////////////////////////////////////////////////////////////////////////////////////////////////
  /////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  ElevatedButton conferm_botton() {
    return ElevatedButton(
        style: ButtonStyle(
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15))),
            backgroundColor:
                MaterialStateProperty.all(Color.fromARGB(1000, 226, 78, 90))),
        onPressed: () {
          account(con2.text, con3.text, context);
        },
        child: Text(
          "continue",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ));
  }

  Widget googel_facebook_signup(
      String name, double a, double b, double c, double d, Color color) {
    return Expanded(
        child: ElevatedButton(
      onPressed: () async {
        print("yossef");
        /*Future<UserCredential> signInWithGoogle() async {
          // Trigger the authentication flow
          final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

          // Obtain the auth details from the request
          final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

          // Create a new credential
          final credential = GoogleAuthProvider.credential(
            accessToken: googleAuth?.accessToken,
            idToken: googleAuth?.idToken,
          );

          // Once signed in, return the UserCredential
          return await FirebaseAuth.instance.signInWithCredential(credential);
        }*/
      },
      child: Text("${name}",
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.w600, color: color)),
      style: ButtonStyle(
          padding: MaterialStateProperty.all(EdgeInsets.all(20)),
          shadowColor: MaterialStateProperty.all(Colors.grey),
          backgroundColor: MaterialStateProperty.all(Colors.white),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
            side: BorderSide(color: Colors.grey, width: 0.5),
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(a),
                bottomRight: Radius.circular(b),
                topLeft: Radius.circular(c),
                topRight: Radius.circular(d)),
          ))),
    ));
  }

  Container lableoftextfaild(String name) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 4, 10, 1),
      margin: EdgeInsets.fromLTRB(10, 4, 10, 1),
      child: Text(
        "${name}",
        style: TextStyle(color: Colors.grey),
      ),
    );
  }

  Container textfaild(String hint, TextInputType ty, bool visabletext,
      TextEditingController c) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 4, 10, 1),
      margin: EdgeInsets.fromLTRB(10, 4, 10, 1),
      child: TextField(
        controller: c,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        keyboardType: ty,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          hintText: '${hint}',
        ),
        obscureText: visabletext,
      ),
    );
  }
}

 */
import 'package:flutter/material.dart';
import 'package:red_cell_app/models/custom_text_form_field.dart';
import 'package:red_cell_app/screens/login/login.dart';
import 'package:red_cell_app/screens/login/verify_email_page.dart';

import '../../firebase_services/auth.dart';
import '../../models/snackbar.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  GlobalKey<FormState> myKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final ageController = TextEditingController();
  final phoneController = TextEditingController();
  final monthController = TextEditingController();
  final dayController = TextEditingController();

  late Color malet = Color.fromARGB(1000, 226, 78, 90);
  late Color maleback = Colors.white;
  late Color frmalet = Color.fromARGB(1000, 226, 78, 90);
  late Color femaleback = Colors.white;
  late String gender;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    double sizeScreen = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Colors.white,
        elevation: 0,
        // title: const Text("Sign Up",
        //     style: TextStyle(
        //         color: Colors.black,
        //         fontSize: 25,
        //         fontWeight: FontWeight.w900)),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: myKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ///login with facebook and google
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //   children: [
                //     ElevatedButton.icon(
                //       onPressed: () {},
                //       icon: const Icon(
                //         Icons.facebook,
                //         color: Colors.blue,
                //       ),
                //       label: const Text(
                //         "FACEBOOK",
                //         style: TextStyle(
                //             fontSize: 17,
                //             color: Color(0xff3E6AB2),
                //             fontWeight: FontWeight.bold),
                //       ),
                //       style: ButtonStyle(
                //           backgroundColor: MaterialStateProperty.all(
                //             Colors.white,
                //           ),
                //           padding: MaterialStateProperty.all(
                //               const EdgeInsets.symmetric(
                //                   vertical: 15, horizontal: 30)),
                //           shape: MaterialStateProperty.all(
                //               RoundedRectangleBorder(
                //                   borderRadius: BorderRadius.circular(7),
                //                   side: BorderSide(
                //                       color: Color.fromARGB(109, 255, 255, 255),
                //                       style: BorderStyle.solid)))),
                //     ),
                //     const SizedBox(
                //       width: 10,
                //     ),
                //     ElevatedButton.icon(
                //       onPressed: () {},
                //       icon: const Icon(
                //         Icons.g_mobiledata,
                //         color: Colors.red,
                //       ),
                //       label: const Text(
                //         "GOOGLE",
                //         style: TextStyle(
                //             fontSize: 17,
                //             color: Color(0xff39A751),
                //             fontWeight: FontWeight.bold),
                //       ),
                //       style: ButtonStyle(
                //           backgroundColor: MaterialStateProperty.all(
                //             Colors.white,
                //           ),
                //           padding: MaterialStateProperty.all(
                //               EdgeInsets.symmetric(
                //                   vertical: 15, horizontal: 33)),
                //           shape: MaterialStateProperty.all(
                //               RoundedRectangleBorder(
                //                   borderRadius: BorderRadius.circular(7),
                //                   side: BorderSide(
                //                       color: Color.fromARGB(109, 255, 255, 255),
                //                       style: BorderStyle.solid)))),
                //     ),
                //   ],
                // ),
                const Text("SIGN UP ",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                    textAlign: TextAlign.left),
                SizedBox(
                  height: sizeScreen * .027,
                ),

                ///field to Enter your name
                CustomTextFromField(
                    name: "Enter your name",
                    ifInvaildName: "Please enter your name",
                    controller: nameController,
                    textInputType: TextInputType.text),
                SizedBox(
                  height: sizeScreen * .02,
                ),
                CustomTextFromField(
                    name: "Email address",
                    ifInvaildName: "Please enter your email",
                    controller: emailController,
                    textInputType: TextInputType.emailAddress),
                SizedBox(
                  height: sizeScreen * .025,
                ),
                CustomTextFromField(
                    name: "Enter password",
                    ifInvaildName: "Please enter your password",
                    controller: passwordController,
                    textInputType: TextInputType.text),
                SizedBox(
                  height: 25,
                ),
                Row(
                  children: [
                    Expanded(
                      child: CustomTextFromField(
                          name: "Year",
                          ifInvaildName: "Please enter the year of date",
                          controller: ageController,
                          textInputType: TextInputType.number),
                    ),
                    SizedBox(
                      width: 14,
                    ),
                    Expanded(
                      child: CustomTextFromField(
                          name: "Month",
                          ifInvaildName: "Please enter the month of date",
                          controller: monthController,
                          textInputType: TextInputType.number),
                    ),
                    SizedBox(
                      width: 14,
                    ),
                    Expanded(
                      child: CustomTextFromField(
                          name: "Day",
                          ifInvaildName: "Please enter the day of date",
                          controller: dayController,
                          textInputType: TextInputType.number),
                    ),
                  ],
                ),
                SizedBox(
                  height: sizeScreen * .025,
                ),
                CustomTextFromField(
                    name: "Enter phone",
                    ifInvaildName: "Please enter your phone",
                    controller: phoneController,
                    textInputType: TextInputType.number),
                SizedBox(
                  height: sizeScreen * .025,
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 4, 10, 1),
                  margin: EdgeInsets.fromLTRB(10, 4, 10, 1),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                          child: ElevatedButton(
                        onPressed: () async {
                          setState(() {
                            maleback = Color.fromARGB(1000, 226, 78, 90);
                            malet = Colors.white;
                            femaleback = Colors.white;
                            frmalet = Color.fromARGB(1000, 226, 78, 90);
                            gender = "Male";
                          });
                        },
                        style: ButtonStyle(
                          padding:
                              MaterialStateProperty.all(EdgeInsets.all(20)),
                          shadowColor: MaterialStateProperty.all(Colors.grey),
                          backgroundColor: MaterialStateProperty.all(maleback),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            const RoundedRectangleBorder(
                              side: BorderSide(color: Colors.grey, width: 0.5),
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(15),
                                  bottomRight: Radius.circular(15),
                                  topLeft: Radius.circular(15),
                                  topRight: Radius.circular(15)),
                            ),
                          ),
                        ),
                        child: Text("male",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: malet)),
                      )),
                      const SizedBox(
                        width: 15,
                      ),
                      Expanded(
                          child: ElevatedButton(
                        onPressed: () async {
                          setState(() {
                            malet = Color.fromARGB(1000, 226, 78, 90);
                            maleback = Colors.white;
                            frmalet = Colors.white;
                            femaleback = Color.fromARGB(1000, 226, 78, 90);
                            gender = "Female";
                          });
                        },
                        child: Text("Female",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: frmalet)),
                        style: ButtonStyle(
                          padding:
                              MaterialStateProperty.all(EdgeInsets.all(20)),
                          shadowColor: MaterialStateProperty.all(Colors.grey),
                          backgroundColor:
                              MaterialStateProperty.all(femaleback),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            const RoundedRectangleBorder(
                              side: BorderSide(color: Colors.grey, width: 0.5),
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(15),
                                  bottomRight: Radius.circular(15),
                                  topLeft: Radius.circular(15),
                                  topRight: Radius.circular(15)),
                            ),
                          ),
                        ),
                      )),
                    ],
                  ),
                ),
                SizedBox(
                  height: sizeScreen * .023,
                ),
                GestureDetector(
                  onTap: () async {
                    if (myKey.currentState!.validate()) {
                      setState(() {
                        isLoading = true;
                      });
                      await AuthMethod().signUp(
                        userName: nameController.text,
                        email: emailController.text,
                        password: passwordController.text,
                        imgName: "imgName",
                        profileImg: "imgProfile",
                        //Image.asset("assets/images/img_profile.jpg"),
                        imgPath: "imgPath",
                        dateOfBirthday: ageController.text,
                        gender: gender,
                        phone: phoneController.text,
                        context: context,
                      );
                      setState(() {
                        isLoading = false;
                      });
                      if (!mounted) return;
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignIn(),
                          ));
                    } else {
                      showSnackBar(context, "ERROR");
                    }
                  },
                  child: Container(
                    //margin: EdgeInsets.all(18),
                    padding: EdgeInsets.all(18),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: isLoading
                        ? const Center(
                            child: CircularProgressIndicator(
                            color: Colors.white,
                          ))
                        : const Text(
                            "Sign Up ",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                  ),
                ),
                const SizedBox(
                  height: 3,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Do you have an account?",
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignIn(),
                            ));
                      },
                      child: const Text(
                        "Sign In",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
