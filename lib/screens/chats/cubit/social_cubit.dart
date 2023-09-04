import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:red_cell_app/models/user_model.dart';
import 'package:red_cell_app/screens/chats/cubit/social_state.dart';
import 'package:red_cell_app/screens/chats/models/message_model.dart';
import 'package:red_cell_app/screens/chats/models/social_user_model.dart';
import 'package:red_cell_app/screens/settings/edit_profile_screen.dart';

class SocialCubit extends Cubit<SocialStates> {
  SocialCubit() : super(SocialInitialState());
  static SocialCubit get(context) => BlocProvider.of(context);
  UserData? userModel;
   getUserData() {
   // print("object");
    emit(SocialGetUserLoadingState());

    FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then((value) {
      userModel = UserData.fromJson(value.data()!);
     // print(userModel!.uid);

      emit(SocialGetUserSuccessState());
    }).catchError((error) {
      emit(SocialGetUserErrorState(error.toString()));
    });
  }

  List<UserData> users = [];
  getUsers() {
    // print("object");
    //print(userModel!.email);
    if (users.isEmpty) {
      FirebaseFirestore.instance.collection("users").get().then((value) {
        value.docs.forEach((element) {
            //if (element.data()["uid"] != FirebaseAuth.instance.currentUser!.uid)
          users.add(UserData.fromJson(element.data()));
          // print("users");
        });
        emit(SocialGetAllUsersSuccessState());
      }).catchError((error) {
        emit(SocialGetAllUsersErrorState(error));
      });
    }
    // print(userModel!.email);
  }

  void sendMessage({
    required String receiverId,
    required String dateTime,
    required String text,
  }) {
    MessageModel model = MessageModel(
        text: text,
        senderId: userModel!.uid,
        receiverId: receiverId,
        dateTime: dateTime);
    FirebaseFirestore.instance
        .collection("users")
        .doc(userModel!.uid)
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
        .doc(userModel!.uid)
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
        .doc(userModel!.uid)
        .collection("chats")
        .doc(receiverId)
        .collection("message")
      ..orderBy("dateTime").snapshots().listen((event) {
        message = [];
        for (var element in event.docs) {
          message.add(MessageModel.fromJson(element.data()));
        }
        emit(SocialGetMessageSuccessState());
      });
  }
}
