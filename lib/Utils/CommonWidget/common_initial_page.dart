import 'package:flutter/material.dart';

class CommonInitialPage extends StatelessWidget {
  final String? titleText;
  final String? subtitleText;
  final String? image;

  const CommonInitialPage({
    super.key,
    this.titleText,
    this.subtitleText,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    double containerWidth = screenSize.width;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 30.0, right: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: containerWidth * 0.7,
                    width: containerWidth * 0.5,
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.onBackground,
                        borderRadius: const BorderRadius.all(Radius.circular(55)),
                        boxShadow: [
                          BoxShadow(
                            color: Theme.of(context).colorScheme.onBackground,
                            spreadRadius: 3,
                            blurRadius: 1,
                            offset: const Offset(0, 1),
                          ),
                        ]),
                  ),
                  Image.asset(
                    image ?? "",
                    height: containerWidth * 0.7,
                    width: containerWidth * 0.5,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              titleText ?? "",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 32.0,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.onBackground,
                  fontFamily: 'Roboto'),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              subtitleText ?? "",
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontFamily: "Roboto",
                  fontWeight: FontWeight.w500,
                  fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
