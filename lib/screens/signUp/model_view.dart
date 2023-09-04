import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ModelView {

  Widget googel_facebook_signup(
      String name, double a, double b, double c, double d, Color color) {
    return Expanded(
        child: ElevatedButton(
          onPressed: () async {
            print("yossef");
          
          },
          child: Text("${name}",
              style: TextStyle(
                  fontSize: 20, fontWeight: FontWeight.w600, color: color)),
          style: ButtonStyle(
              padding: MaterialStateProperty.all(EdgeInsets.all(20)),
              shadowColor: MaterialStateProperty.all(Colors.grey),
              backgroundColor: MaterialStateProperty.all(Colors.white),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    side: BorderSide(color: Colors.grey, width: 0.5),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(a),
                        bottomRight: Radius.circular(b),
                        topLeft: Radius.circular(c),
                        topRight: Radius.circular(d)),
                  ))),
        ));
  }

  Container lableoftextfaild(String name) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 4, 10, 1),
      margin: EdgeInsets.fromLTRB(10, 4, 10, 1),
      child: Text(
        "${name}",
        style: TextStyle(color: Colors.grey),
      ),
    );
  }

  Container textfaild(String hint, TextInputType ty, bool visabletext,
      TextEditingController c) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 4, 10, 1),
      margin: EdgeInsets.fromLTRB(10, 4, 10, 1),
      child: TextField(
        controller: c,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        keyboardType: ty,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          hintText: '$hint',
        ),
        obscureText: visabletext,
      ),
    );
  }
}
