import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget {
  final String hintText;
  final double fontSize;
  final bool fontWeight;
  const CustomInputField({
    Key key,
    @required this.hintText,
    @required this.fontSize,
    @required this.controller,
    this.fontWeight = false,
  }) : super(key: key);

  final controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
        maxLines: null,
        cursorColor: Colors.amber,
        keyboardType: TextInputType.multiline,
        style: TextStyle(
            fontSize: fontSize,
            fontWeight: this.fontWeight ? FontWeight.bold : FontWeight.normal),
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.grey[400])));
  }
}
