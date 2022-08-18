import 'package:amazon_clone/app.dart';
import 'package:amazon_clone/providers/user_provider.dart';
import 'package:flutter/material.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';

void main(List<String> args) {
  settings();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => UserProvider(),
        )
      ],
      child: const App(),
    ),
  );
}

settings() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: '.env');
  // SystemChrome.setSystemUIOverlayStyle(
  //   const SystemUiOverlayStyle(
  //     statusBarColor: Color.fromARGB(255, 15, 5, 127),
  //     systemNavigationBarColor: Color.fromARGB(255, 15, 5, 127),
  //   ),
  // );
}
