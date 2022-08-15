import 'package:amazon_clone/common/components/botom_bar_component.dart';
import 'package:amazon_clone/features/auth/controllers/find_user_by_id_controller.dart';
import 'package:amazon_clone/features/auth/screens/auth_screen.dart';
import 'package:amazon_clone/models/user_model.dart';
import 'package:amazon_clone/providers/user_provider.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class AuthCheck extends StatefulWidget {
  const AuthCheck({Key? key}) : super(key: key);

  @override
  State<AuthCheck> createState() => _AuthCheckState();
}

class _AuthCheckState extends State<AuthCheck> {
  late FindUserByIdController userController;

  @override
  void initState() {
    userController = FindUserByIdController();
    userController.getUser(context);
    super.initState();
  }

  loading() {
    return const Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }

  @override
  Widget build(BuildContext context) {
    User user = Provider.of<UserProvider>(context).user;

    if (user.token.isEmpty) {
      return const AuthScreen();
    } else if (user.token != "") {
      return const BottomBarComponent();
    }
    return loading();
  }
}
