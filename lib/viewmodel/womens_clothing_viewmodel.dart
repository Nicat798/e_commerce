import 'package:e_commerce_demo/models/products_model.dart';
import 'package:e_commerce_demo/serivces/store_api_call.dart';
import 'package:flutter/material.dart';

class WomensClothingViewModel extends ChangeNotifier {
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
  List<ProductModel>? womensClothingProducts = [];
  final String _categoryPath = "women's%20clothing";

  WomensClothingViewModel() {
    getWomensClothingProduct();
  }

  Future<List<ProductModel>?> getWomensClothingProduct() async {
    womensClothingProducts = await _storeApiCall.getStoreProductsByCategory(
        categoryName: _categoryPath);

    notifyListeners();

    return womensClothingProducts;
  }
}
