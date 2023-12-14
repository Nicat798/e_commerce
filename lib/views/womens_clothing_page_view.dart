import 'package:e_commerce_demo/viewmodel/womens_clothing_viewmodel.dart';
import 'package:e_commerce_demo/widgets/general_widgets/grid_product_widget.dart';
import 'package:e_commerce_demo/widgets/general_widgets/search_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WomensClothings extends StatelessWidget {
  const WomensClothings({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => WomensClothingViewModel(),
      child: Consumer<WomensClothingViewModel>(
        builder: (context, womensClothingViewModel, child) => SafeArea(
          child: FutureBuilder(
            future: womensClothingViewModel.getWomensClothingProduct(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(
                  child: CircularProgressIndicator.adaptive(),
                );
              } else {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CustomSearchBar(
                      childWidget: TextField(),
                    ),
                    ProductGridView(
                      currentList:
                          womensClothingViewModel.womensClothingProducts!,
                    )
                  ],
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
