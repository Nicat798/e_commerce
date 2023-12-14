import 'package:e_commerce_demo/core/constants/colors.dart';
import 'package:flutter/material.dart';

class ReactionIcon extends StatelessWidget {
  const ReactionIcon({super.key, required this.icon});

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      color: ProjectColors.whiteColor,
    );
  }
}
