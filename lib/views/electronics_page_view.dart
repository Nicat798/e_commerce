import 'package:e_commerce_demo/core/constants/colors.dart';
import 'package:e_commerce_demo/core/constants/strings.dart';
import 'package:e_commerce_demo/viewmodel/electronics_viewmodel.dart';
import 'package:e_commerce_demo/widgets/general_widgets/grid_product_widget.dart';
import 'package:e_commerce_demo/widgets/general_widgets/search_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Electronics extends StatelessWidget {
  const Electronics({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ElectronicsViewModel(),
      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          backgroundColor: ProjectColors.backgroundColor,
          body: SafeArea(
            child: Consumer<ElectronicsViewModel>(
              builder: (context, electronicsViewModel, child) => FutureBuilder(
                future: electronicsViewModel.getElectronicsProduct(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(
                      child: CircularProgressIndicator.adaptive(),
                    );
                  } else if (snapshot.hasError) {
                    return const Center(
                      child: Text(ProjectStrings.internetError),
                    );
                  } else {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomSearchBar(
                          childWidget: TextField(
                            autocorrect: false,
                            decoration: const InputDecoration(
                                hintStyle: TextStyle(
                                  color: Colors.white54,
                                ),
                                hintText: ProjectStrings.searchText),
                            onChanged: (value) =>
                                electronicsViewModel.searchProduct(value),
                          ),
                        ),
                        ProductGridView(
                          currentList: electronicsViewModel
                              .displayedElectronicsProducts!,
                        )
                      ],
                    );
                  }
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
