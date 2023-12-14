import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CardPageViewModel extends ChangeNotifier {
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

  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  late CollectionReference userBasketRef;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  late final String? currentUserUid;
  CardPageViewModel() {
    currentUserUid = firebaseAuth.currentUser!.uid;

    getUserBasket();
  }

  void getUserBasket() {
    userBasketRef = firebaseFirestore.collection(currentUserUid!);
    notifyListeners();
  }

  void deleteItem(List<DocumentSnapshot> list, int index) {
    list[index].reference.delete();
    notifyListeners();
  }
}
