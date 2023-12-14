import 'package:e_commerce_demo/core/constants/colors.dart';
import 'package:flutter/material.dart';

class GridPriceContainer extends StatelessWidget {
  const GridPriceContainer(
      {super.key, this.width = double.infinity, required this.childWidget});
  final double width;
  final Widget childWidget;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
        color: ProjectColors.secondaryColor,
      ),
      width: width,
      child: childWidget,
    );
  }
}
