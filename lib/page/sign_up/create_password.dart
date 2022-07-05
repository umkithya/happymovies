import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/formatters/masked_input_formatter.dart';
import 'package:get/get.dart';
import 'package:happymovie/widgets/controller/textfield_controller.dart';

import '../../widgets/button_widget.dart';
import 'controller/signup_controller.dart';

class CreatePasswordPage extends StatelessWidget {
  const CreatePasswordPage({Key? key}) : super(key: key);

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
                padding: const EdgeInsets.only(top: 70),
                child: Center(
                    child: Image.asset(
                  'asset/logo.png',
                  width: 250,
                  height: 250,
                )),
              ),
              const Padding(
                padding:
                    EdgeInsets.only(top: 0, left: 20, right: 0, bottom: 20),
                child: Text(
                  "Create your password:",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 0, left: 20, right: 20),
                child: buildPasswordTextField(
                    hintText: 'Password',
                    label: 'Password',
                    txtInput: TextInputType.text,
                    controller: controller.passTextController,
                    isEmpty: controller.isPassText.value.isEmpty ? true : false,
                    focusNode: controller.passFocus,
                    isFocus: controller.isPassFocus.value,
                    onChanged: ((value) {
                      controller.isPassText.value = value;
                    }),
                    isHidePass: _signUpController.isHidePass.value,
                    onTap: () {
                      _signUpController.isHidePass.value =
                          !_signUpController.isHidePass.value;
                    }),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                child: buildPasswordComfirmTextField(
                    hintText: 'Comfirm Password',
                    label: 'Comfirm Password',
                    txtInput: TextInputType.text,
                    controller: controller.passComfirmTextController,
                    isEmpty: controller.isPassComfirmText.value.isEmpty
                        ? true
                        : false,
                    focusNode: controller.passComfirmFocus,
                    isFocus: controller.isPassComfirmFocus.value,
                    onChanged: (value) {
                      controller.isPassComfirmText.value = value;
                    },
                    onTap: () {
                      _signUpController.isHideComfirmPass.value =
                          !_signUpController.isHideComfirmPass.value;
                    },
                    isHidePass: _signUpController.isHideComfirmPass.value),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
                child: ButtonWidget.roundedButton(
                    title: 'Create Password',
                    height: 40,
                    backgroundColor: controller.checkPasswordValidation()
                        ? const Color(0xFFFFD700)
                        : const Color(0xFFC2C2C2),
                    textStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    onTap: () {
                      if (controller.checkPasswordValidation()) {
                        _signUpController.createPasswordApi(context,
                            username: _signUpController.emailText.value,
                            password: controller.isPassText.value);
                      }
                    }),
              ),
              // const Center(
              //   child: Padding(
              //     padding: EdgeInsets.only(top: 30, left: 20, right: 20),
              //     child: Text(
              //       "Create an password to be continue",
              //       style: TextStyle(color: Colors.white, fontSize: 15),
              //     ),
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.only(top: 24),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Icon(
                        Icons.check_circle,
                        color: controller.isPassText.value.length > 4
                            ? const Color(0xFFFFD700)
                            : const Color(0xFFC2C2C2),
                        size: 14,
                      ),
                    ),
                    const SizedBox(
                      width: 13,
                    ),
                    Text(
                      "Must have 5-18 characters",
                      style: TextStyle(
                          color: controller.isPassText.value.length > 4
                              ? const Color(0xFFFFD700)
                              : const Color(0xFFC2C2C2),
                          fontSize: 13),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Icon(
                        Icons.check_circle,
                        color: controller.isPassText.value
                                .toLowerCase()
                                .contains(RegExp(r'^(?=.*?[a-z])(?=.*?[0-9])'))
                            ? const Color(0xFFFFD700)
                            : const Color(0xFFC2C2C2),
                        size: 13,
                      ),
                    ),
                    const SizedBox(
                      width: 14,
                    ),
                    Text(
                      "Must have at least 1 number & 1 letter",
                      style: TextStyle(
                          color: controller.isPassText.value
                                  .toLowerCase()
                                  .contains(
                                      RegExp(r'^(?=.*?[a-z])(?=.*?[0-9])'))
                              ? const Color(0xFFFFD700)
                              : const Color(0xFFC2C2C2),
                          fontSize: 13),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Icon(
                        Icons.check_circle,
                        color: !controller.isPassText.value.contains(' ')
                            ? const Color(0xFFFFD700)
                            : const Color(0xFFC2C2C2),
                        size: 14,
                      ),
                    ),
                    const SizedBox(
                      width: 13,
                    ),
                    Text(
                      "Must not have spaces",
                      style: TextStyle(
                          color: !controller.isPassText.value.contains(' ')
                              ? const Color(0xFFFFD700)
                              : const Color(0xFFC2C2C2),
                          fontSize: 13),
                    )
                  ],
                ),
              ),
            ]),
      ),
    );
  }
}

