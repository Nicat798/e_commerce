import 'package:e_commerce_demo/core/constants/colors.dart';
import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({
    super.key,
    required this.childWidget,
  });
  final Widget childWidget;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 20.0),
      child: Container(
        decoration: BoxDecoration(
          color: ProjectColors.secondaryColor,
          borderRadius: BorderRadius.circular(10.0),
        ),
        width: double.infinity,
        child: childWidget,
      ),
    );
  }
}
