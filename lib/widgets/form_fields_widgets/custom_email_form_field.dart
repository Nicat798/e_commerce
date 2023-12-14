import 'package:e_commerce_demo/core/constants/colors.dart';
import 'package:e_commerce_demo/core/constants/strings.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

class CustomEmailFormField extends StatelessWidget {
  const CustomEmailFormField({
    super.key,
    required this.controller,
    required this.labelText,
  });
  final TextEditingController controller;
  final String labelText;
  String? formValidation(String value) {
    if (value.isEmpty) {
      return ProjectStrings.emptyEmailError;
    } else if (!EmailValidator.validate(value)) {
      return ProjectStrings.incorrectTypeEmail;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
      child: TextFormField(
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
