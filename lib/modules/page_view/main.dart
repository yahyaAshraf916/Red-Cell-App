import 'package:flutter/material.dart';
import 'package:page_indicator/page_indicator.dart';
import 'package:red_cell_app/modules/signUp/signUp_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'page view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return con();
  }
}

class con extends StatefulWidget {
  const con({Key? key}) : super(key: key);

  @override
  State<con> createState() => _conState();
}

class _conState extends State<con> {
  var swith = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    get();
  }
void get() async{
    SharedPreferences pr =await SharedPreferences.getInstance();
    swith = pr.getBool("switch")!;
  }
  Widget build(BuildContext context) {


    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: swith == false ? page_view() : singUp(),
      ),
    );
  }
}
