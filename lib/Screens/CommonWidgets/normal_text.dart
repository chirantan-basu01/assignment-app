import 'package:flutter/material.dart';

class NormalTextWidget extends StatelessWidget {
  NormalTextWidget(
      {super.key,
        required this.text,
        this.fontWeight = FontWeight.normal,
        required this.fontSize,
        this.maxLines = 1,
        required this.color});

  String text;
  Color color;
  FontWeight fontWeight;

  double fontSize = 10;
  int maxLines;

  @override
  Widget build(BuildContext context) {
    return Text(
      text.toString(),
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
          color: color,
          fontFamily: 'Roboto',
          fontSize: fontSize,
          fontWeight: fontWeight),
    );
  }
}
