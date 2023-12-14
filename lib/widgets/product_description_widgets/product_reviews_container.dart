import 'package:e_commerce_demo/core/constants/colors.dart';
import 'package:e_commerce_demo/widgets/general_widgets/custom_text.dart';
import 'package:flutter/material.dart';

class ProductReviewsContainer extends StatelessWidget {
  const ProductReviewsContainer({super.key, required this.reviewNumber});
  final String reviewNumber;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF333742),
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
        child: Row(
          children: [
            CustomText(text: reviewNumber),
            const Icon(
              Icons.star,
              color: ProjectColors.yellowColor,
            ),
          ],
        ),
      ),
    );
  }
}
