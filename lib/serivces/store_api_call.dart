import 'dart:io';

import 'package:dio/dio.dart';
import 'package:e_commerce_demo/exceptions/dio_exception.dart';
import 'package:e_commerce_demo/models/products_model.dart';
import 'package:fluttertoast/fluttertoast.dart';

class StoreApiCall {
  Dio dio = Dio(
    BaseOptions(baseUrl: "https://fakestoreapi.com/"),
  );

  Future<List<ProductModel>?> getStoreProductsByCategory(
      {required String categoryName}) async {
    try {
      var response = await dio.get("/products/category/$categoryName");

      if (response.statusCode == HttpStatus.ok) {
        final productData = response.data;

        if (productData is List) {
          return productData.map((e) => ProductModel.fromJson(e)).toList();
        }
      }
      return null;
    } on DioError catch (dioError) {
      if (dioError.isNoConnectionError) {
        Fluttertoast.showToast(msg: "Please check your network");
      }
    }
    return null;
  }
}
