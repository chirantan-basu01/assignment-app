import 'package:firebase_auth/firebase_auth.dart';

import 'package:assignment_product_list/Screens/Auth/View/otp_screen.dart';
import 'package:flutter/material.dart';

import '../../../Utils/CommonWidget/common_button.dart';
import '../../../Utils/CommonWidget/common_inputfield.dart';
import '../../CommonWidgets/common_title_text.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    double containerWidth = screenSize.height;

    TextEditingController phoneController = TextEditingController();
    final FirebaseAuth _auth = FirebaseAuth.instance;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 80.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: containerWidth * 0.2,
                child: Image.asset('assets/images/splash_screen.png'),
              ),
              const CommonTitleText(
                heading: 'LOG IN',
                subHeading: 'Log in to continue',
              ),
              const SizedBox(
                height: 30,
              ),
              const SizedBox(height: 5),
              CommonTextFormField(
                controller: phoneController,
                hintText: " Type your phone number with +91",
              ),
              const SizedBox(height: 20),
              CommonButton(
                onClicked: () async {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => OtpScreen(verificationid: '',),
                  //   ),
                  // );

                  await _auth.verifyPhoneNumber(
                    verificationCompleted: (PhoneAuthCredential credential) {},
                    verificationFailed: (FirebaseAuthException ex) {},
                    codeSent: (String verificationid, int? resendtoken) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OtpScreen(verificationid: verificationid,),
                        ),
                      );
                    },
                    codeAutoRetrievalTimeout: (String verificationId) {},
                    phoneNumber: phoneController.text.toString(),
                  );
                },
                label: "Login",
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
