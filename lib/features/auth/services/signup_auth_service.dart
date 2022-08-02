import 'package:amazon_clone/common/utils/show_snack_bar.dart';
import 'package:amazon_clone/models/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class SignupAuthService {
  execute(User user, BuildContext context) async {
    try {
      final String host = dotenv.get('API_HOST');
      final String port = dotenv.get('API_PORT');

      final Uri uri = Uri.parse("$host:$port/api/signup");

      final response = await http.post(
        uri,
        body: user.toJson(),
        headers: {"Content-Type": "application/json"},
      );

      return response;
    } catch (e) {
      showSnackBar(context, e.toString());
     
    }
  }
}
