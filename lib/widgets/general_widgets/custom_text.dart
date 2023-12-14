// ignore_for_file: must_be_immutable

import 'package:e_commerce_demo/core/constants/colors.dart';
import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  CustomText(
      {super.key,
      required this.text,
      this.fontSize = 14.0,
      this.fontWeight = FontWeight.normal,
      this.textAlign});
  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;
  TextAlign? textAlign = TextAlign.start;

  @override
  Widget build(BuildContext context) {
    return Text(
      textAlign: textAlign,
      text,
      style: TextStyle(
        color: ProjectColors.whiteColor,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    );
  }
}
