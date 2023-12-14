import 'package:e_commerce_demo/viewmodel/mens_clothing_viewmodel.dart';
import 'package:e_commerce_demo/widgets/general_widgets/grid_product_widget.dart';
import 'package:e_commerce_demo/widgets/general_widgets/search_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MensClothings extends StatelessWidget {
  const MensClothings({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MensClothingViewModel(),
      child: Consumer<MensClothingViewModel>(
        builder: (context, mensClothingViewModel, child) => SafeArea(
          child: FutureBuilder(
            future: mensClothingViewModel.getMensClothingProduct(),
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
                      currentList: mensClothingViewModel.mensClothingProducts!,
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
