import 'package:flutter/material.dart';

class TextModel {
  String text;
  Color color;
  double left;
  double top;
  FontWeight fontWeight;
  FontStyle fontStyle;
  double fontSize;
  TextAlign textAlign;

  TextModel({
    required this.color,
    required this.fontSize,
    required this.fontStyle,
    required this.fontWeight,
    required this.left,
    required this.text,
    required this.textAlign,
    required this.top,
  });
}
