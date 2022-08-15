import 'package:amazon_clone/features/auth/screens/auth_check.dart';
import 'package:amazon_clone/routes/router.dart';
import 'package:amazon_clone/themes/app_material_theme.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Amazon Clone',
      theme: AppMaterialTheme.theme,
      // routes: {'/auth-screen': (context) => const AuthScreen()},
      onGenerateRoute: generateRoute,
      home: const AuthCheck(),
    );
  }
}
