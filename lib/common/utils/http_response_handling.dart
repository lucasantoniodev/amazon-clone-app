import 'dart:convert';

import 'package:amazon_clone/common/utils/show_snack_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

void httpResponseHandling({
  required http.Response response,
  required BuildContext context,
  required VoidCallback onSucess,
}) {
  switch (response.statusCode) {
    case 200:
      onSucess();
      break;
    case 400:
      showSnackBar(context, jsonDecode(response.body)['message']);
      break;
    case 500:
      showSnackBar(context, jsonDecode(response.body)['error']);
      break;
    default:
      showSnackBar(context, response.body);
  }
}
