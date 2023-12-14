import 'package:flutter/material.dart';
import 'package:e_commerce_demo/views/home_page_view.dart';
import 'package:e_commerce_demo/views/welcome_page_view.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserLoginControl extends StatelessWidget {
  UserLoginControl({super.key});

  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    Stream<User?> userLogin = auth.authStateChanges();
    return StreamBuilder(
      stream: userLogin,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return HomePage();
        } else {
          return const WelcomePage();
        }
      },
    );
  }
}
