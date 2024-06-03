import 'package:flutter/material.dart';

class DominosIcon extends StatelessWidget {
  final String? iconName;
  final void Function()? onClick;
  final Color? color;
  final double? height;
  final double? width;

  const DominosIcon({
    super.key,
    this.iconName,
    this.onClick,
    this.color,
    this.height = 30.0,
    this.width = 30.0,
  });

  static const String baseIconPath = 'assets/icons';

  static const Map<String, String> IconsMap = <String, String>{
    "home": "home_icon.png",
  };


  @override
  Widget build(BuildContext context) {
    final String? icon = IconsMap[iconName];

    return GestureDetector(
      onTap: onClick,
      child: SizedBox(
        height: height,
        width: width,
        child: Image.asset(
          height: height,
          width: width,
          '$baseIconPath/$icon',

          /// semanticsLabel: iconName,
          color: color,
        ),
      ),
    );
  }
}
