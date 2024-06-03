import 'package:flutter/material.dart';

class CommonHeadingText extends StatelessWidget {
  final String textName;
  const CommonHeadingText({super.key, required this.textName});

  @override
  Widget build(BuildContext context) {
    return Text(textName, style: TextStyle(
      fontFamily: 'Roboto',
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: Theme.of(context).colorScheme.onBackground,
    ),);
  }
}