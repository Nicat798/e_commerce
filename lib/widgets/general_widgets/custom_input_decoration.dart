import 'package:e_commerce_demo/core/constants/colors.dart';
import 'package:flutter/material.dart';

InputDecorationTheme customInputDecoration() {
  return const InputDecorationTheme(
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(width: 1, color: Colors.white),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        width: 1,
        color: ProjectColors.whiteColor,
      ),
    ),
  );
}
