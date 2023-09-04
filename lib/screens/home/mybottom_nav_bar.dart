import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:red_cell_app/screens/chats/cubit/social_cubit.dart';

class MyBottomNavBar extends StatelessWidget {
  void Function(int)? onTabChange;

  MyBottomNavBar({required this.onTabChange});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GNav(
        padding: EdgeInsets.symmetric(vertical: 30, horizontal: 10),
        color: Colors.grey[800],
        activeColor: Colors.grey.shade700,
        tabActiveBorder: Border.all(color: Colors.white),
        tabBackgroundColor: Colors.grey.shade100,
        tabBorderRadius: 16,
        iconSize: 32,
        onTabChange: (value) {
         // SocialCubit.get(context).getUserData();
          return onTabChange!(value);
        },
        tabs: const [
          GButton(
            icon: Icons.home,
            text: "Home",
          ),
          GButton(
            icon: Icons.newspaper,
            text: "News",
          ),
          GButton(
            icon: Icons.chat,
            text: "chat",
          ),
          GButton(
            icon: Icons.settings,
            text: "Setting",
          ),
        ],
      ),
    );
  }
}
