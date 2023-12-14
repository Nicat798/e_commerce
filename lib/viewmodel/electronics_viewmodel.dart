import 'package:e_commerce_demo/models/products_model.dart';
import 'package:e_commerce_demo/serivces/store_api_call.dart';
import 'package:flutter/material.dart';

class ElectronicsViewModel extends ChangeNotifier {
  @override
  void dispose() {
    _disposed = true;
    super.dispose();
  }

  @override
  void notifyListeners() {
    if (!_disposed) {
      super.notifyListeners();
    }
  }

  bool _disposed = false;
  final StoreApiCall _storeApiCall = StoreApiCall();
  List<ProductModel>? electronicsProducts = [];
  List<ProductModel>? displayedElectronicsProducts = [];

  final String _categoryPath = "electronics";

  ElectronicsViewModel() {
    getElectronicsProduct();
  }

  Future<List<ProductModel>?> getElectronicsProduct() async {
    electronicsProducts = await _storeApiCall.getStoreProductsByCategory(
        categoryName: _categoryPath);

    displayedElectronicsProducts = List.from(electronicsProducts ?? []);

    notifyListeners();
    return electronicsProducts;
  }

  void searchProduct(String value) {
    List<ProductModel> foundedProducts;
    foundedProducts = electronicsProducts!
        .where(
          (element) => element.title!.toLowerCase().contains(
                value.toLowerCase(),
              ),
        )
        .toList();

    displayedElectronicsProducts = List.from(foundedProducts);

    notifyListeners();
  }
}
