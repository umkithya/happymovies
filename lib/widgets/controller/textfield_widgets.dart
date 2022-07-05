// // ignore_for_file: avoid_print

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:get/get.dart';
// import 'package:flutter_multi_formatter/formatters/masked_input_formatter.dart';
// import 'package:happymovie/widgets/controller/textfield_controller.dart';
// import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

// // import 'controller/textfield_controller.dart';
// // import 'package:intl/intl.dart';

// class TextFieldWidgets {
//   Widget buildTextField({
//     TextInputType? txtInput,
//     bool? checkInputFT,
//     String? formatter = '',
//     TextEditingController? controller,
//     String? hintText,
//     String? label,
//     VoidCallback? onTap,
//     FocusNode? focusNode,
//     bool? isFocus = false,
//   }) {
//     // var con = Get.put(TextFieldController());

//     return Container(
//       //width: 335,
//       height: 44,
//       //margin: EdgeInsets.only(left: 5),
//       decoration: BoxDecoration(
//         color: controller!.text.isNotEmpty
//             ? const Color(0xFF252525)
//             : isFocus!
//                 ? const Color(0xFF252525)
//                 : const Color(0xFFFFFFFF),
//         borderRadius: BorderRadius.circular(10),
//       ),
//       child: TextFormField(
//         // textInputAction: TextInputAction.emergencyCall,

//         //focusNode: con.getFocusNode.value,
//         keyboardType: txtInput,
//         inputFormatters: checkInputFT!
//             ? [
//                 // MaskedInputFormatter('(###) ###-####')formatter
//                 MaskedInputFormatter('$formatter'),
//               ]
//             : null,
//         //focusNode: myFocusNode,
//         autovalidateMode: AutovalidateMode.onUserInteraction,
//         //initialValue: 'Input text',
//         // onTap: () {
//         //   con.isFocus = true;
//         //   debugPrint("clicked! ${con.isFocus}");
//         //   con.update();
//         // },
//         focusNode: focusNode,
//         onChanged: ((value) {
//           debugPrint("in and out");
//           // if (controller.text.length < 8) {
//           //   debugPrint("Not correct phone number");

//           //   con.txtPhoneRegValidate.value = true;
//           // } else {
//           //   debugPrint("phone number is correct");
//           //   con.txtPhoneRegValidate.value = false;

//           //   // con.unHideButton.value = true;
//           // }
//           // if (value.isNotEmpty) {
//           //   con.unHideButton.value = false;
//           // }
//           // debugPrint("${controller!.text}");
//           // con.checkValidation();
//           // con.update();
//         }),
//         //   con.update();
//         // }),
//         //onChanged: onChange,
//         controller: controller,
//         //focusNode: con.focus,
//         style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
//         decoration: InputDecoration(
//             filled: controller.text.isNotEmpty ? true : false,
//             fillColor: const Color(0xFFFFFFFF),
//             labelText: '$label',
//             labelStyle: const TextStyle(color: Colors.black),
//             hintText: '$hintText',
//             // errorText:
//             //     con.checkValidation() ? '$label Can\'t Be Empty' : null,
//             prefix: checkInputFT
//                 ? const Text(
//                     '(+855) ',
//                     style: TextStyle(color: Colors.black),
//                   )
//                 : null,
//             contentPadding: const EdgeInsets.only(
//               left: 18,
//             ),
//             //errorText: 'Error message',
//             // border: con.isEmpty(controller)
//             //     ? OutlineInputBorder(borderRadius: BorderRadius.circular(10))
//             //     : InputBorder.none,
//             enabledBorder: controller.text.isNotEmpty 
//                 ? OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10),
//                     borderSide: const BorderSide(width: 1, color: Colors.white),
//                   )
//                 : InputBorder.none,
//             focusedBorder: OutlineInputBorder(
//               borderSide: const BorderSide(width: 3, color: Colors.white),
//               borderRadius: BorderRadius.circular(15),
//             )
//             //con.isfocus! ? OutlineInputBorder() :
//             // suffixIcon: Icon(
//             //   Icons.error,
//             // ),
//             ),
//       ),
//     );
//   }

//   // static internationalPhone({
//   //   TextEditingController? controller,
//   //   Color? primaryColor = Colors.white,
//   // }) {
//   //   var con = Get.put(MyController());

