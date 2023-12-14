import 'package:e_commerce_demo/core/constants/colors.dart';
import 'package:flutter/material.dart';

class MountButton extends StatelessWidget {
  const MountButton(
      {super.key, required this.onPressed, required this.buttonText});

  final Function() onPressed;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 40,
      height: 35,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: ProjectColors.backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          buttonText,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
