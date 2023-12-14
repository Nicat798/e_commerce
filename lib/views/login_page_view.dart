import 'package:e_commerce_demo/core/constants/colors.dart';
import 'package:e_commerce_demo/core/constants/strings.dart';
import 'package:e_commerce_demo/viewmodel/login_page_viewmodel.dart';
import 'package:e_commerce_demo/widgets/form_fields_widgets/custom_password_form_field.dart';
import 'package:e_commerce_demo/widgets/general_widgets/auth_button_widget.dart';
import 'package:e_commerce_demo/widgets/form_fields_widgets/custom_email_form_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> loginPageFormKey = GlobalKey<FormState>();
    return ChangeNotifierProvider(
      create: (context) => LoginPageViewModel(),
      child: Scaffold(
        backgroundColor: ProjectColors.backgroundColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Form(
              key: loginPageFormKey,
              child: Consumer<LoginPageViewModel>(
                builder: (context, loginPageViewModel, child) => Column(
                  children: [
                    CustomEmailFormField(
                        controller: loginPageViewModel.loginEmailController,
                        labelText: ProjectStrings.emailText),
                    CustomPasswordFormField(
                        controller: loginPageViewModel.loginPasswordController,
                        labelText: ProjectStrings.passwordText),
                  ],
                ),
              ),
            ),
            Consumer<LoginPageViewModel>(
              builder: (context, loginPageViewModel, child) => AuthButton(
                text: ProjectStrings.loginText,
                onTap: () {
                  if (loginPageFormKey.currentState!.validate()) {
                    loginPageViewModel.signInToApplication();
                    loginPageViewModel.navigateToUserControl(context);
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
