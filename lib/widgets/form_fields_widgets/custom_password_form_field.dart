import 'package:e_commerce_demo/core/constants/colors.dart';
import 'package:e_commerce_demo/core/constants/strings.dart';
import 'package:flutter/material.dart';

class CustomPasswordFormField extends StatelessWidget {
  const CustomPasswordFormField({
    super.key,
    required this.controller,
    required this.labelText,
  });
  final TextEditingController controller;
  final String labelText;
  String? formValidation(String value) {
    if (value.isEmpty) {
      return ProjectStrings.emptyPasswordError;
    } else if (value.length < 8) {
      return ProjectStrings.shortPasswordError;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
      child: TextFormField(
        obscureText: true,
        style: const TextStyle(color: ProjectColors.whiteColor),
        cursorColor: Colors.white,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: const TextStyle(color: ProjectColors.darkWhite),
        ),
        controller: controller,
        validator: (value) => formValidation(value!),
      ),
    );
  }
}
