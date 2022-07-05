
// buildTextField({
//   TextInputType? txtInput,
//   bool? checkInputFT,
//   String? formatter = '',
//   TextEditingController? controller,
//   String? hintText,
//   String? label,
//   VoidCallback? onTap,
//   FocusNode? focusNode,
//   bool? isFocus = false,
//   bool? isEmpty = true,
// }) {
//   // var con = Get.put(TextFieldController());
//   debugPrint('isFocus=$isFocus');
//   return Container(
//     //width: 335,
//     height: 44,
//     //margin: EdgeInsets.only(left: 5),
//     decoration: BoxDecoration(
//       // color: isEmpty != true
//       //     ? const Color(0xFF252525)
//       //     : isFocus! && controller.text.isEmpty
//       //         ? const Color(0xFF252525)
//       //         : const Color(0xFFFFFFFF),
//       borderRadius: BorderRadius.circular(10),
//     ),
//     child: TextFormField(
//       style: TextStyle(
//           color: isFocus! || isEmpty! != true ? Colors.white : Colors.black),
//       // textInputAction: TextInputAction.emergencyCall,

//       //focusNode: con.getFocusNode.value,
//       keyboardType: txtInput,
//       inputFormatters: checkInputFT!
//           ? [
//               // MaskedInputFormatter('(###) ###-####')formatter
//               MaskedInputFormatter('$formatter'),
//             ]
//           : null,
//       //focusNode: myFocusNode,
//       autovalidateMode: AutovalidateMode.onUserInteraction,
//       //initialValue: 'Input text',
//       // onTap: () {
//       //   con.isFocus = true;
//       //   debugPrint("clicked! ${con.isFocus}");
//       //   con.update();
//       // },
//       focusNode: focusNode,
//       onChanged: ((value) {
//         debugPrint("in and out");
//         // if (controller.text.length < 8) {
//         //   debugPrint("Not correct phone number");

//         //   con.txtPhoneRegValidate.value = true;
//         // } else {
//         //   debugPrint("phone number is correct");
//         //   con.txtPhoneRegValidate.value = false;

//         //   // con.unHideButton.value = true;
//         // }
//         // if (value.isNotEmpty) {
//         //   con.unHideButton.value = false;
//         // }
//         // debugPrint("${controller!.text}");
//         // con.checkValidation();
//         // con.update();
//       }),
//       //   con.update();
//       // }),
//       //onChanged: onChange,
//       controller: controller,
//       //focusNode: con.focus,

//       decoration: InputDecoration(
//         // filled: isEmpty! ? true : false,
//         // fillColor: const Color(0xFFFFFFFF),
//         labelText: '$label',
//         labelStyle: TextStyle(
//             color: isFocus || isEmpty != true ? Colors.white : Colors.black),
//         hintText: '$hintText',
//         hintStyle: const TextStyle(color: Colors.white),
//         // errorText:
//         //     con.checkValidation() ? '$label Can\'t Be Empty' : null,
//         prefix: checkInputFT
//             ? Text(
//                 '(+855) ',
//                 style: TextStyle(
//                     color: isFocus || isEmpty! != true
//                         ? Colors.white
//                         : Colors.black),
//               )
//             : null,
//         contentPadding: const EdgeInsets.only(
//           left: 18,
//         ),
//         //errorText: 'Error message',
//         // border: con.isEmpty(controller)
//         //     ? OutlineInputBorder(borderRadius: BorderRadius.circular(10))
//         //     : InputBorder.none,
//         focusedBorder: OutlineInputBorder(
//           borderSide: const BorderSide(width: 3, color: Colors.white),
//           borderRadius: BorderRadius.circular(15),
//         ),
//         enabledBorder: isEmpty != true
//             ? OutlineInputBorder(
//                 borderSide: const BorderSide(width: 3, color: Colors.white),
//                 borderRadius: BorderRadius.circular(15),
//               )
//             : InputBorder.none,
//         disabledBorder: isEmpty != true || isFocus != true
//             ? OutlineInputBorder(
//                 borderSide: const BorderSide(width: 3, color: Colors.white),
//                 borderRadius: BorderRadius.circular(15),
//               )
//             : InputBorder.none,

//         //con.isfocus! ? OutlineInputBorder() :
//         // suffixIcon: Icon(
//         //   Icons.error,
//         // ),
//       ),
//     ),
//   );
// }
