import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_demo/viewmodel/card_page_viewmodel.dart';
import 'package:e_commerce_demo/viewmodel/product_description_viewmodel.dart';
import 'package:flutter/material.dart';

class CardProductList extends StatelessWidget {
  const CardProductList(
      {super.key,
      required this.currentList,
      required this.cardPageView,
      required this.descriptionView});

  final List<DocumentSnapshot> currentList;
  final CardPageViewModel cardPageView;
  final ProductDescriptionViewModel descriptionView;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: currentList.length,
      itemBuilder: (BuildContext context, int index) {
        DocumentSnapshot<Object?> currentListItem = currentList[index];

        return Card(
          color: const Color.fromARGB(50, 192, 192, 202),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15.0),
            child: ListTile(
              textColor: Colors.white,
              iconColor: Colors.white,
              title: Text(
                '${currentListItem["productName"]}',
              ),
              leading: Image.network('${currentListItem["productImagePath"]}'),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('${currentListItem["productTotalPrice"]}'),
                  IconButton(
                    onPressed: () {
                      cardPageView.deleteItem(currentList, index);
                      double totalPrice = currentListItem["productTotalPrice"];
                      descriptionView.reduceFinalTotalPrice(
                          currentProductPrice: totalPrice);
                    },
                    icon: const Icon(Icons.delete),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
