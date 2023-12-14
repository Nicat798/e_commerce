import 'package:e_commerce_demo/core/constants/colors.dart';
import 'package:e_commerce_demo/core/constants/strings.dart';
import 'package:e_commerce_demo/views/register_page_view.dart';
import 'package:e_commerce_demo/widgets/general_widgets/auth_button_widget.dart';
import 'package:e_commerce_demo/widgets/general_widgets/custom_text.dart';
import 'package:e_commerce_demo/widgets/welcome_page_widgets/welcome_page_image.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: ProjectColors.backgroundColor,
      body: SizedBox(
        width: deviceSize.width,
        height: deviceSize.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const WelcomePageImage(),
            const SizedBox(
              height: 30.0,
            ),
            CustomText(
              textAlign: TextAlign.center,
              text: "Welcome to the Best Shopping App ",
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
            ),
            const SizedBox(
              height: 40.0,
            ),
            AuthButton(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const RegisterPage(),
                ),
              ),
              text: ProjectStrings.getStartedText,
            ),
          ],
        ),
      ),
    );
  }
}
