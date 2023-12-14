import 'package:e_commerce_demo/core/constants/colors.dart';
import 'package:e_commerce_demo/core/constants/strings.dart';
import 'package:e_commerce_demo/firebase/firebase_options.dart';
import 'package:e_commerce_demo/views/user_login_control.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'widgets/general_widgets/custom_input_decoration.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  } catch (_) {
    Fluttertoast.showToast(msg: ProjectStrings.firebaseInitializeError);
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        inputDecorationTheme: customInputDecoration(),
      ),
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      title: ProjectStrings.projectName,
      home: Scaffold(
        backgroundColor: ProjectColors.backgroundColor,
        body: UserLoginControl(),
      ),
    );
  }
}
