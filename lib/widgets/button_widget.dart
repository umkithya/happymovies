import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ButtonWidget {
  static Widget circleIconButton(
      {double size = 35.0,
      double iconSize = 20.0,
      IconData? icon,
      bool? enableBorder = false,
      Color? borderColor = Colors.white,
      Color? backgroundColor = Colors.black,
      Color? iconColor = Colors.white,
      void Function()? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(60),
          border: enableBorder!
              ? Border.all(width: 2, color: borderColor!)
              : Border.all(width: 0),
        ),
        child: Icon(
          icon,
          size: iconSize,
          color: iconColor,
        ),
      ),
    );
  }

  static Widget circleIconButtonTwo({
    double? size = 35.0,
    double? iconSize = 20.0,
    IconData? icon,
    bool? enableBorder = false,
    Color? borderColor = Colors.white,
    Color? backgroundColor = Colors.black,
    Color? iconColor = Colors.white,
  }) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(60),
        border: enableBorder!
            ? Border.all(width: 2, color: borderColor!)
            : Border.all(width: 0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: iconSize,
            color: iconColor,
          ),
          const Text(
            "****",
            style: TextStyle(color: Colors.white),
          )
        ],
      ),
    );
  }

  static Widget circleIconImageButton({
    double size = 35.0,
    String? imagePath = "",
    bool? enableBorder = false,
    Color? borderColor = Colors.white,
    Color? backgroundColor = Colors.black,
  }) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(60),
        border: enableBorder!
            ? Border.all(width: 2, color: borderColor!)
            : Border.all(width: 0),
      ),
      child: imagePath != "" ? SvgPicture.asset("$imagePath") : Container(),
    );
  }

  static Widget roundedButton({
    double? height = 30.0,
    String? title = "Button",
    Color? backgroundColor = Colors.white,
    double? radius = 8.0,
   
    TextStyle? textStyle,
    void Function()? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(radius!)),
        height: height,
        width: double.infinity,
        child: Center(
          child: Text(
            "$title",
            style: textStyle,
          ),
        ),
      ),
    );
  }
}
