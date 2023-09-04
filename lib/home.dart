import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:red_cell_app/screens/chats/chats_screen.dart';
import 'package:red_cell_app/screens/chats/cubit/social_cubit.dart';

import 'package:red_cell_app/screens/news/news_screen.dart';
import 'package:red_cell_app/screens/settings/settings_screen.dart';

import 'screens/donation/donation_screen.dart';
import 'screens/home/order_list.dart';

class home_screen extends StatefulWidget {
  @override
  State<home_screen> createState() => _home_screenState();
}

class _home_screenState extends State<home_screen> {
  int selectedIndex = 0;

  void navBar(int index) {
    setState(() {
      
      selectedIndex = index;
    });
  }

  final List<Widget> pages = [
    OrderList(),
    const NewsScreen(),
    AddDonatePost(),
    ChatsScreen(),
    const settings_screen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        height: 55,
        color: Color(0xffd6666e),
        backgroundColor: Color.fromRGBO(255, 255, 255, 0.0),
        animationDuration: Duration(milliseconds: 300),
        items: [
          Image.asset("assets/icons/Home_17.png",
              height: 25, color: Colors.white),
          Image.asset("assets/icons/Note_18.png",
              height: 25, color: Colors.white),
          Image.asset("assets/icons/blood-donation.png",
              height: 25, color: Colors.white),
          Image.asset("assets/icons/Chat_04.png",
              height: 25, color: Colors.white),
          Image.asset("assets/icons/Setting_05.png",
              height: 25, color: Colors.white),
        ],
        onTap: (index) => navBar(index),
      ),
      body: pages[selectedIndex],
    );
  }
}
