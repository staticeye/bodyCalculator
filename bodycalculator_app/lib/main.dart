import 'package:flutter/material.dart';
import 'BMICalculator.dart';

void main() {
  runApp(
    new MaterialApp(
      title: "Body Calculator",
      theme: ThemeData(fontFamily: "PatrickHand"),
      home: BMICalculator(),
    ),
  );
}
