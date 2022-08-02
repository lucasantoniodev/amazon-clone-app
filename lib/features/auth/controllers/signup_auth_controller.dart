// ignore_for_file: avoid_print

import 'package:amazon_clone/common/utils/http_response_handling.dart';
import 'package:amazon_clone/common/utils/show_snack_bar.dart';
import 'package:amazon_clone/features/auth/services/signup_auth_service.dart';
import 'package:amazon_clone/models/user_model.dart';
import 'package:flutter/material.dart';


class SignupAuthController {
  handle({required BuildContext context, required User user}) async {
    final SignupAuthService authService = SignupAuthService();
    final response = await authService.execute(user, context);

    if (response is Exception) {
      print(response.toString());
      return;
    }
    
    httpResponseHandling(
      response: response,
      context: context,
      onSucess: () {
        showSnackBar(context, "User created with sucess!");
      },
    );
  }
}
