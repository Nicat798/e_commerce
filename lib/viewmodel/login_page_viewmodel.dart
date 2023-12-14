import 'package:e_commerce_demo/serivces/firebase_auth_service.dart';
import 'package:e_commerce_demo/views/user_login_control.dart';
import 'package:flutter/material.dart';

class LoginPageViewModel extends ChangeNotifier {
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
  final TextEditingController loginEmailController = TextEditingController();
  final TextEditingController loginPasswordController = TextEditingController();
  bool isLoading = false;

  FirebaseAuthService firebaseAuthService = FirebaseAuthService();

  void signInToApplication() {
    firebaseAuthService.signInWithEmailAndPassword(
        email: loginEmailController.text,
        password: loginPasswordController.text);
  }

  void navigateToUserControl(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => UserLoginControl(),
        ));
  }
}
