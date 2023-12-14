import 'package:flutter/material.dart';

class CustomCircularContainer extends StatelessWidget {
  const CustomCircularContainer(
      {super.key,
      this.containerColor,
      this.width,
      this.height,
      required this.child});

  final Color? containerColor;
  final double? width;
  final double? height;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        color: containerColor,
      ),
      child: child,
    );
  }
}
