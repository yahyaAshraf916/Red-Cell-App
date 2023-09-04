import 'package:flutter/material.dart';
import 'package:red_cell_app/models/user_model.dart';
import 'package:red_cell_app/screens/chats/chat_datails_screen%20copy.dart';
import 'package:red_cell_app/screens/chats/chat_datails_screen.dart';
import 'package:red_cell_app/screens/chats/chats_screen.dart';
import 'package:red_cell_app/screens/chats/cubit/social_cubit.dart';

import '../../models/donate_model.dart';

class DonateChat extends StatelessWidget {
  DonateModel donateModel;

  DonateChat(
    this.donateModel,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 70,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: Color(0xff24277B),
            size: 28,
          ),
        ),
        title: const Text(
          "Donation details",
          style: TextStyle(
              fontSize: 22,
              color: Color(0xff24277B),
              fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(12),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 3,
                          blurRadius: 7,
                        ),
                      ]),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12.0, vertical: 15),
                    child: Row(
                      children: [
                        Image.asset("assets/images/isimg.png"),
                        SizedBox(
                          width: 18,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              donateModel.numberUnit,
                              style: const TextStyle(
                                  fontSize: 28,
                                  color: Color(0xff24277B),
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const Text(
                              "Required Units",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Color(0xff24277B),
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical:10.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(12),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 3,
                          blurRadius: 7,
                        ),
                      ]),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12.0, vertical: 15),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Image(
                              image: AssetImage(donateModel.imgRequest),
                              height: 80,
                            ),
                            Text(
                              donateModel.requestType,
                              style: TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0x99000000)),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 12.0, horizontal: 10),
                              child: Text(
                                "Pateint Name",
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Color(0xff24277B),
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Spacer(),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 0.0),
                              child: Text(
                                donateModel.patientName,
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10.0),
                              child: Text(
                                "Blood type ",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Color(0xff24277B),
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10.0),
                              child: Text(
                                donateModel.requiredType,
                                style: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 18.0, vertical: 10),
                          child: Divider(
                            color: Colors.grey,
                            thickness: 1,
                            height: 10,
                          ),
                        ),
                        Row(
                          children: [
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10.0),
                              child: Text(
                                "+20",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Color(0xff24277B),
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Text(
                              donateModel.phoneNumber,
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical:10.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(12),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 3,
                          blurRadius: 7,
                        ),
                      ]),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                     
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left:15.0),
                          child: Text(
                            "Blood donor type required",
                            style: TextStyle(
                                fontSize: 18,
                                color: Color(0xff24277B),
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        if (donateModel.requiredType == "O+")
                          donorType(
                              O: true,
                              O2: true,
                              A: false,
                              A2: false,
                              B: false,
                              B2: false,
                              AB: false,
                              AB2: false),
                        if (donateModel.requiredType == "O-")
                          donorType(
                              O: false,
                              O2: true,
                              A: false,
                              A2: false,
                              B: false,
                              B2: false,
                              AB: false,
                              AB2: false),
                        if (donateModel.requiredType == "A-")
                          donorType(
                              O: false,
                              O2: true,
                              A: false,
                              A2: true,
                              B: false,
                              B2: false,
                              AB: false,
                              AB2: false),
                        if (donateModel.requiredType == "A+")
                          donorType(
                              O: true,
                              O2: true,
                              A: true,
                              A2: true,
                              B: false,
                              B2: false,
                              AB: false,
                              AB2: false),
                        if (donateModel.requiredType == "B+")
                          donorType(
                              O: true,
                              O2: true,
                              A: false,
                              A2: false,
                              B: true,
                              B2: true,
                              AB: false,
                              AB2: false),
                        if (donateModel.requiredType == "B-")
                          donorType(
                              O: false,
                              O2: true,
                              A: false,
                              A2: false,
                              B: false,
                              B2: true,
                              AB: false,
                              AB2: false),
                        if (donateModel.requiredType == "AB-")
                          donorType(
                              O: false,
                              O2: true,
                              A: false,
                              A2: true,
                              B: false,
                              B2: true,
                              AB: false,
                              AB2: true),
                        if (donateModel.requiredType == "AB+")
                          donorType(
                              O: true,
                              O2: true,
                              A: true,
                              A2: true,
                              B: true,
                              B2: true,
                              AB: true,
                              AB2: true),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric( vertical: 10),
                child: Container(
                   decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(12),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 3,
                          blurRadius: 7,
                        ),
                      ]),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Padding(
                          padding:  EdgeInsets.only(right:10.0),
                          child:  Text(
                            "Hospital Address ",
                            style: TextStyle(
                                fontSize: 18,
                                color: Color(0xff24277B),
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        
                        Flexible(
                          child: Text(
                            donateModel.addrees,
                            style: const TextStyle(
                              fontSize: 16,
                              color: Color(0xff24277B),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical:10.0),
                child: Container(
                  width: double.infinity,
                  height: 60,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xffE24E59),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16))),
                    onPressed: () {
                      navigateTo(
                          context,
                          ChatDetailsScreen2(
                            donateModel: donateModel,
                            context,
                          ));
                    },
                    child: const Center(
                      child: Text(
                        'Chat now ',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget donorType(
          {required bool O,
          required bool O2,
          required bool A,
          required bool A2,
          required bool B,
          required bool B2,
          required bool AB,
          required bool AB2}) =>
      Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 22.0, vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                bloodContainer("B+", B),
                bloodContainer("B-", B2),
                bloodContainer("AB+", AB),
                bloodContainer("AB-", AB2)
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 22.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                bloodContainer("O-", O2),
                bloodContainer("O+", O),
                bloodContainer("A-", A2),
                bloodContainer("A+", A),
              ],
            ),
          ),
        ],
      );
  Widget bloodContainer(String a, bool condition) => Container(
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        decoration: BoxDecoration(
          color: condition ? Color(0xffE24E59) : Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(
          a,
          style: TextStyle(
            color: condition ? Colors.white : Color(0xffE24E59),
            //Color(0xffE24E59)
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
}
