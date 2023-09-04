import 'package:flutter/material.dart';

class CustomTextFromField2 extends StatelessWidget {
  int? maxLength;
  String name;
  String? ifInvaildName;
  String? ifInvaildNumber;
  TextInputType textInputType;
  Function(String)? onChanged;
  FormFieldValidator<String>? validator;
  CustomTextFromField2({
    this.validator,
    this.ifInvaildNumber,
    this.ifInvaildName,
    this.maxLength,
    required this.name,
    required this.onChanged,
    required this.textInputType,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      showCursor: false,
      maxLength: maxLength,
      onChanged: onChanged,
      textInputAction: TextInputAction.next,
      keyboardType: textInputType,
      decoration: InputDecoration(
        label: Text(
          name,
         
        ),
       // hintStyle: TextStyle(color: Colors.black),
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
      validator:validator
    );
  }
}
