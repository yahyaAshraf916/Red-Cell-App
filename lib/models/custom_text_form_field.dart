import 'package:flutter/material.dart';

class CustomTextFromField extends StatelessWidget {
  String name;
  String ifInvaildName;
  TextInputType textInputType;
  TextEditingController? controller;
  CustomTextFromField(
      {required this.name, required this.ifInvaildName, required this.controller,required this.textInputType});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
       
      controller: controller,
      textInputAction: TextInputAction.next,
      keyboardType: textInputType,
      decoration: InputDecoration(
        label: Text(
          name,
       
        ),
        labelStyle: const TextStyle(color: Colors.black),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: Colors.red,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: Colors.grey,
          ),
        ),
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.red,
            ),
            borderRadius: BorderRadius.circular(12)),
      ),
      validator: (text) {
        if (text == null || text.trim().isEmpty) {
          return ifInvaildName;
        }
      },
    );
  }
}
