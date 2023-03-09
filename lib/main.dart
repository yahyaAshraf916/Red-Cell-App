import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:red_cell_app/modules/login/login.dart';
import 'package:red_cell_app/modules/page_view/page%20view.dart';
import 'package:red_cell_app/modules/signUp/second_sign_up_screen.dart';
import 'package:red_cell_app/modules/signUp/signUp_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';


import 'package:red_cell_app/modules/news/news_screen.dart';
import 'modules/home/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

import 'package:red_cell_app/layout/redCell_layout.dart';




void main() {

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
class MyHomePage extends StatelessWidget {



  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var swith = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    get();
  }
  void get() async{
    SharedPreferences pr =await SharedPreferences.getInstance();
    swith = pr.getInt("switch")!;
    print(swith);
  }
  @override
  Widget build(BuildContext context) {

    return  swith == 0 ? page_view() : singUp();



    return redCell_layout();


  }
}
