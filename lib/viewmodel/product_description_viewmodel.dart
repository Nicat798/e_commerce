import 'package:e_commerce_demo/serivces/firebase_auth_service.dart';
import 'package:e_commerce_demo/serivces/firebase_database_service.dart';
import 'package:flutter/material.dart';

class ProductDescriptionViewModel extends ChangeNotifier {
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

  FirebaseAuthService firebaseAuthService = FirebaseAuthService();
  FirebaseDatabaseService firebaseDatabaseService = FirebaseDatabaseService();
  late String currentUserUid;
  int productAmount = 1;
  Color? currentColor;
  double totalPrice = 0;
  double finalTotalPrice = 0;
  final List<Color> productColor = [Colors.red, Colors.blue, Colors.black];

  ProductDescriptionViewModel() {
    currentUserUid = firebaseAuthService.currentUser!.uid;
  }

  void getTotalPrice(double price) {
    totalPrice += price * productAmount;
    notifyListeners();
  }

  void getFinalTotalPrice() {
    finalTotalPrice = finalTotalPrice + totalPrice;
    print("final $finalTotalPrice");
    print("total $totalPrice");

    notifyListeners();
  }

  void reduceFinalTotalPrice({required double currentProductPrice}) {
    finalTotalPrice -= currentProductPrice;
    notifyListeners();
  }

  void selectColor(Color color) {
    currentColor = color;
    notifyListeners();
  }

  void addAmount() {
    productAmount++;
    notifyListeners();
  }

  void reduceAmount() {
    productAmount--;
    notifyListeners();
  }

  void resetAmount() {
    productAmount = 1;
    notifyListeners();
  }

  void resetColor() {
    currentColor = Colors.transparent;
  }

  void resetTotalPrice() {
    totalPrice = 0;
  }

  //Firebase Functions

  void createAndAddToBasket({
    required String productName,
    required String productImagePath,
    required int productAmount,
    required double productPrice,
    required double totalPrice,
  }) {
    firebaseDatabaseService.createCollectionAndAddProductByUserUid(
      userUid: currentUserUid,
      productName: productName,
      productImagePath: productImagePath,
      productAmount: productAmount,
      productPrice: productPrice,
      productTotalPrice: totalPrice,
    );
  }
}
