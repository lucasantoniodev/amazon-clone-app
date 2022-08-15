import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class TokenValidationService {
  execute(String token) async {
    try {
      final String host = dotenv.get('API_HOST');
      final String port = dotenv.get('API_PORT');

      final Uri uri = Uri.parse("$host:$port/api/tokenisvalid");

      http.Response response = await http.post(
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
