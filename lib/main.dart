import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nhac_lojas/pages/main_shell.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          home: const MainShell(),
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: 'Roboto',
            scaffoldBackgroundColor: Color.fromARGB(255, 255, 231, 229),
            textTheme: TextTheme(
              bodyMedium: TextStyle(color: Color.fromARGB(255, 93, 32, 28))
            )
          ),
        );
      },
    );
  }
}