buildPasswordTextField(
    {TextInputType? txtInput,
    bool? checkInputFT = false,
    String? formatter = '',
    TextEditingController? controller,
    String? hintText,
    String? label,
    VoidCallback? onTap,
    FocusNode? focusNode,
    bool? isFocus = false,
    bool? isEmpty = true,
    void Function(String)? onChanged,
    bool? isHidePass = true}) {
  var con = Get.put(TextFieldController());

  return Container(
    //width: 335,
    height: 44,
    //margin: EdgeInsets.only(left: 5),
    decoration: BoxDecoration(
      color: con.isPassText.value.isEmpty && focusNode!.hasFocus != true
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
          color: isFocus! || con.isPassText.value.isEmpty != true
              ? Colors.white
              : Colors.black),
      // textInputAction: TextInputAction.emergencyCall,
      obscureText: isHidePass!,
      obscuringCharacter: '⬤',
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
      onChanged: onChanged,

      //   con.update();
      // }),
      //onChanged: onChange,
      controller: controller,
      //focusNode: con.focus,
      onFieldSubmitted: (v) {},
      decoration: InputDecoration(
        suffix: GestureDetector(
          onTap: onTap,
          child: isHidePass
              ? const Icon(
                  Icons.visibility_off_outlined,
                  color: Color(0xFFFFD700),
                )
              : const Icon(
                  Icons.visibility_outlined,
                  color: Color(0xFFFFD700),
                ),
        ),

        labelText: '$label',
        labelStyle: TextStyle(
            color: isFocus || con.isPassText.value.isEmpty != true
                ? Colors.white
                : Colors.black,
            fontWeight: FontWeight.w800),
        hintText: '$hintText',
        hintStyle: const TextStyle(color: Colors.white),

        prefix: checkInputFT
            ? Text(
                '(+855) ',
                style: TextStyle(
                    color: isFocus || con.isPassText.value.isEmpty != true
                        ? Colors.white
                        : Colors.black),
              )
            : null,
        contentPadding: const EdgeInsets.only(
          left: 18,
          right: 18,
        ),

        //errorText: 'Error message',
        // border: con.isEmpty(controller)
        //     ? OutlineInputBorder(borderRadius: BorderRadius.circular(10))
        //     : InputBorder.none,
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 3, color: Color(0xFFFFD700)),
          borderRadius: BorderRadius.circular(15),
        ),
        border: con.isPassText.value.isNotEmpty
            ? OutlineInputBorder(
                borderSide: const BorderSide(width: 3, color: Colors.white),
                borderRadius: BorderRadius.circular(15),
              )
            : InputBorder.none,

        enabledBorder: con.isPassText.value.isNotEmpty
            ? OutlineInputBorder(
                borderSide:
                    const BorderSide(width: 3, color: Color(0xFFFFD700)),
                borderRadius: BorderRadius.circular(15),
              )
            : InputBorder.none,
        // disabledBorder: isEmpty == true || isFocus != true
        //     ? OutlineInputBorder(
        //         borderSide: const BorderSide(width: 3, color: Colors.white),
        //         borderRadius: BorderRadius.circular(15),
        //       )
        //     : InputBorder.none,

        //con.isfocus! ? OutlineInputBorder() :
        // suffixIcon: Icon(
        //   Icons.error,
        // ),
      ),
    ),
  );
}

