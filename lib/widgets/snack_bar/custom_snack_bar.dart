// Scaffold.of(innerContext).showSnackBar(SnackBar(
//                             content: Text('Added added into cart'),
//                             duration: Duration(seconds: 2),
//                             action:
//                                 SnackBarAction(label: 'UNDO', onPressed: () {}),
//                           ))

import 'package:flutter/material.dart';

SnackBar customStackBar(
    {String? title,
    int? duration = 3,
    Function()? onPressed,
    Color? backgroundColor = Colors.black,
    TextStyle? textStyle}) {
  return SnackBar(
    backgroundColor: backgroundColor,
    content: Text(
      '$title',
      style: textStyle,
    ),
    duration: Duration(seconds: duration!),
    action: onPressed != null
        ? SnackBarAction(label: 'UNDO', onPressed: onPressed)
        : null,
    behavior: SnackBarBehavior.floating,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
  );
}
