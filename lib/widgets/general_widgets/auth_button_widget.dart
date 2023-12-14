import 'package:e_commerce_demo/widgets/general_widgets/custom_text.dart';
import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({super.key, required this.onTap, required this.text});

  final Function() onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: const StadiumBorder(),
        backgroundColor: const Color.fromARGB(50, 192, 192, 202),
      ),
      onPressed: onTap,
      child: CustomText(text: text),
    );
  }
}
