import 'package:e_commerce_demo/core/constants/colors.dart';
import 'package:flutter/material.dart';

class ProductColorContainer extends StatelessWidget {
  const ProductColorContainer({
    super.key,
    required this.containerColor,
    required this.isSelected,
    required this.onTap,
  });
  final Color containerColor;
  final bool isSelected;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(right: 10.0),
        decoration: BoxDecoration(
          color: containerColor,
          borderRadius: BorderRadius.circular(5.0),
          border: Border.all(
            color: ProjectColors.backgroundColor,
            width: isSelected ? 3.0 : 0,
          ),
        ),
        width: 30.0,
        height: 30.0,
      ),
    );
  }
}
