import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomAppBar extends AppBar {
  String titl;
  CustomAppBar({
    required this.titl,
    super.key,
  }) : super(
          centerTitle: true,
          title: Text(titl),
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  FontAwesomeIcons.cartShopping,
                  color: Colors.black,
                ))
          ],
        );
}
