import 'package:e_commerce_demo/core/constants/colors.dart';
import 'package:e_commerce_demo/core/constants/strings.dart';
import 'package:flutter/material.dart';

class AddToCardContainer extends StatelessWidget {
  const AddToCardContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: ProjectColors.backgroundColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20.0),
          bottomRight: Radius.circular(20.0),
        ),
      ),
      width: double.infinity,
      child: const Center(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Text(
            ProjectStrings.addToCardText,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
