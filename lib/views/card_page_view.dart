import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_demo/core/constants/colors.dart';
import 'package:e_commerce_demo/core/constants/strings.dart';
import 'package:e_commerce_demo/viewmodel/card_page_viewmodel.dart';
import 'package:e_commerce_demo/viewmodel/product_description_viewmodel.dart';
import 'package:e_commerce_demo/widgets/card_page_widgets/card_products_list_widget.dart';
import 'package:e_commerce_demo/widgets/card_page_widgets/total_price_container_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CardPageView extends StatelessWidget {
  const CardPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => CardPageViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProductDescriptionViewModel(),
        )
      ],
      child: Scaffold(
        backgroundColor: ProjectColors.backgroundColor,
        body: Consumer<CardPageViewModel>(
          builder: (context, cardPageView, child) =>
              StreamBuilder<QuerySnapshot>(
            stream: cardPageView.userBasketRef.snapshots(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasError) {
                return const Center(
                  child: Text(ProjectStrings.internetError),
                );
              } else if (!snapshot.hasData) {
                return const Center(
                  child: CircularProgressIndicator.adaptive(),
                );
              } else {
                List<DocumentSnapshot> currentList = snapshot.data.docs;
                return Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Column(
                    children: [
                      Consumer<ProductDescriptionViewModel>(
                        builder: (context, productDescriptionView, child) =>
                            Expanded(
                          child: CardProductList(
                              currentList: currentList,
                              cardPageView: cardPageView,
                              descriptionView: productDescriptionView),
                        ),
                      ),
                      Consumer<ProductDescriptionViewModel>(
                        builder: (context, productDescriptionView, child) {
                          return TotalPriceContainer(
                            descriptionViewModel: productDescriptionView,
                          );
                        },
                      ),
                    ],
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
