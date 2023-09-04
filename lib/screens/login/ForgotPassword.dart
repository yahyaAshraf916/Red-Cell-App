// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

import '../../models/snackbar.dart';
import 'login.dart';

class ForgotPassword extends StatefulWidget {
  ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final emailController = TextEditingController();
  bool isLoading = false;
  final _formKey = GlobalKey<FormState>();

  resetPassword() async {
    showDialog(
        context: context,
        builder: (context) {
          return Center(
            child: CircularProgressIndicator(
              color: Colors.white,
            ),
          );
        });

    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailController.text);
      if (!mounted) return;
      showSnackBar(context, "Done - Please check ur email");
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, "ERROR :  ${e.code} ");
    }

      // Stop indicator
    Navigator.of(context).pop();
   // if (!mounted) return;

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => SignIn()),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    emailController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Reset Password"),
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.black,
            )),
      ),
      body: Center(
        child: Form(
          key: _formKey,
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height*0.13,),
              Text("Enter your email to rest your password.",
                  style: TextStyle(fontSize: 18)),
              SizedBox(
                height: 33,
              ),
              Padding(
                padding: const EdgeInsets.all(33.0),
                child: TextFormField(
                  // we return "null" when something is valid
                    validator: (email) {
                      return email!.contains(RegExp(
                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+"))
                          ? null
                          : "Enter a valid email";
                    },
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    obscureText: false,
                    decoration:InputDecoration(
                      hintText: "Enter Your Email : ",
                      suffixIcon: Icon(Icons.email),
                      // To delete borders
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey,
                        ),
                      ),
                      // fillColor: Colors.red,
                      filled: true,
                      contentPadding: EdgeInsets.all(8),
                    ),),
              ),
              const SizedBox(
                height: 33,
              ),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    resetPassword();
                  } else {
                    showSnackBar(context, "ERROR");
                  }
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Color(0xffF8585A),),
                  padding: MaterialStateProperty.all(EdgeInsets.all(12)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8))),
                ),
                child: isLoading
                    ? CircularProgressIndicator(
                  color: Colors.white,
                )
                    : Text(
                  "Reset Password",
                  style: TextStyle(fontSize: 19),
                ),
              ),
Spacer(),
              const Image(
                image: AssetImage("assets/icons/log_buttom.png"),
                fit: BoxFit.fill,
                width: double.infinity,
              )
            ],
          ),
        ),
      ),
    );
  }
}
