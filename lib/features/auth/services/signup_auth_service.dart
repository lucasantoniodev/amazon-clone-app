import 'package:amazon_clone/models/user_model.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart';

class SignupAuthService {
  execute(User user) async {
    try {
      final String host = dotenv.get('HOST');
      final Uri uri = Uri.parse("$host:3333/api/signup");
      final response = await post(
        uri,
        body: user.toJson(),
        headers: {"Content-Type": "application/json"},
      );
      return response;
    } catch (e) {
      return Exception(e);
    }
  }
}
