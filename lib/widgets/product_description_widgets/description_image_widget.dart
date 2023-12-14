import 'package:flutter/material.dart';

class DescriptionImage extends StatelessWidget {
  const DescriptionImage({super.key, required this.imagePath});
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      imagePath,
      height: 130.0,
      fit: BoxFit.cover,
    );
  }
}
