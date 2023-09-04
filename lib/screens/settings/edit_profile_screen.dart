import 'dart:math';
import 'dart:typed_data';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:red_cell_app/firebase_services/auth.dart';
import 'package:red_cell_app/firebase_services/get_data_from_firebase.dart';
import 'package:path/path.dart' show basename;
import 'package:red_cell_app/screens/chats/cubit/social_cubit.dart';

class EditPrpfileScreen extends StatefulWidget {
  const EditPrpfileScreen({super.key});

  @override
  State<EditPrpfileScreen> createState() => _EditPrpfileScreenState();
}

Map userData = {};
bool isLoading = false;

class _EditPrpfileScreenState extends State<EditPrpfileScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 70,
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
             
            },
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.black,
            )),
        title: const Text(
          "Edit Profile",
          style: TextStyle(
            fontSize: 24,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(color: Colors.red),
            )
          : GetDataFromFirebase(FirebaseAuth.instance.currentUser!.uid),
    );
  }
}
