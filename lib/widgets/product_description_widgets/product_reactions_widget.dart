import 'package:e_commerce_demo/widgets/general_widgets/custom_text.dart';
import 'package:e_commerce_demo/widgets/product_description_widgets/reaction_icon.dart';
import 'package:flutter/material.dart';

class ProductReactions extends StatelessWidget {
  const ProductReactions({
    super.key,
    required this.id,
    required this.count,
  });
  final int id;
  final int count;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const ReactionIcon(icon: Icons.favorite),
        CustomText(text: id.toString()),
        const SizedBox(
          height: 20.0,
        ),
        const ReactionIcon(icon: Icons.remove_red_eye_sharp),
        CustomText(text: count.toString()),
        const SizedBox(
          height: 20.0,
        ),
      ],
    );
  }
}
