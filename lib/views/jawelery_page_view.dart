import 'package:e_commerce_demo/viewmodel/jawelery_viewmodel.dart';
import 'package:e_commerce_demo/widgets/general_widgets/grid_product_widget.dart';
import 'package:e_commerce_demo/widgets/general_widgets/search_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Jawelery extends StatelessWidget {
  const Jawelery({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => JaweleryViewModel(),
      child: SafeArea(
        child: Consumer<JaweleryViewModel>(
          builder: (context, jaweleryViewModel, child) => FutureBuilder(
            future: jaweleryViewModel.getJaweleryProduct(),
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
                      currentList: jaweleryViewModel.jaweleryProducts!,
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
