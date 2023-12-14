import 'package:e_commerce_demo/core/constants/colors.dart';
import 'package:e_commerce_demo/core/constants/strings.dart';
import 'package:e_commerce_demo/views/electronics_page_view.dart';
import 'package:e_commerce_demo/views/jawelery_page_view.dart';
import 'package:e_commerce_demo/views/mens_clothings_page_view.dart';
import 'package:e_commerce_demo/views/womens_clothing_page_view.dart';
import 'package:e_commerce_demo/widgets/general_widgets/custom_appbar_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final List<Widget> tabWidgets = const [
    Text(ProjectStrings.jaweleryTab),
    Text(ProjectStrings.electronicsTab),
    Text(ProjectStrings.mensClothingTab),
    Text(ProjectStrings.womensClothingTab)
  ];

  final List<Widget> tabbarWidgets = [
    const Jawelery(),
    const Electronics(),
    const MensClothings(),
    const WomensClothings(),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: CustomAppBar(
          bottom: TabBar(
            tabs: tabWidgets,
          ),
        ),
        backgroundColor: ProjectColors.backgroundColor,
        body: TabBarView(
          children: tabbarWidgets,
        ),
      ),
    );
  }
}