//   //   // String initialCountry = 'KH';
//   //   PhoneNumber number = PhoneNumber(isoCode: 'KH');
//   //   return InternationalPhoneNumberInput(
//   //     cursorColor: Colors.white,
//   //     inputDecoration: InputDecoration(
//   //       prefix: const Text(
//   //         '(+855) ',
//   //         style: TextStyle(color: Colors.white),
//   //       ),
//   //       hintText: "Phone Number",
//   //       hintStyle: const TextStyle(color: Colors.white),
//   //       label: const Text(
//   //         "Phone Number",
//   //         style: TextStyle(color: Colors.white),
//   //       ),
//   //       filled: true,
//   //       fillColor: controller!.text.isNotEmpty
//   //           ? Colors.transparent
//   //           : const Color(0xFF2B2F7E),
//   //       // border: con.isEmpty(controller)
//   //       //     ? OutlineInputBorder(
//   //       //         borderRadius: BorderRadius.circular(10),
//   //       //       )
//   //       //     : InputBorder.none,
//   //       border: OutlineInputBorder(
//   //         borderRadius: BorderRadius.circular(10),
//   //       ),
//   //     ),
//   //     onInputChanged: (PhoneNumber number) {
//   //       print(number.phoneNumber);
//   //     },
//   //     onInputValidated: (bool value) {
//   //       print(value);
//   //     },

//   //     selectorConfig: const SelectorConfig(
//   //       selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
//   //     ),
//   //     ignoreBlank: false,
//   //     autoValidateMode: AutovalidateMode.disabled,
//   //     selectorTextStyle: TextStyle(color: primaryColor),
//   //     initialValue: number,
//   //     textFieldController: controller,
//   //     formatInput: true,
//   //     textStyle: const TextStyle(color: Colors.white),
//   //     keyboardType:
//   //         const TextInputType.numberWithOptions(signed: true, decimal: true),
//   //     // inputBorder:
//   //     inputBorder: const OutlineInputBorder(),
//   //     onSaved: (PhoneNumber number) {
//   //       print('On Saved: $number');
//   //     },
//   //   );
//   // }
//   static Widget passwordTextField(
//       {Color? primaryColor = Colors.white,
//       Color? secondaryColor = Colors.black,
//       bool? isEmpty = true,
//       // TextInputType? txtInput,
//       // bool? checkInputFT,
//       // String? formatter = '',
//       TextEditingController? controller,
//       String? hintText = "Password",
//       String? label = "Password",
//       void Function()? onTap,
//       bool? isHide = true,
//       void Function(String)? onChanged,
//       void Function(String)? onFieldSubmitted}) {
//     // final con = Get.put(MyController());

//     return Container(
//       //width: 335,
//       // height: 44,
//       //margin: EdgeInsets.only(left: 5),
//       decoration: BoxDecoration(
//         color: isEmpty! ? const Color(0xFF2B2F7E) : Colors.transparent,
//         borderRadius: BorderRadius.circular(8),
//       ),
//       child: TextFormField(
//         controller: controller,
//         autovalidateMode: AutovalidateMode.onUserInteraction,
//         obscureText: isHide!,
//         obscuringCharacter: '⬤',
//         onFieldSubmitted: onFieldSubmitted,
//         onChanged: onChanged,
//         style: TextStyle(
//             fontSize: 15, fontWeight: FontWeight.w500, color: secondaryColor!),
//         decoration: InputDecoration(
//           suffix: GestureDetector(
//             onTap: onTap,
//             child: isHide
//                 ? const Icon(
//                     Icons.visibility_off_outlined,
//                     color: Colors.grey,
//                   )
//                 : const Icon(
//                     Icons.visibility_outlined,
//                     color: Colors.grey,
//                   ),
//           ),
//           labelText: '$label',
//           labelStyle: TextStyle(color: secondaryColor),
//           hintText: '$hintText',
//           hintStyle: TextStyle(color: secondaryColor),
//           contentPadding: const EdgeInsets.only(left: 18, right: 18),
//           enabledBorder: isEmpty != true
//               ? OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(10),
//                   borderSide: const BorderSide(width: 1, color: Colors.white),
//                 )
//               : InputBorder.none,
//           disabledBorder: isEmpty
//               ? InputBorder.none
//               : OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(10),
//                   borderSide: const BorderSide(width: 1, color: Colors.white),
//                 ),
//           focusedBorder: OutlineInputBorder(
//             borderSide: BorderSide(width: 1, color: secondaryColor),
//             borderRadius: BorderRadius.circular(10),
//           ),
//         ),
//         cursorColor: Colors.white,
//       ),
//     );
//   }

