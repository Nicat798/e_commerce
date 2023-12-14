import 'package:e_commerce_demo/core/constants/colors.dart';
import 'package:e_commerce_demo/viewmodel/product_description_viewmodel.dart';
import 'package:flutter/material.dart';

class TotalPriceContainer extends StatelessWidget {
  const TotalPriceContainer({super.key, required this.descriptionViewModel});

  final ProductDescriptionViewModel descriptionViewModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(49, 255, 255, 255),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
        child: Row(
          children: [
            const Text(
              "Total Price",
              style: TextStyle(color: Colors.white),
            ),
            const SizedBox(
              width: 15.0,
            ),
            Text(
              descriptionViewModel.finalTotalPrice.toStringAsFixed(2),
              style: const TextStyle(color: Colors.white),
            ),
            const Spacer(),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: const StadiumBorder(),
                backgroundColor: ProjectColors.backgroundColor,
              ),
              onPressed: () {},
              child: const Text("Submit Order"),
            )
          ],
        ),
      ),
    );
  }
}
