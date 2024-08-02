import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText(
      {super.key,
      this.text,
      this.fontSize,
      this.fontWeight,
      this.color,
      this.height,
      this.maxLine});

  final String? text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  final double? height;
  final int? maxLine;

  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? "",
      maxLines: maxLine,
      style: TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: color,
          height: height),
    );
  }
}
