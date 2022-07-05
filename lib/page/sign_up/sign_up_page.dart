import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/formatters/masked_input_formatter.dart';
import 'package:get/get.dart';
import 'package:happymovie/page/login/login_page.dart';
import 'package:happymovie/page/sign_up/controller/signup_controller.dart';
import 'package:happymovie/page/sign_up/verify_otp.dart';
import 'package:happymovie/widgets/controller/textfield_controller.dart';

import '../../widgets/button_widget.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(TextFieldController());
    final _signUpController = Get.put(SignUpController());
    return Obx(
      () => Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color(0xFF252525),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 80),
                child: Center(
                    child: Image.asset(
                  'asset/logo.png',
                  width: 280,
                  height: 280,
                )),
              ),
              const Padding(
                padding:
                    EdgeInsets.only(top: 0, left: 20, right: 0, bottom: 15),
                child: Text(
                  "Please input your real email to be verify:",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.w400),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 0, left: 20, right: 20),
                child: buildTextField(
                    checkInputFT: false,
                    hintText: 'example@mail.com',
                    label: 'Enter your email',
                    txtInput: TextInputType.emailAddress,
                    controller: controller.emailTextController,
                    isEmpty:
                        controller.isEmailText.value.isEmpty ? true : false,
                    focusNode: controller.signInFocus,
                    isFocus: controller.isSignInFocus.value),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
                child: ButtonWidget.roundedButton(
                    title: 'Sign Up',
                    height: 40,
                    backgroundColor: controller.isEmailText.value.isNotEmpty &&
                            EmailValidator.validate(
                                controller.isEmailText.value)
                        ? const Color(0xFFFFD700)
                        : const Color(0xFFC2C2C2),
                    textStyle: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                    onTap: () async {
                      FocusScope.of(context).unfocus();
                      debugPrint(controller.isEmailText.value);
                      _signUpController.emailText.value =
                          controller.isEmailText.value;
                      await _signUpController.isExistingUerApi(context,
                          username: controller.isEmailText.value);
                      if (_signUpController.isExisting.value != true &&
                          controller.isEmailText.value.isNotEmpty &&
                          EmailValidator.validate(
                              controller.isEmailText.value)) {
                        _signUpController.getOtpByEmail(context,
                            email: controller.isEmailText.value);
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => VerifyOtpPage(
                                    email: controller.isEmailText.value,
                                    otpHash: '',
                                  )),
                        );
                      }
                    }),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
                child: Center(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginPage()),
                      );
                    },
                    child: const Text(
                      "Already have an account? Sign In",
                      style: TextStyle(color: Color(0xFFFFD700), fontSize: 15),
                    ),
                  ),
                ),
              )
            ]),
      ),
    );
  }
}

buildTextField({
  TextInputType? txtInput,
  bool? checkInputFT,
  String? formatter = '',
  TextEditingController? controller,
  String? hintText,
  String? label,
  VoidCallback? onTap,
  FocusNode? focusNode,
  bool? isFocus = false,
  bool? isEmpty = true,
}) {
  var con = Get.put(TextFieldController());
  debugPrint('isFocus=$isFocus');
  debugPrint('isEMpty=$isEmpty');
  return Container(
    //width: 335,
    height: 44,
    //margin: EdgeInsets.only(left: 5),
    decoration: BoxDecoration(
      color: isEmpty! && isFocus != true
          ? const Color(0xFFFFFFFF)
          : const Color(0xFF252525),
      //     ? const Color(0xFF252525)
      //     : isFocus! && controller.text.isEmpty
      //         ? const Color(0xFF252525)
      //         : const Color(0xFFFFFFFF),
      borderRadius: BorderRadius.circular(10),
    ),
    child: TextFormField(
      style: TextStyle(
          color: isFocus! || isEmpty != true ? Colors.white : Colors.black),
      // textInputAction: TextInputAction.emergencyCall,

      //focusNode: con.getFocusNode.value,
      keyboardType: txtInput,
      inputFormatters: checkInputFT!
          ? [
              // MaskedInputFormatter('(###) ###-####')formatter
              MaskedInputFormatter('$formatter'),
            ]
          : null,
      //focusNode: myFocusNode,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      //initialValue: 'Input text',
      // onTap: () {
      //   con.isFocus = true;
      //   debugPrint("clicked! ${con.isFocus}");
      //   con.update();
      // },
      focusNode: focusNode,
      onChanged: ((value) {
        con.isEmailText.value = value;
        debugPrint("EmailText${con.isEmailText.value}");
      }),
      //   con.update();
      // }),
      //onChanged: onChange,
      controller: controller,
      //focusNode: con.focus,

      decoration: InputDecoration(
        // filled: isEmpty! ? true : false,
        // fillColor: const Color(0xFFFFFFFF),
        labelText: '$label',
        labelStyle: TextStyle(
            color: isFocus || isEmpty != true ? Colors.white : Colors.black,
            fontSize: 13),
        hintText: '$hintText',
        hintStyle: const TextStyle(color: Colors.white, fontSize: 13),
        // errorText:
        //     con.checkValidation() ? '$label Can\'t Be Empty' : null,
        prefix: checkInputFT
            ? Text(
                '(+855) ',
                style: TextStyle(
                    color: isFocus || isEmpty != true
                        ? Colors.white
                        : Colors.black),
              )
            : null,
        contentPadding: const EdgeInsets.only(
          left: 18,
        ),
        //errorText: 'Error message',
        // border: con.isEmpty(controller)
        //     ? OutlineInputBorder(borderRadius: BorderRadius.circular(10))
        //     : InputBorder.none,
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 3, color: Color(0xFFFFD700)),
          borderRadius: BorderRadius.circular(15),
        ),
        enabledBorder: isEmpty != true
            ? OutlineInputBorder(
                borderSide:
                    const BorderSide(width: 3, color: Color(0xFFFFD700)),
                borderRadius: BorderRadius.circular(15),
              )
            : InputBorder.none,
        disabledBorder: isEmpty != true || isFocus != true
            ? OutlineInputBorder(
                borderSide:
                    const BorderSide(width: 3, color: Color(0xFFFFD700)),
                borderRadius: BorderRadius.circular(15),
              )
            : InputBorder.none,

        //con.isfocus! ? OutlineInputBorder() :
        // suffixIcon: Icon(
        //   Icons.error,
        // ),
      ),
    ),
  );
}
