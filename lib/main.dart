import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nhac_lojas/routes/go_router.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color.fromARGB(255, 93, 32, 28);
    const backgroundColor = Color.fromARGB(255, 255, 231, 229);

    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp.router(
          routerConfig: appRouter,
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            useMaterial3: true,
            fontFamily: 'Roboto',
            scaffoldBackgroundColor: backgroundColor,
            colorScheme: ColorScheme.fromSeed(
              seedColor: primaryColor,
              surface: backgroundColor,
              onSurface: primaryColor,
              primary: primaryColor,
            ),
            textTheme: const TextTheme(
              bodyLarge: TextStyle(color: primaryColor),
              bodyMedium: TextStyle(color: primaryColor),
              bodySmall: TextStyle(color: primaryColor),
              titleLarge: TextStyle(color: primaryColor),
              titleMedium: TextStyle(color: primaryColor),
            ),
            bottomSheetTheme: BottomSheetThemeData(
              dragHandleColor: Colors.grey
            ),
          ),
        );
      },
    );
  }
}