//   static Widget passwordTextFieldv2(
//       {Color? primaryColor = Colors.white,
//       Color? secondaryColor = Colors.black,
//       Color? textInputColor = Colors.white,
//       bool? isEmpty = true,
//       // TextInputType? txtInput,
//       // bool? checkInputFT,
//       // String? formatter = '',
//       TextEditingController? controller,
//       String? hintText = "Password",
//       String? label = "Password",
//       void Function()? onTap,
//       bool? isHide = true,
//       bool? isFocus = false,
//       FocusNode? focusNode,
//       void Function(String)? onChanged,
//       void Function(String)? onFieldSubmitted}) {
//     // final con = Get.put(MyController());

//     return Container(
//       //width: 335,
//       // height: 44,
//       //margin: EdgeInsets.only(left: 5),
//       decoration: BoxDecoration(
//         color: controller!.text.isEmpty && !isFocus!
//             ? primaryColor
//             : Colors.transparent,
//         borderRadius: BorderRadius.circular(8),
//       ),
//       child: TextFormField(
//         focusNode: focusNode,
//         controller: controller,
//         autovalidateMode: AutovalidateMode.onUserInteraction,
//         obscureText: isHide!,
//         obscuringCharacter: '⬤',
//         onFieldSubmitted: onFieldSubmitted,
//         onChanged: onChanged,
//         style: TextStyle(
//             fontSize: 14, fontWeight: FontWeight.w500, color: textInputColor!),
//         decoration: InputDecoration(
//           suffix: GestureDetector(
//             onTap: onTap,
//             child: isHide
//                 ? const Icon(
//                     Icons.visibility_off_outlined,
//                     color: Colors.grey,
//                   )
//                 : const Icon(
//                     Icons.visibility_outlined,
//                     color: Colors.grey,
//                   ),
//           ),
//           label: Text.rich(TextSpan(
//               text: label,
//               style: TextStyle(
//                   color: isFocus! || controller.text.isNotEmpty
//                       ? Colors.white
//                       : const Color(0xFF333333)),
//               children: const [
//                 TextSpan(text: '*', style: TextStyle(color: Color(0xFFDA1414)))
//               ])),
//           hintText: '$hintText',
//           hintStyle:
//               TextStyle(color: isFocus ? textInputColor : secondaryColor),
//           contentPadding: const EdgeInsets.only(left: 18, right: 18),
//           enabledBorder: controller.text.isNotEmpty
//               ? OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(10),
//                   borderSide: const BorderSide(width: 1, color: Colors.white),
//                 )
//               : InputBorder.none,
//           disabledBorder: controller.text.isEmpty
//               ? InputBorder.none
//               : OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(10),
//                   borderSide: const BorderSide(width: 1, color: Colors.white),
//                 ),
//           focusedBorder: OutlineInputBorder(
//             borderSide: BorderSide(width: 1, color: primaryColor!),
//             borderRadius: BorderRadius.circular(10),
//           ),
//         ),
//         cursorColor: textInputColor,
//       ),
//     );
//   }

//   static Widget phoneNumberv2({
//     Color? primaryColor = Colors.white,
//     Color? secondaryColor = Colors.black,
//     Color? textInputColor = Colors.black,

//     // TextInputType? txtInput,
//     // bool? checkInputFT,
//     // String? formatter = '',
//     TextEditingController? controller,
//     String? hintText = "Phone Number",
//     String? label = "Phone Number",
//     //VoidCallback? onTap,
//     //FocusNode? focusNode,
//     //bool? isFocus,
//   }) {
//     var con = Get.put(TextFieldController());
//     var maskFormatter = MaskTextInputFormatter(
//         mask: '### ### ####',
//         filter: {"#": RegExp(r'[0-9]')},
//         type: MaskAutoCompletionType.lazy);
//     return Obx(
//       () => Container(
//         //width: 335,
//         // height: 44,
//         //margin: EdgeInsets.only(left: 5),
//         decoration: BoxDecoration(
//           color: controller!.text.isEmpty ? primaryColor : Colors.transparent,
//           borderRadius: BorderRadius.circular(8),
//         ),
//         child: TextFormField(
//           // textInputAction: TextInputAction.emergencyCall,

//           //focusNode: con.getFocusNode.value,
//           keyboardType: TextInputType.number,
//           inputFormatters: [
//             // MaskedInputFormatter('(###) ###-####')formatter
//             MaskedInputFormatter('000 000 0000'),
//             // CardFormater();
//             // maskFormatter,
//             LengthLimitingTextInputFormatter(12),
//           ],
//           autovalidateMode: AutovalidateMode.onUserInteraction,

