import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:red_cell_app/models/donate_model.dart';

import '../donation/donate_chat.dart';

class DonationItem extends StatelessWidget {
  DonateModel donateModel;

  DonationItem(
    this.donateModel,
  );



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.all(
              Radius.circular(12),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 4,
                blurRadius: 7,
              ),
            ]),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  donateModel.imgRequest=="imgRequest"?
                   const Image(
                    image: AssetImage("assets/images/blood-type (1).png"),
                    height: 55,
                  )
                  :
                  Image(
                    image: AssetImage(donateModel.imgRequest),
                    height: 55,
                  ),
                  Text(
                   "${ donateModel.requestType} Request",
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0x99000000),
                    ),
                  ),
                  const Spacer(),
                  ElevatedButton(
                    onPressed: () {
                     
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DonateChat(
                                    donateModel,
                                  ),),);
                    },
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll<Color>(HexColor("#E24E58")),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                    child: const Text(
                      "Donate",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 14,color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 7.0, vertical: 3.0),
              child: Row(
                children: [
                  const Text(
                    "Patient : ",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0x99000000)),
                  ),
                  Flexible(
                    child: Text(
                      donateModel.patientName,
                      style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                          color: Color(0x80000000)),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 7.0, vertical: 3.0),
              child: Row(
                children: [
                  const Text(
                    "Blood type : ",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0x99000000)),
                  ),
                  Text(
                    donateModel.requiredType,
                    style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                        color: Color(0x80000000)),
                  ),
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 7.0, vertical: 3.0),
              child: Row(
                children: [
                  Text(
                    'Need (${donateModel.numberUnit}) Units',
                    style: const TextStyle(
                      color:Colors.red,
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                       ),
                  ),
                  const Spacer(),
                  Text(
                    '${donateModel.validTime.day}/ ${donateModel.validTime.month}/${donateModel.validTime.year}',
                    style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        color: Color(0x80000000)),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
              child: Divider(
                color: Color(0x80000000),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(right: 10.0, left: 10.0, bottom: 15.0),
              child: Row(
                children: [
                  SvgPicture.asset(
                    "assets/icons/Group 1006.svg",
                    color: HexColor("#E24E59"),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Flexible(child: Text(donateModel.hospitalName, )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
