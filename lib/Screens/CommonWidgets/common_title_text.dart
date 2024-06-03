import 'package:flutter/material.dart';

import '../../Utils/Helper/app_colors.dart';

class CommonTitleText extends StatelessWidget {
  final String heading;
  final String subHeading;

  const CommonTitleText(
      {super.key, required this.heading, required this.subHeading});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 40.0, right: 40),
      child: Column(
        children: [
          Text(
            heading,
            style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 32,
                color: Theme.of(context).colorScheme.onBackground,
                fontWeight: FontWeight.w800),
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            subHeading,
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontFamily: 'Roboto',
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: AppColors.colorSecondaryText2),
          )
        ],
      ),
    );
  }
}
