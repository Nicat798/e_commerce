import 'package:e_commerce_demo/serivces/firebase_auth_service.dart';
import 'package:e_commerce_demo/views/user_login_control.dart';
import 'package:flutter/material.dart';

class RegisterPageViewModel extends ChangeNotifier {
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
  final TextEditingController registerEmailController = TextEditingController();
  final TextEditingController registerPasswordController =
      TextEditingController();

  void signUpToApplication() {
    firebaseAuthService.signUpWithEmailAndPassword(
        email: registerEmailController.text,
        password: registerPasswordController.text);
  }

  void navigateToLoginControl(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => UserLoginControl(),
        ));
  }
}
