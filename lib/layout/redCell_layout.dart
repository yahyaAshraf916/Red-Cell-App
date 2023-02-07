import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:red_cell_app/shared/cubit/cubit/red_cell_cubit.dart';
import 'package:red_cell_app/shared/cubit/cubit/red_cell_state.dart';

class redCell_layout extends StatelessWidget {
  const redCell_layout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RedCellCubit(),
      child: BlocConsumer<RedCellCubit, RedCellStates>(
        listener: (context, state) {
        
        },
        builder: (context, state) {
          var cubit = RedCellCubit.get(context);
          return Scaffold(
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              unselectedItemColor:Colors.black,
              selectedItemColor: HexColor("#E24E59"),
              currentIndex: cubit.currentIndex,
              onTap: (index) {
                cubit.changeBottomNav(index);
              },
              items:const [
                BottomNavigationBarItem(
                  icon: 
                  ImageIcon(AssetImage("assets/images/Home_17.png")),
                  label: "",
                ),
                BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage("assets/images/Note_18.png")),
                  label: "",
                ),
                BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage("assets/images/blood-drop (1).png"),size: 42,),
                  label: "",
                ),
                BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage("assets/images/Chat_04.png")),
                  label: "",
                ),
                BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage("assets/images/Profile_02.png")),
                  label: "",
                ),
              ],
            ),
            body: cubit.screens[cubit.currentIndex],
          );
        },
      ),
    );
  }
}
