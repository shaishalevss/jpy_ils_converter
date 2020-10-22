import 'package:flutter/material.dart';

class TextFieldButton extends StatelessWidget {
  const TextFieldButton(
      {@required this.controller,
        this.fontSize});

  final TextEditingController controller;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      textAlign: TextAlign.center,
      keyboardType: TextInputType.number,
      // onChanged: (v){
      //
      // },
      style: TextStyle(
        decoration: TextDecoration.none,
        fontSize: fontSize,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}