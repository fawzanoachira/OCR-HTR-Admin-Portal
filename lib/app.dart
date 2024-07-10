import 'package:flutter/material.dart';
import 'package:ocr_admin/config/colors/colors.dart';
import 'package:ocr_admin/config/measures/border_radius.dart';
import 'package:ocr_admin/config/measures/padding.dart';
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
          listTileTheme: ListTileThemeData(
              tileColor: listTileColor,
              selectedColor: listTileSelectColor,
              shape: RoundedRectangleBorder(borderRadius: bRA8)),
          dialogTheme: DialogTheme(backgroundColor: appBarBGColor),
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(elevatedButtonColor),
                  padding: WidgetStatePropertyAll(pX16Y20),
                  shape: WidgetStatePropertyAll(
                      RoundedRectangleBorder(borderRadius: bRA8)),
                  overlayColor: WidgetStatePropertyAll(overlayColor)))),
      home: const HomeScreen(),
    );
  }
}
