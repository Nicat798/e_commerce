import 'package:e_commerce_demo/views/card_page_view.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar(
      {super.key,
      this.bottom,
      this.preferredSize = const Size.fromHeight(90.0)});

  @override
  final Size preferredSize;
  final PreferredSizeWidget? bottom;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      bottom: bottom,
      backgroundColor: Colors.transparent,
      elevation: 0,
      actions: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CardPageView(),
                    ));
              },
              icon: const Icon(Icons.shopping_basket),
            ),
            IconButton(
              onPressed: () {
                final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
                firebaseAuth.signOut();
              },
              icon: const Icon(Icons.logout_outlined),
            )
          ],
        )
      ],
    );
  }
}
