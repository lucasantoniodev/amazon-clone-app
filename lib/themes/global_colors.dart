import 'package:flutter/material.dart';

class GlobalColors {
  // COLORS
  static const appBarGradient = LinearGradient(
    colors: [
      Color.fromARGB(255, 29, 201, 192),
      Color.fromARGB(255, 125, 221, 216),
    ],
    stops: [0.5, 1.0],
  );

  static const primaryColor = Colors.blue;
  static const secondaryColor = Color.fromRGBO(255, 153, 0, 1);

  static const backgroundColor = Colors.white;
  static const greyBackgroundCOlor = Color(0xffebecee);

  static final selectedNavBarColor = Colors.cyan[800]!;
  static const unselectedNavBarColor = Colors.black87;

  static const iconPrimaryColor = Colors.black;
}
