import 'package:flutter/material.dart';

AppBar customAppBar(
    {String? title, TextStyle? textStyle, Color? backgroundColor}) {
  return AppBar(
      title: Text(
        title ?? '',
        style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Color(0xFFDAA520)),
      ),
      centerTitle: true,
      backgroundColor: const Color(0xFF141414));
}
