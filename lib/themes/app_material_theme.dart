import 'package:amazon_clone/themes/app_global_colors.dart';
import 'package:flutter/material.dart';

class AppMaterialTheme {
  static ThemeData theme = ThemeData(
    primarySwatch: AppGlobalColors.primaryColor,
    scaffoldBackgroundColor: AppGlobalColors.backgroundColor,
    colorScheme: const ColorScheme.light(
      primary: AppGlobalColors.secondaryColor,
    ),
    appBarTheme: const AppBarTheme(
      elevation: 0,
      iconTheme: IconThemeData(color: AppGlobalColors.iconPrimaryColor),
    ),
  );
}
