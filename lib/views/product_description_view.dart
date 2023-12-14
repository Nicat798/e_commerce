import 'package:e_commerce_demo/core/constants/colors.dart';
import 'package:e_commerce_demo/core/constants/strings.dart';
import 'package:e_commerce_demo/viewmodel/product_description_viewmodel.dart';
import 'package:e_commerce_demo/widgets/general_widgets/custom_text.dart';
import 'package:e_commerce_demo/widgets/product_description_widgets/add_to_card_button_widget.dart';
import 'package:e_commerce_demo/widgets/product_description_widgets/circular_container_widget.dart';
import 'package:e_commerce_demo/widgets/product_description_widgets/description_image_widget.dart';
import 'package:e_commerce_demo/widgets/product_description_widgets/mount_button_widget.dart';
import 'package:e_commerce_demo/widgets/product_description_widgets/product_color_container.dart';
import 'package:e_commerce_demo/widgets/product_description_widgets/product_description_text.dart';
import 'package:e_commerce_demo/widgets/product_description_widgets/product_reactions_widget.dart';
import 'package:e_commerce_demo/widgets/product_description_widgets/product_reviews_container.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductDescription extends StatelessWidget {
  const ProductDescription(
      {super.key,
      required this.productName,
      required this.productDescription,
      required this.productImage,
      required this.productPrice,
      required this.productRate,
      required this.productAmount,
      required this.id,
      required this.count,
      required this.category,
      required this.index});

  final String productName;
  final String productDescription;
  final String productImage;
  final double productPrice;
  final double productRate;
  final double productAmount;
  final int id;
  final int count;
  final int index;
  final String category;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProductDescriptionViewModel(),
      child: Scaffold(
        backgroundColor: ProjectColors.backgroundColor,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: SizedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: CustomText(
                      fontSize: 25.0,
                      fontWeight: FontWeight.w700,
                      text: productName,
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Expanded(
                    child: CustomCircularContainer(
                      containerColor: ProjectColors.secondaryColor,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 20.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ProductReactions(count: count, id: id),
                                DescriptionImage(imagePath: productImage),
                                ProductReviewsContainer(
                                    reviewNumber: productRate.toString())
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 30.0),
                            child: SizedBox(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomText(
                                    fontWeight: FontWeight.bold,
                                    text: "\$$productPrice",
                                    fontSize: 30.0,
                                  ),
                                  const SizedBox(
                                    height: 15.0,
                                  ),
                                  ProductDescriptionText(
                                      description: productDescription),
                                  const SizedBox(
                                    height: 30.0,
                                  ),
                                  CustomText(
                                    text: ProjectStrings.chooseColorText,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  const SizedBox(
                                    height: 15.0,
                                  ),
                                  Consumer<ProductDescriptionViewModel>(
                                    builder: (context, descriptionViewModel,
                                            child) =>
                                        Row(
                                      children: descriptionViewModel
                                          .productColor
                                          .map(
                                            (currentColor) =>
                                                ProductColorContainer(
                                              onTap: () {
                                                descriptionViewModel
                                                    .selectColor(currentColor);
                                              },
                                              isSelected: descriptionViewModel
                                                      .currentColor ==
                                                  currentColor,
                                              containerColor: currentColor,
                                            ),
                                          )
                                          .toList(),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 30.0,
                                  ),
                                  Consumer<ProductDescriptionViewModel>(
                                    builder: (context, descriptionViewModel,
                                            child) =>
                                        Row(
                                      children: [
                                        if (descriptionViewModel
                                                .productAmount !=
                                            1)
                                          MountButton(
                                              onPressed: () {
                                                descriptionViewModel
                                                    .reduceAmount();
                                              },
                                              buttonText:
                                                  ProjectStrings.reduceValue),
                                        const SizedBox(
                                          width: 15.0,
                                        ),
                                        CustomText(
                                          text: descriptionViewModel
                                              .productAmount
                                              .toString(),
                                        ),
                                        const SizedBox(
                                          width: 15.0,
                                        ),
                                        MountButton(
                                            onPressed: () {
                                              descriptionViewModel.addAmount();
                                            },
                                            buttonText:
                                                ProjectStrings.addValue),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          const Spacer(),
                          Consumer<ProductDescriptionViewModel>(
                            builder: (_, descriptionViewModel, child) =>
                                GestureDetector(
                              onTap: () {
                                descriptionViewModel
                                    .getTotalPrice(productPrice);

                                descriptionViewModel.createAndAddToBasket(
                                    productName: productName,
                                    productImagePath: productImage,
                                    productAmount:
                                        descriptionViewModel.productAmount,
                                    productPrice: productPrice,
                                    totalPrice:
                                        descriptionViewModel.totalPrice);
                                descriptionViewModel.getFinalTotalPrice();

                                descriptionViewModel.resetTotalPrice();

                                descriptionViewModel.resetAmount();
                                descriptionViewModel.resetColor();
                                Navigator.pop(context);
                              },
                              child: const AddToCardContainer(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
