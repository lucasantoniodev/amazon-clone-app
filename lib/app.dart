import 'package:amazon_clone/themes/material_themedata.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Amazon Clone',
      theme: MaterialTheme.theme,
      home: Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text('Hello!'),
          ),
        ),
        body: Column(
          children: [
            const Center(child: Text("Home page")),
            ElevatedButton(
              onPressed: () {},
              child: const Text("Button"),
            )
          ],
        ),
      ),
    );
  }
}
