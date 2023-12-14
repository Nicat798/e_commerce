import 'package:flutter/material.dart';

class WelcomePageImage extends StatelessWidget {
  const WelcomePageImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Image(
      width: MediaQuery.of(context).size.width / 1.3,
      fit: BoxFit.contain,
      image: const AssetImage("assets/welcome_screen_headphone.png"),
    );
  }
}
