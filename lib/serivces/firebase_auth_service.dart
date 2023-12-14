// ignore_for_file: unused_local_variable

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

class FirebaseAuthService {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  User? currentUser;

  FirebaseAuthService() {
    currentUser = firebaseAuth.currentUser;
  }

  Future<void> signUpWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      UserCredential auth = await firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (currentError) {
      Fluttertoast.showToast(
        msg: currentError.toString(),
      );
    }
  }

  Future<void> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      UserCredential auth = await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (currentError) {
      Fluttertoast.showToast(
        msg: currentError.toString(),
      );
    }
  }
}
