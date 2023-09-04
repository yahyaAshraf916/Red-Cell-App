import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:red_cell_app/models/user_model.dart';
import 'package:red_cell_app/screens/chats/cubit/social_cubit.dart';
import 'package:red_cell_app/screens/settings/edit_profile_screen.dart';

import '../models/donate_model.dart';

class ListProvider extends ChangeNotifier {
  List<DonateModel> donateModel = [];
 List <UserData> model=[];
  DateTime selectedDay = DateTime.now();

  fetchOrderListFromFireStore() async {
    var ToDosCollection =
        FirebaseFirestore.instance.collection(DonateModel.collectionName)
      
    ;
    var quary = await ToDosCollection.get();
    donateModel = quary.docs.map((doc) {
     
      var map = doc.data();
      return DonateModel(
          userName:map["userName"] ,
          uid: map["uid"],
          id: map["id"],
          requestType: map["requestType"],
          imgRequest: map["imgRequest"],
          patientName: map["patientName"],
          addrees: map["address"],
          hospitalName: map["hospitalName"],
          numberUnit: map["numberUnit"],
          phoneNumber: map["phoneNumber"],
          requiredType: map["requiredType"],
          profileImg: map["profileImg"],
          validTime: DateTime.fromMillisecondsSinceEpoch(map["validTime"]),
           );
    }).toList();

    donateModel.sort((todo1, todo2) {
      return todo1.validTime.compareTo(todo2.validTime);
    });
    notifyListeners();
  }

  changeSelectDate(DateTime newDate) {
    selectedDay = newDate;
  }
}
