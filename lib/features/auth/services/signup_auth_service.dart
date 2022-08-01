import 'package:amazon_clone/constants/error_handling.dart';
import 'package:amazon_clone/constants/utils.dart';
import 'package:amazon_clone/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SignupAuthService {
  execute({
    required BuildContext context,
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      User user = User(
        id: '',
        name: name,
        email: email,
        password: password,
        address: '',
        type: '',
        token: '',
      );
      String uri = "http://x:3333/api/signup";
      http.Response res =
          await http.post(Uri.parse(uri), body: user.toJson(), headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      });

      httpErrorHandle(
        response: res,
        context: context,
        onSucess: () {
          showSnackBar(
              context, 'Account Created! Login with the same credentials!');
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
