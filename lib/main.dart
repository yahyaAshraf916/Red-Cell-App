import 'package:flutter/material.dart';

import 'package:red_cell_app/modules/news/news_screen.dart';
import 'modules/home/home_screen.dart';

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

class MyHomePage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {


    return redCell_layout();

  }
}
