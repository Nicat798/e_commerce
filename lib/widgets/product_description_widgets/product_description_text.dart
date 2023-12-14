import 'package:e_commerce_demo/core/constants/colors.dart';
import 'package:flutter/material.dart';

class ProductDescriptionText extends StatelessWidget {
  const ProductDescriptionText({super.key, required this.description});
  final String description;

  @override
  Widget build(BuildContext context) {
    return Text(
      description,
      style: const TextStyle(color: ProjectColors.darkWhite),
    );
  }
}
