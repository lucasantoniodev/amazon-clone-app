import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class FindUserByIdService {
  execute(String token) async {
    try {
      final String host = dotenv.get('API_HOST');
      final String port = dotenv.get('API_PORT');

      final Uri uri = Uri.parse("$host:$port/");

      http.Response response = await http.get(
        uri,
        headers: {
          "Content-Type": "application/json",
          "x-auth-token": token,
        },
      );

      return response.body;
    } catch (e) {
      return Exception(e);
    }
  }
}
