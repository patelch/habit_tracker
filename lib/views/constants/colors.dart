import 'package:flutter/material.dart';

const pinkColor = Color(0xFFE55D87);
const blueColor = Color(0xFF5FC3E4);

const pinkToBlueGradient = LinearGradient(
  colors: [
    pinkColor,
    blueColor,
  ],
  begin: FractionalOffset.centerLeft,
  end: FractionalOffset.centerRight,
);
