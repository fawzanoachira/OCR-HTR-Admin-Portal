import 'package:flutter/material.dart';
import 'package:ocr_admin/config/colors.dart';
import 'package:ocr_admin/screens/home/home.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(useMaterial3: true).copyWith(
          scaffoldBackgroundColor: scaffoldBGColor,
          appBarTheme: AppBarTheme(
            color: appBarBGColor,
            foregroundColor: Colors.white,
            titleTextStyle: const TextStyle(fontSize: 24),
          ),
          textTheme: const TextTheme(displayLarge: TextStyle(fontSize: 32)),
          textButtonTheme: const TextButtonThemeData(
            style: ButtonStyle(
              iconColor: WidgetStatePropertyAll(Colors.white),
              iconSize: WidgetStatePropertyAll(40),
            ),
          ),
          listTileTheme: const ListTileThemeData(
              tileColor: Color.fromARGB(255, 87, 6, 124),
              selectedColor: Color.fromARGB(255, 143, 22, 199),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)))),
          dialogTheme: DialogTheme(backgroundColor: appBarBGColor),
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ButtonStyle(
                  backgroundColor: const WidgetStatePropertyAll(
                      Color.fromARGB(255, 87, 6, 124)),
                  padding: const WidgetStatePropertyAll(
                      EdgeInsets.symmetric(horizontal: 16, vertical: 20)),
                  shape: const WidgetStatePropertyAll(RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)))),
                  overlayColor: WidgetStatePropertyAll(overlayColor)))),
      home: const HomeScreen(),
    );
  }
}
