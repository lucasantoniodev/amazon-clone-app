// ignore_for_file: unused_local_variable, use_build_context_synchronously

import 'dart:convert';

import 'package:amazon_clone/features/auth/services/find_user_by_id_service.dart';
import 'package:amazon_clone/features/auth/services/token_validation_service.dart';
import 'package:amazon_clone/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FindUserByIdController {
  getUser(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("x-auth-token") ?? "";

    if (token.isEmpty) {
      await prefs.setString("x-auth-token", '');
    }

    final TokenValidationService service = TokenValidationService();
    final responseTokenValidation = await service.execute(token);

    if (responseTokenValidation is Exception) {
      return {
        "message": responseTokenValidation.toString(),
      };
    }

    if (!jsonDecode(responseTokenValidation)) {
      return responseTokenValidation;
    }

    final FindUserByIdService findUserService = FindUserByIdService();
    final responseFindUser = await findUserService.execute(token);

    if (responseFindUser is Exception) {
      return {
        "message": responseFindUser.toString(),
      };
    }

    var userProvider = Provider.of<UserProvider>(context, listen: false)
        .setUser(responseFindUser);
  }
}
