import 'package:amazon_clone/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main(List<String> args) async {
  await dotenv.load(fileName: '.env');
  runApp(const App());
}