buildPasswordComfirmTextField(
    {TextInputType? txtInput,
    bool? checkInputFT = false,
    String? formatter = '',
    TextEditingController? controller,
    String? hintText,
    String? label,
    VoidCallback? onTap,
    FocusNode? focusNode,
    bool? isFocus = false,
    bool? isEmpty = true,
    void Function(String)? onChanged,
    bool? isHidePass = true}) {
  var con = Get.put(TextFieldController());

  return Container(
    //width: 335,
    height: 44,
    //margin: EdgeInsets.only(left: 5),
    decoration: BoxDecoration(
      color: con.isPassComfirmText.value.isEmpty && focusNode!.hasFocus != true
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
          color: isFocus! || con.isPassComfirmText.value.isEmpty != true
              ? Colors.white
              : Colors.black),
      // textInputAction: TextInputAction.emergencyCall,
      obscureText: isHidePass!,
      obscuringCharacter: '⬤',
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
      onChanged: onChanged,

      //   con.update();
      // }),
      //onChanged: onChange,
      controller: controller,
      //focusNode: con.focus,
      onFieldSubmitted: (v) {},
      decoration: InputDecoration(
        suffix: GestureDetector(
          onTap: onTap,
          child: isHidePass
              ? const Icon(
                  Icons.visibility_off_outlined,
                  color: Color(0xFFFFD700),
                )
              : const Icon(
                  Icons.visibility_outlined,
                  color: Color(0xFFFFD700),
                ),
        ),

        labelText: '$label',
        labelStyle: TextStyle(
            color: isFocus || con.isPassComfirmText.value.isEmpty != true
                ? Colors.white
                : Colors.black,
            fontWeight: FontWeight.w800),
        hintText: '$hintText',
        hintStyle: const TextStyle(color: Colors.white),

        prefix: checkInputFT
            ? Text(
                '(+855) ',
                style: TextStyle(
                    color:
                        isFocus || con.isPassComfirmText.value.isEmpty != true
                            ? Colors.white
                            : Colors.black),
              )
            : null,
        contentPadding: const EdgeInsets.only(
          left: 18,
          right: 18,
        ),

        //errorText: 'Error message',
        // border: con.isEmpty(controller)
        //     ? OutlineInputBorder(borderRadius: BorderRadius.circular(10))
        //     : InputBorder.none,
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 3, color: Color(0xFFFFD700)),
          borderRadius: BorderRadius.circular(15),
        ),
        border: con.isPassComfirmText.value.isNotEmpty
            ? OutlineInputBorder(
                borderSide: const BorderSide(width: 3, color: Colors.white),
                borderRadius: BorderRadius.circular(15),
              )
            : InputBorder.none,

        enabledBorder: con.isPassComfirmText.value.isNotEmpty
            ? OutlineInputBorder(
                borderSide:
                    const BorderSide(width: 3, color: Color(0xFFFFD700)),
                borderRadius: BorderRadius.circular(15),
              )
            : InputBorder.none,
        // disabledBorder: isEmpty == true || isFocus != true
        //     ? OutlineInputBorder(
        //         borderSide: const BorderSide(width: 3, color: Colors.white),
        //         borderRadius: BorderRadius.circular(15),
        //       )
        //     : InputBorder.none,

        //con.isfocus! ? OutlineInputBorder() :
        // suffixIcon: Icon(
        //   Icons.error,
        // ),
      ),
    ),
  );
}
