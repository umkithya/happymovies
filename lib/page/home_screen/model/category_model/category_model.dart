import 'package:flutter/cupertino.dart';

class CategoryModel {
  final int? cid;
  final String? title;
  final String? imgUrl;
  final Color? color;
  CategoryModel({
    this.color,
    this.cid,
    this.title,
    this.imgUrl,
  });
}
