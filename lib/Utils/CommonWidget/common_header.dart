import 'package:flutter/material.dart';

class CommonHeader extends StatelessWidget {
  final String headingName;

  const CommonHeader({super.key, required this.headingName});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(top: 40, left: 15.0, right: 15.0, bottom: 10),
      child: Row(
        children: [
          InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Image.asset(
                "assets/images/arrow-back.png",
                height: 30,
                width: 30,
              )),
          const SizedBox(width: 10.0),
          Text(
            headingName,
            style: TextStyle(
                color: Theme.of(context).colorScheme.onBackground,
                fontSize: 20.0,
                fontWeight: FontWeight.w500,
                fontFamily: 'Roboto'),
          ),
        ],
      ),
    );
  }
}
