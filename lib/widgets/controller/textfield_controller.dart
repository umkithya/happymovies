import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TextFieldController extends GetxController {
  final isRegEmpty = false.obs;
  final isEmailText = "".obs;
  final isPassText = "".obs;
  final isPassComfirmText = "".obs;

  final signPhoneText = ''.obs;
  final enableBtnRegContinue = true.obs;
  final emailTextController = TextEditingController();
  final passTextController = TextEditingController();
  final passComfirmTextController = TextEditingController();
  final signInFocus = FocusNode();
  final passFocus = FocusNode();
  final passComfirmFocus = FocusNode();
  final isSignInFocus = false.obs;
  final isPassFocus = false.obs;
  final isPassComfirmFocus = false.obs;
  bool checkPasswordValidation() {
    if (isPassText.value.length > 4 &&
        isPassText.value
            .toLowerCase()
            .contains(RegExp(r'^(?=.*?[a-z])(?=.*?[0-9])')) &&
        !isPassText.value.contains(' ') &&
        isPassComfirmText.value == isPassText.value) {
      return true;
    }
    return false;
  }

  void _onFocusChange() {
    isSignInFocus.value = signInFocus.hasFocus;
    debugPrint("signInFocus.hasFocus${signInFocus.hasFocus}");
  }

  void _onFocusChange1() {
    isPassFocus.value = passFocus.hasFocus;
    debugPrint("passFocus.hasFocus${passFocus.hasFocus}");
  }

  void _onFocusChange2() {
    isPassComfirmFocus.value = passComfirmFocus.hasFocus;
    debugPrint("passComfirmFocus.hasFocus${passComfirmFocus.hasFocus}");
  }

  @override
  void onInit() {
    signInFocus.addListener(_onFocusChange);
    passFocus.addListener(_onFocusChange1);
    passComfirmFocus.addListener(_onFocusChange2);
    super.onInit();
  }

  ///////////otp
  var otpText = "".obs;
  final otp1 = TextEditingController();
  final otp2 = TextEditingController();
  final otp3 = TextEditingController();
  final otp4 = TextEditingController();
}
