import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:red_cell_app/models/message_model.dart';
import 'package:red_cell_app/models/social_user_model.dart';
import 'package:red_cell_app/modules/chats/chats_screen.dart';
import 'package:red_cell_app/modules/donation/donation_screen.dart';
import 'package:red_cell_app/modules/home/home_screen.dart';
import 'package:red_cell_app/modules/news/news_screen.dart';
import 'package:red_cell_app/modules/profile/profile_screen.dart';
import 'package:red_cell_app/shared/cubit/red_cell_state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RedCellCubit extends Cubit<RedCellStates> {
  RedCellCubit() : super(RedCellInitialState());
  static RedCellCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  List<Widget> screens = [
    HomeScreen(),
    NewsScreen(),
    DonationScreen(),
    ChatsScreen(),
    ProfileScreen(),
  ];
  List<SocialUserModel> users = [];
  void changeBottomNav(int index) {
    {
      currentIndex = index;

      emit(SocialChangeBottomNavState());
    }
  }
  SocialUserModel? userModel;
   void sendMessage({
    required String receiverId,
    required String dateTime,
    required String text,
  }) {
    MessageModel model = MessageModel(
        text: text,
        senderId: userModel!.uId,
        receiverId: receiverId,
        dateTime: dateTime);
    FirebaseFirestore.instance
        .collection("users")
        .doc(userModel!.uId)
        .collection("chats")
        .doc(receiverId)
        .collection("message")
        .add(model.toMap())
        .then((value) {
      emit(SocialSendMessageSuccessState());
    }).catchError((error) {
      emit(SocialSendMessageErrorState());
      ////////////////////////////////////////////
    });
    FirebaseFirestore.instance
        .collection("users")
        .doc(receiverId)
        .collection("chats")
        .doc(userModel!.uId)
        .collection("message")
        .add(model.toMap())
        .then((value) {
      emit(SocialSendMessageSuccessState());
    }).catchError((error) {
      emit(SocialSendMessageErrorState());
    });
  }

  List<MessageModel> message = [];
  void getmessage({
    required String receiverId,
  }) {
    FirebaseFirestore.instance
        .collection("users")
        .doc(userModel!.uId)
        .collection("chats")
        .doc(receiverId)
        .collection("message")
      ..orderBy("dateTime").snapshots().listen((event) {
        message = [];
        event.docs.forEach((element) {
          message.add(MessageModel.fromJson(element.data()));
        });
        emit(SocialGetMessageSuccessState());
      });
  }
}
/////
