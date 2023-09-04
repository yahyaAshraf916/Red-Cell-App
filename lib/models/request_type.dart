import 'package:flutter/material.dart';

class RequestType extends StatefulWidget {
  String requestType;
  String imgRequestType;
  int index;

  RequestType(
      {required this.requestType,
      required this.imgRequestType,
      required this.index});

  @override
  State<RequestType> createState() => _RequestTypeState();
}

class _RequestTypeState extends State<RequestType> {
  int selectIndex = -1;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          selectIndex = widget.index;
        });
      },
      child: Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: selectIndex == widget.index ? Color(0xffd6666e) : Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              widget.imgRequestType,
              height: 70,
              width: 70,
            ),
            Text(widget.requestType),
          ],
        ),
      ),
    );
  }
}
