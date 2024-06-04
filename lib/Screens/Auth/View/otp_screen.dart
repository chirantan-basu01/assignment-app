import 'package:assignment_product_list/Screens/Home/View/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';
import '../../../Utils/CommonWidget/common_button.dart';
import '../../../Utils/Helper/app_colors.dart';
import '../../CommonWidgets/common_title_text.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  String Otp = "";

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    double containerWidth = screenSize.height;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding:
            const EdgeInsets.symmetric(horizontal: 20.0,vertical: 100.0),
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: OTPTextField(
                length: 6,
                width: MediaQuery.of(context).size.width,
                fieldWidth: 50,
                otpFieldStyle: OtpFieldStyle(
                  focusBorderColor: AppColors.primaryButtonColor,
                ),
                style: const TextStyle(fontSize: 17),
                textFieldAlignment: MainAxisAlignment.spaceAround,
                fieldStyle: FieldStyle.box,
                onChanged: (pin) {
                  Otp = pin;
                },
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            CommonButton(
              onClicked: () => {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()),
                )
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