//           onChanged: ((value) {
//             if (value.isEmpty) {
//               con.isRegEmpty.value = true;
//             } else {
//               con.isRegEmpty.value = false;
//             }
//             con.regPhoneNumberText.value = value;
//             con.regPhoneNumberText.value =
//                 con.regPhoneNumberText.value.removeAllWhitespace;
//             // if (value.length > 9) {
//             //   con.enableBtnRegContinue.value = true;
//             // } else {
//             //   con.enableBtnRegContinue.value = false;
//             // }
//             //debugPrint("in and out");
//             // if (value.isNotEmpty) {
//             //   debugPrint("text is not empty");
//             //   con.isEmpty.value = false;
//             // } else {
//             //   debugPrint("text is empty");
//             //   con.isEmpty.value = true;
//             // }
//             ///////////////////
//             // ignore: unrelated_type_equality_checks
//             // if (value.length > 8) {
//             //   String tempText = "";
//             //   if (controller.text[0] != 0) {
//             //     //debugPrint("Is not zero at first = true");

//             //     tempText = value;
//             //     controller.text = "";
//             //     controller.text = "0" + value;
//             //     debugPrint(controller.text);
//             //   }
//             // }

//             // if (value.length < 8) {
//             //   //85 748 005
//             //   con.enableBtnRegContinue.value = false;
//             // } else {
//             //   con.enableBtnRegContinue.value = true;
//             // }
//             // if (controller.text.length < 8) {
//             //   debugPrint("Not correct phone number");

//             //   con.txtPhoneRegValidate.value = true;
//             // } else {
//             //   debugPrint("phone number is correct");
//             //   con.txtPhoneRegValidate.value = false;

//             //   // con.unHideButton.value = true;
//             // }
//             // if (value.isNotEmpty) {
//             //   con.unHideButton.value = false;
//             // }
//             // debugPrint("${controller!.text}");
//             // con.checkValidation();
//             // con.update();
//           }),
//           // focusNode: focusNode,
//           //   con.update();
//           // }),
//           //onChanged: onChange,
//           controller: controller,
//           //0857480055
//           // maxLength: 10,
//           //focusNode: con.focus,
//           style: TextStyle(
//               fontSize: 14,
//               fontWeight: FontWeight.w500,
//               color: textInputColor!),
//           decoration: InputDecoration(
//               // filled: true,
//               // fillColor: controller!.text.isNotEmpty
//               //     ? Colors.transparent
//               //     : const Color(0xFF2B2F7E),
//               labelText: '$label',
//               labelStyle: TextStyle(color: textInputColor),
//               hintText: '$hintText',
//               hintStyle: TextStyle(color: textInputColor),
//               // errorText:
//               //     con.checkValidation() ? '$label Can\'t Be Empty' : null,
//               // prefix: Text(
//               //   '(+855) ',
//               //   style: TextStyle(color: secondaryColor),
//               // ),
//               contentPadding: const EdgeInsets.only(
//                 left: 18,
//               ),

//               //errorText: 'Error message',
//               // border: controller.text.isNotEmpty
//               //     ?
//               // border: OutlineInputBorder(
//               //     borderRadius: BorderRadius.circular(10),
//               //     borderSide: const BorderSide(width: 2, color: Colors.white))
//               // //: InputBorder.none
//               // ,
//               enabledBorder: !con.isRegEmpty.value
//                   ? OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10),
//                       borderSide:
//                           const BorderSide(width: 2, color: Colors.white))
//                   : InputBorder.none,
//               focusedBorder: OutlineInputBorder(
//                 borderSide: BorderSide(width: 2, color: textInputColor),
//                 borderRadius: BorderRadius.circular(10),
//               )),
//           cursorColor: textInputColor,
//         ),
//       ),
//     );
//   }

//   static Widget phoneNumber({
//     Color? primaryColor = Colors.white,
//     Color? secondaryColor = Colors.black,
//     Color? textInputColor = Colors.black,

