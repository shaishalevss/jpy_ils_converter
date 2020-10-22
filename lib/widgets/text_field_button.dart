import 'package:flutter/material.dart';

class TextFieldButton extends StatelessWidget {
  const TextFieldButton(
      {@required this.myILSController,
        @required this.myJPYController,
        double this.fontSize});

  final TextEditingController myILSController;
  final TextEditingController myJPYController;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () {
        myILSController.text = '0';
        myJPYController.text = '0';
      },
      child: TextField(
        controller: myJPYController,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}