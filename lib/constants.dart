import 'package:flutter/material.dart';

const kTextFieldDecoration = InputDecoration(
  hintText: 'enter a value',
  contentPadding:
  EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.blueAccent, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);

const kMainContainerDecoration = BoxDecoration(
  image: DecorationImage(
    image: AssetImage('images/back.jpg'),
    fit: BoxFit.cover,
  ),
);

const kArrowRightUpDecoration = BoxDecoration(
  image: DecorationImage(
    image: AssetImage('images/rightup.png'),
    fit: BoxFit.cover,
  ),
);

const kArrowLeftDownDecoration = BoxDecoration(
  image: DecorationImage(
    image: AssetImage('images/leftdown.png'),
    fit: BoxFit.cover,
  ),
);