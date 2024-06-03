import 'package:assignment_product_list/Screens/Home/View/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';
import '../../../Utils/CommonWidget/common_button.dart';
import '../../../Utils/Helper/app_colors.dart';
import '../../../Utils/Helper/screen_utils.dart';
import '../../CommonWidgets/common_title_text.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  String Otp = " ";

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    double containerWidth = screenSize.height;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding:
            const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20, top: 80),
        child: SizedBox(
          width: ScreenUtils().screenWidth(context),
          height: ScreenUtils().screenHeight(context),
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
                padding: const EdgeInsets.only(top: 18.0, left: 18, right: 18),
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
              Padding(
                padding: const EdgeInsets.only(top: 28.0, left: 18, right: 18),
                child: Row(
                  children: [
                    RichText(
                        text: const TextSpan(
                      children: [
                        TextSpan(
                            text: "  ",
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Roboto',
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                            )),
                      ],
                    )),
                  ],
                ),
              ),
              CommonButton(
                onClicked: () => {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const HomeScreen()),
                  )
                },
                label: "Verify",
                buttonHeight: containerWidth * 0.06,
                buttonWidth: containerWidth * 0.8,
                fontSize: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