//     // TextInputType? txtInput,
//     // bool? checkInputFT,
//     // String? formatter = '',
//     TextEditingController? controller,
//     String? hintText = "Phone Number",
//     String? label = "Phone Number",
//     VoidCallback? onTap,
//     FocusNode? focusNode,
//     bool? isFocus,
//   }) {
//     var con = Get.put(TextFieldController());
//     var maskFormatter = MaskTextInputFormatter(
//         mask: '### ### ####',
//         filter: {"#": RegExp(r'[0-9]')},
//         type: MaskAutoCompletionType.lazy);
//     return Obx(
//       () => Container(
//         //width: 335,
//         // height: 44,
//         //margin: EdgeInsets.only(left: 5),
//         decoration: BoxDecoration(
//           color: controller!.text.isEmpty && !isFocus!
//               ? primaryColor
//               : Colors.transparent,
//           borderRadius: BorderRadius.circular(8),
//         ),
//         child: TextFormField(
//           // textInputAction: TextInputAction.emergencyCall,

//           //focusNode: con.getFocusNode.value,
//           keyboardType: TextInputType.number,
//           inputFormatters: [
//             // MaskedInputFormatter('(###) ###-####')formatter
//             // MaskedInputFormatter('### ### ####'),
//             // CardFormater();
//             MaskedInputFormatter('000 000 0000'),
//             // CardFormater();
//             // maskFormatter,
//             LengthLimitingTextInputFormatter(12),
//             //FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
//           ],
//           autovalidateMode: AutovalidateMode.onUserInteraction,

//           onChanged: ((value) {
//             con.signPhoneText.value = value;
//             con.signPhoneText.value =
//                 con.signPhoneText.value.removeAllWhitespace;
//             con.update();
//             //debugPrint("in and out");
            
//             ///////////////////
//             // ignore: unrelated_type_equality_checks
//             // if (value.length > 8) {
//             //   String tempText = "";
//             //   if (controller.text[0] != 0) {
//             //     //debugPrint("Is not zero at first = true");

//             //     tempText = value;
//             //     controller.text = "";
//             //     controller.text = "0" + value;
//             //     debugPrint(controller.text);
//             //   }
//             // }
//             con.enableBtnRegContinue.value = false;

//             if (value.length > 8) {
//               //85 748 005
//               con.enableBtnRegContinue.value = true;
//               debugPrint(
//                   "enableBtnRegContinue:${con.enableBtnRegContinue.value}");
//             }
//             // if (controller.text.length < 8) {
//             //   debugPrint("Not correct phone number");

//             //   con.txtPhoneRegValidate.value = true;
//             // } else {
//             //   debugPrint("phone number is correct");
//             //   con.txtPhoneRegValidate.value = false;

//             //   // con.unHideButton.value = true;
//             // }
//             // if (value.isNotEmpty) {
//             //   con.unHideButton.value = false;
//             // }
//             // debugPrint("${controller!.text}");
//             // con.checkValidation();
//             // con.update();
//           }),
//           focusNode: focusNode,
//           //   con.update();
//           // }),
//           //onChanged: onChange,
//           controller: controller,
//           //0857480055
//           // maxLength: 10,
//           //focusNode: con.focus,
//           style: TextStyle(
//               fontSize: 14,
//               fontWeight: FontWeight.w500,
//               color: textInputColor!),
//           decoration: InputDecoration(
//               // filled: true,
//               // fillColor: controller!.text.isNotEmpty
//               //     ? Colors.transparent
//               //     : const Color(0xFF2B2F7E),
//               labelText: '$label',
//               labelStyle: TextStyle(
//                   color: isFocus! || controller.text.isNotEmpty
//                       ? textInputColor
//                       : secondaryColor),
//               hintText: '$hintText',
//               hintStyle:
//                   TextStyle(color: isFocus ? textInputColor : secondaryColor),
//               // errorText:
//               //     con.checkValidation() ? '$label Can\'t Be Empty' : null,
//               // prefix: Text(
//               //   '(+855) ',
//               //   style: TextStyle(color: secondaryColor),
//               // ),
//               contentPadding: const EdgeInsets.only(
//                 left: 18,
//               ),

//               //errorText: 'Error message',
//               // border: controller.text.isNotEmpty
//               //     ?
//               // border: OutlineInputBorder(
//               //     borderRadius: BorderRadius.circular(10),
//               //     borderSide: const BorderSide(width: 2, color: Colors.white))
//               // //: InputBorder.none
//               // ,
//               enabledBorder: con.isEmpty.value != true
//                   ? OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10),
//                       borderSide:
//                           const BorderSide(width: 2, color: Colors.white))
//                   : InputBorder.none,
//               focusedBorder: OutlineInputBorder(
//                 borderSide: BorderSide(width: 2, color: primaryColor!),
//                 borderRadius: BorderRadius.circular(10),
//               )),
//           cursorColor: textInputColor,
//         ),
//       ),
//     );
//   }
// }
