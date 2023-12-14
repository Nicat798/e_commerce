import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';

class FirebaseDatabaseService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  void createCollectionAndAddProductByUserUid(
      {required String userUid,
      required String productName,
      required String productImagePath,
      required int productAmount,
      required double productPrice,
      required double productTotalPrice}) {
    try {
      firestore.collection(userUid).add(
        {
          "productName": productName,
          "productImagePath": productImagePath,
          "productAmount": productAmount,
          "productPrice": productPrice,
          "productTotalPrice": productTotalPrice
        },
      );
    } on FirebaseException catch (currentError) {
      Fluttertoast.showToast(msg: currentError.toString());
    }
  }
}
