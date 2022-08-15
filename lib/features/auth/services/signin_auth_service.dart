// EXTERNAL
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

// INTERNAL
import 'package:amazon_clone/models/user_model.dart';

class SigninAuthService {
  execute(
    User user,
  ) async {
    try {
      final String host = dotenv.get('API_HOST');
      final String port = dotenv.get('API_PORT');

      final Uri uri = Uri.parse("$host:$port/api/signin");

      final response = await http.post(
        uri,
        body: user.toJson(),
        headers: {
          "Content-Type": "application/json",
        },
      );

      return response;
    } catch (e) {
      return Exception(e);
    }
  }
}
