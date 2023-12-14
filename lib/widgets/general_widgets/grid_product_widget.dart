import 'package:e_commerce_demo/core/constants/colors.dart';
import 'package:e_commerce_demo/models/products_model.dart';
import 'package:e_commerce_demo/views/product_description_view.dart';
import 'package:e_commerce_demo/widgets/general_widgets/grid_price_container.dart';
import 'package:e_commerce_demo/widgets/general_widgets/product_image_container_widget.dart';
import 'package:flutter/material.dart';

class ProductGridView extends StatelessWidget {
  const ProductGridView({super.key, required this.currentList});

  final List<ProductModel?> currentList;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 0.75,
            crossAxisCount: 2,
          ),
          itemCount: currentList.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 8.0,
                vertical: 8.0,
              ),
              child: GestureDetector(
                onTap: () {
                  ProductModel currentProduct = currentList[index]!;
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ProductDescription(
                              index: index,
                              category: currentProduct.category!,
                              count: currentProduct.rating!.count!.toInt(),
                              id: currentProduct.id!,
                              productAmount:
                                  currentProduct.rating!.count!.toDouble(),
                              productDescription: currentProduct.description!,
                              productImage: currentProduct.image!,
                              productName: currentProduct.title!,
                              productPrice: currentProduct.price!.toDouble(),
                              productRate:
                                  currentProduct.rating!.rate!.toDouble(),
                            )),
                  );
                },
                child: ProductImageContainer(
                  childWidget: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(),
                      Image(
                        width: 90.0,
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          currentList[index]!.image.toString(),
                        ),
                      ),
                      GridPriceContainer(
                        childWidget: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 15.0, horizontal: 10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                currentList[index]!.title!,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    color: ProjectColors.whiteColor),
                              ),
                              Row(
                                children: [
                                  Text(
                                    '\$ ${currentList[index]!.price}',
                                    style: const TextStyle(
                                        color: ProjectColors.whiteColor),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
