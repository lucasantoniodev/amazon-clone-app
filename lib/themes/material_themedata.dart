import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/themes/global_colors.dart';
import 'package:flutter/material.dart';

class MaterialTheme {
  static ThemeData theme = ThemeData(
        primarySwatch: GlobalColors.primaryColor,
        scaffoldBackgroundColor: GlobalColors.backgroundColor,
        colorScheme:
            const ColorScheme.light(primary: GlobalColors.secondaryColor),
        appBarTheme: const AppBarTheme(
          elevation: 0,
          iconTheme: IconThemeData(color: GlobalColors.iconPrimaryColor),
        ),
      );
}