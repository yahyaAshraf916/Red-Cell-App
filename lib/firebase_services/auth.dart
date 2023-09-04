import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:red_cell_app/screens/chats/cubit/social_cubit.dart';

import '../home.dart';
import '../models/snackbar.dart';
import '../models/user_model.dart';

class AuthMethod {
  signUp({
    required userName,
    required email,
    required password,
    // required bloodType,
    required imgName,
    required profileImg,
    required imgPath,
    required dateOfBirthday,
    //required country,
    required gender,
    required phone,
    required context,
  }) async {
    String message = "Error => Not start code";
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      message = "Error => Register only";

      ///upload img to firebase storage
      //String url= await getImgUrl(imgName: imgName, imgPath: imgPath);

      CollectionReference users =
          FirebaseFirestore.instance.collection('users');
      message = "Error => upload image";
      UserData userData = UserData(
        userName: userName,
        //bloodType: bloodType,
        email: email,
        password: password,
        profileImg: profileImg,
        dateOfBirthday: dateOfBirthday,
        //country: country,
        phone: phone,
        gender: gender,
        uid: credential.user!.uid,
      );
      message = "Error => finish upload";

      users
          .doc(credential.user!.uid)
          .set(userData.convertToMap())
          .then((value) => print("User Added"))
          .catchError((error) => print("Failed to add user: $error"));
      //message = "Error => Register & user add";
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
      showSnackBar(context, message);
    }
  }

  signIn({required emailAddress, required password, context}) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: emailAddress, password: password);

      Navigator.pushReplacement(
          context,
          CupertinoPageRoute(
            builder: (context) => home_screen(),
          ));
      SocialCubit.get(context).getUserData();
      SocialCubit.get(context).getUsers();
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, "ERROR :  ${e.code} ");
    }
    // Navigator.pushReplacement(
    //     context,
    //     CupertinoPageRoute(
    //       builder: (context) => home_screen(),
    //     ));
  }

  dynamic getData(Map userData) async {
    try {
      DocumentSnapshot<Map<String, dynamic>> snapShot = await FirebaseFirestore
          .instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .get();
      userData = snapShot.data()!;
    } catch (e) {
      print(e.toString());
    }
  }
}
