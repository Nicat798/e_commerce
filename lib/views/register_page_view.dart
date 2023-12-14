import 'package:e_commerce_demo/core/constants/colors.dart';
import 'package:e_commerce_demo/core/constants/strings.dart';
import 'package:e_commerce_demo/viewmodel/register_page_viewmodel.dart';
import 'package:e_commerce_demo/views/login_page_view.dart';
import 'package:e_commerce_demo/widgets/form_fields_widgets/custom_email_form_field.dart';
import 'package:e_commerce_demo/widgets/form_fields_widgets/custom_password_form_field.dart';
import 'package:e_commerce_demo/widgets/general_widgets/auth_button_widget.dart';
import 'package:e_commerce_demo/widgets/general_widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> registerPageFormKey = GlobalKey<FormState>();

    return ChangeNotifierProvider(
      create: (context) => RegisterPageViewModel(),
      child: Scaffold(
        backgroundColor: ProjectColors.backgroundColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Form(
              key: registerPageFormKey,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 15.0),
                child: Consumer<RegisterPageViewModel>(
                  builder: (context, registerPageViewModel, child) => Column(
                    children: [
                      CustomEmailFormField(
                          controller:
                              registerPageViewModel.registerEmailController,
                          labelText: ProjectStrings.emailText),
                      CustomPasswordFormField(
                          controller:
                              registerPageViewModel.registerPasswordController,
                          labelText: ProjectStrings.passwordText),
                      AuthButton(
                        text: ProjectStrings.registerText,
                        onTap: () {
                          if (registerPageFormKey.currentState!.validate()) {
                            registerPageViewModel.signUpToApplication();
                            registerPageViewModel
                                .navigateToLoginControl(context);
                          }
                        },
                      )
                    ],
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  ProjectStrings.youHaveAccount,
                  style: TextStyle(
                    color: Colors.white30,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginPage(),
                        ));
                  },
                  child: CustomText(text: ProjectStrings.loginNowText),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
