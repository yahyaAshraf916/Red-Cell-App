import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:red_cell_app/screens/chats/cubit/social_cubit.dart';
import 'package:red_cell_app/screens/login/login.dart';

import 'edit_profile_screen.dart';

class settings_screen extends StatelessWidget {
  const settings_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Colors.transparent,
        elevation: 0,

        ///title
        title: const Text(
          "Setting ",
          style: TextStyle(
            color: Color(0xff24277B),
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 15),
              child: Row(
                children: [
                  Image.asset("assets/icons/Profile_02.png",
                      height: 20, color: Color(0x63000000)),
                  const SizedBox(
                    width: 10,
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (context) => const EditPrpfileScreen(),
                            ));
                      },
                      child: Text("Edit profile",
                          style: TextStyle(
                            color: Color(0x99000000),
                          ))),
                ],
              ),
            ),
            // Padding(
            //   padding:
            //       const EdgeInsets.symmetric(vertical: 15.0, horizontal: 15),
            //   child: Row(
            //     children: [
            //       Image.asset("assets/icons/Lang_14.png",
            //           height: 20, color: Color(0x63000000)),
            //       SizedBox(
            //         width: 10,
            //       ),
            //       Text("Language", style: TextStyle(color: Color(0x99000000))),
            //     ],
            //   ),
            // ),
            // Padding(
            //   padding:
            //       const EdgeInsets.symmetric(vertical: 15.0, horizontal: 15),
            //   child: Row(
            //     children: [
            //       Image.asset("assets/icons/mode.png",
            //           height: 20, color: Color(0x63000000)),
            //       SizedBox(
            //         width: 10,
            //       ),
            //       Text("Mode ", style: TextStyle(color: Color(0x99000000))),
            //     ],
            //   ),
            // ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 15),
              child: Row(
                children: [
                  Image.asset("assets/icons/Log_15.png",
                      height: 20, color: Color(0x63000000)),
                  SizedBox(
                    width: 10,
                  ),
                  TextButton(
                      onPressed: () {
                        FirebaseAuth.instance.signOut();
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignIn(),
                            ));
                      },
                      child: Text(
                        "Log out ",
                        style: TextStyle(color: Color(0x99000000)),
                      )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
