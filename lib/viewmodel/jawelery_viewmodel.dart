import 'package:e_commerce_demo/models/products_model.dart';
import 'package:e_commerce_demo/serivces/store_api_call.dart';
import 'package:flutter/material.dart';

class JaweleryViewModel extends ChangeNotifier {
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
  List<ProductModel>? jaweleryProducts = [];
  final String _categoryPath = "jewelery";

  JaweleryViewModel() {
    getJaweleryProduct();
  }

  Future<List<ProductModel>?> getJaweleryProduct() async {
    jaweleryProducts = await _storeApiCall.getStoreProductsByCategory(
        categoryName: _categoryPath);

    notifyListeners();
    return jaweleryProducts;
  }
}
