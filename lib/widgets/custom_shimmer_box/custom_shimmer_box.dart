import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerBox extends StatelessWidget {
  final double? height;
  final double? width;
  final double? radius;
  final bool? isColor;
  final Color? baseColor;
  final Color? highlightColor;
  final Color? color;
  const ShimmerBox(
      {Key? key,
      this.height,
      this.width,
      this.radius,
      this.isColor = true,
      this.baseColor,
      this.highlightColor,
      this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isColor!
        ? Shimmer.fromColors(
            period: const Duration(milliseconds: 1000),
            baseColor: baseColor ?? Colors.white,
            highlightColor: highlightColor ?? Colors.grey[100]!,
            child: Container(
              height: height ?? 15,
              width: width ?? 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(radius ?? 8.0),
                color: color ?? Colors.white,
              ),
            ),
          )
        : Container(
            height: height ?? 15,
            width: width ?? 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(radius ?? 8.0),
              color: Colors.white,
            ),
          );
  }
}
