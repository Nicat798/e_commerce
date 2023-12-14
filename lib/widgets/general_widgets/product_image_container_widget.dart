import 'package:e_commerce_demo/core/constants/colors.dart';
import 'package:flutter/material.dart';

class ProductImageContainer extends StatelessWidget {
  const ProductImageContainer({super.key, required this.childWidget});

  final Widget childWidget;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ProjectColors.secondaryColor,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: childWidget,
    );
  }
}
