import 'package:e_commerce_demo/models/products_model.dart';
import 'package:e_commerce_demo/serivces/store_api_call.dart';
import 'package:flutter/material.dart';

class MensClothingViewModel extends ChangeNotifier {
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
  List<ProductModel>? mensClothingProducts = [];
  final String _categoryPath = "men's%20clothing";
  bool isLoading = false;

  MensClothingViewModel() {
    getMensClothingProduct();
  }

  Future<List<ProductModel>?> getMensClothingProduct() async {
    mensClothingProducts = await _storeApiCall.getStoreProductsByCategory(
        categoryName: _categoryPath);

    notifyListeners();

    return mensClothingProducts;
  }
}
