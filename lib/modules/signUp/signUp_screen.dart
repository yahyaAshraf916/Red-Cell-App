import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:red_cell_app/modules/login/login.dart';
import 'package:red_cell_app/modules/signUp/second_sign_up_screen.dart';
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

  account(String email, String pass, BuildContext context) async {
    try {
      user = FirebaseAuth.instance.currentUser;
      credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: "${email}",
        password: "${pass}",
      );
      print(credential);
      await user?.sendEmailVerification();
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => second_sign_up_screen(
            username: con1.text, email: con2.text, password: con3.text)
      ));
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
                            MaterialPageRoute(builder: (context) => login()));
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
