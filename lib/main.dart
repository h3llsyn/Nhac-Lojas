import 'package:flutter/material.dart';
import 'package:nhac_lojas/pages/home_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      theme: ThemeData(
        scaffoldBackgroundColor: Color.fromARGB(255, 255, 231, 229),
        textTheme: TextTheme(
          bodyMedium: TextStyle(color: Color.fromARGB(255, 93, 32, 28))
        )
      ),
    );
  }
}
