// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:amazon_clone/common/utils/http_response_handling.dart';
import 'package:amazon_clone/common/utils/show_snack_bar.dart';
import 'package:amazon_clone/common/components/botom_bar_component.dart';
import 'package:amazon_clone/features/auth/services/signin_auth_service.dart';
import 'package:amazon_clone/models/user_model.dart';
import 'package:amazon_clone/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SigninAuthController {
  handle({required BuildContext context, required User user}) async {
    final SigninAuthService authService = SigninAuthService();
    final response = await authService.execute(user);

    if (response is Exception) {
      //response.message
      showSnackBar(context, response.toString());
      return;
    }

    httpResponseHandling(
      response: response,
      context: context,
      onSucess: () async {
        try {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          Provider.of<UserProvider>(context, listen: false)
              .setUser(response.body);
          prefs.setString(
              "x-auth-token", "${jsonDecode(response.body)['token'] ?? ""}");
          Navigator.pushNamedAndRemoveUntil(
            context,
            arguments: "Palavra secreta",
            BottomBarComponent.routeName,
            (route) => false,
          );
        } catch (e) {
          print(e);
        }
      },
    );
  }
}
