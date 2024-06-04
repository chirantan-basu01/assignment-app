import 'dart:developer';

import 'package:assignment_product_list/Screens/Home/View/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../../Utils/CommonWidget/common_button.dart';
import '../../CommonWidgets/common_title_text.dart';

class OtpScreen extends StatefulWidget {
  String verificationid;

  OtpScreen({super.key, required this.verificationid});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    double containerWidth = screenSize.height;

    TextEditingController otpController = TextEditingController();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 100.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CommonTitleText(
              heading: 'Verification Code',
              subHeading: 'Please enter the OTP sent to your mobile',
            ),
            const SizedBox(
              height: 30,
            ),
            TextField(
              controller: otpController,
              decoration: InputDecoration(
                  suffixIcon: const Icon(Icons.phone),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25))),
            ),
            const SizedBox(
              height: 30.0,
            ),
            CommonButton(
              onClicked: () async {
                // Navigator.pushReplacement(
                //   context,
                //   MaterialPageRoute(
                //       builder: (context) => const HomeScreen()),
                // );

                try {
                  PhoneAuthCredential credential = PhoneAuthProvider.credential(
                      verificationId: widget.verificationid,
                      smsCode: otpController.text.trim());
                  FirebaseAuth.instance
                      .signInWithCredential(credential)
                      .then((value) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomeScreen()),
                    );
                  });
                } catch (ex) {
                  log(ex.toString());
                }
              },
              label: "Verify",
              fontSize: 20,
              buttonHeight: containerWidth * 0.06,
              buttonWidth: containerWidth * 0.8,
            ),
          ],
        ),
      ),
    );
  }
}
