import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:happymovie/page/sign_up/controller/signup_controller.dart';
import 'package:happymovie/page/sign_up/sign_up_page.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';

import '../../widgets/button_widget.dart';

class VerifyOtpPage extends StatelessWidget {
  final String? email;
  final String? otpHash;
  const VerifyOtpPage({Key? key, this.email = '', this.otpHash = ''})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _signUpController = Get.put(SignUpController());
    _signUpController.myFocusNode = FocusNode();
    _signUpController.myFocusNode.requestFocus();

    return Scaffold(
      backgroundColor: const Color(0xFF252525),
      body: Stack(
        children: [
          Positioned(
            left: 20,
            top: 70,
            child: ButtonWidget.circleIconButton(
                icon: Icons.arrow_back,
                iconColor: const Color(0xFF252525),
                backgroundColor: Colors.white,
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignUpPage()));
                }),
          ),
          Column(children: [
            Padding(
              padding: const EdgeInsets.only(top: 78),
              child: Center(
                  child: Image.asset(
                'asset/logo.png',
                width: 250,
                height: 250,
              )),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 0),
              child: Text(
                'OTP Verification',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                      text: 'Enter OTP code sent to your mobile',
                      style: const TextStyle(
                          color: Color.fromARGB(255, 195, 195, 195),
                          fontSize: 14),
                      children: [
                        WidgetSpan(
                            child: Container(
                          padding: const EdgeInsets.only(top: 5),
                          child: Text(
                              email!.isNotEmpty
                                  ? 'Your mail is: $email'
                                  : 'Your email@gmail.com',
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 195, 195, 195),
                                  fontSize: 14)),
                        )),
                        // TextSpan(

                        //   text: email!.isNotEmpty
                        //       ? 'Your mail is: $email'
                        //       : 'Your email@gmail.com',
                        //   style: const TextStyle(
                        //       color: Color.fromARGB(255, 195, 195, 195),
                        //       fontSize: 14),
                        // )
                      ]),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
              child: OTPTextField(
                length: 4,
                width: MediaQuery.of(context).size.width,
                fieldWidth: 80,
                style: const TextStyle(fontSize: 17, color: Colors.white),
                textFieldAlignment: MainAxisAlignment.spaceAround,
                fieldStyle: FieldStyle.underline,
                otpFieldStyle: OtpFieldStyle(
                  borderColor: Colors.white,
                  enabledBorderColor: Colors.white,
                  focusBorderColor: const Color(0xFFFFD700),
                ),
                onChanged: (code) {
                  if (code.length == _signUpController.otpCodeLength.value) {
                    FocusScope.of(context).requestFocus(FocusNode());
                    debugPrint(
                        "fromOnchange:::" + _signUpController.emailText.value);
                    _signUpController.verifyOTP(context,
                        email: _signUpController.emailText.value,
                        otp: code,
                        hash: _signUpController.hash.value);
                  }
                },
                onCompleted: (pin) {
                  debugPrint("Completed: " + pin);
                },
              ),

              // PinFieldAutoFill(
              //   decoration: const UnderlineDecoration(
              //     textStyle: TextStyle(
              //       fontSize: 20,
              //     ),
              //     colorBuilder: FixedColorBuilder(
              //       Colors.white,
              //     ),
              //   ),
              //   currentCode: _signUpController.otpCode.value,
              //   codeLength: _signUpController.otpCodeLength.value,
              //   onCodeChanged: (code) {
              //     if (code!.length == _signUpController.otpCodeLength.value) {
              //       FocusScope.of(context).requestFocus(FocusNode());
              //       debugPrint('asdsadas');
              //     }
              //   },
            ),
            TweenAnimationBuilder<Duration>(
                duration: const Duration(minutes: 5),
                tween: Tween(
                    begin: const Duration(minutes: 5), end: Duration.zero),
                onEnd: () {
                  debugPrint('Timer ended');
                },
                builder: (BuildContext context, Duration value, Widget? child) {
                  final minutes = value.inMinutes;
                  final seconds = value.inSeconds % 60;
                  return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Text(
                          seconds < 10
                              ? '$minutes:${seconds}0'
                              : '$minutes:$seconds',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 14)));
                }),
          ]),
        ],
      ),
    );
  }
}
