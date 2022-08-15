// ignore_for_file: avoid_print

import 'package:amazon_clone/common/components/botom_bar_component.dart';
import 'package:amazon_clone/features/auth/screens/auth_screen.dart';
import 'package:amazon_clone/features/home/screens/home_screen.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case AuthScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const AuthScreen(),
      );
    case HomeScreen.routeName:
      return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) {
            print(routeSettings.arguments);
            return const HomeScreen();
          });
    case BottomBarComponent.routeName:
      return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) {
            print(routeSettings.arguments);
            return const BottomBarComponent();
          });
    default:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const Scaffold(
          body: Center(child: Text("Page not found")),
        ),
      );
  }
}
