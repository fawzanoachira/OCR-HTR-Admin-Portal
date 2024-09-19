import 'package:flutter/material.dart';
import 'package:ocr_admin/config/colors/colors.dart';
import 'package:ocr_admin/config/measures/border_radius.dart';
import 'package:ocr_admin/config/measures/padding.dart';
import 'package:ocr_admin/screens/home/home.dart';

///
/// [MyApp]
///
/// [author] Muhammed Fawzan A
/// [date]	July 10th, 2024
/// [version]	v1.0.0
/// [see]		StatefulWidget
///
/// The main application widget.
class MyApp extends StatelessWidget {
  /// Creates a [MyApp] widget.
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(useMaterial3: true).copyWith(
        // Set the scaffold background color
        scaffoldBackgroundColor: scaffoldBGColor,
        // Customize the app bar theme
        appBarTheme: AppBarTheme(
          color: appBarBGColor,
          foregroundColor: Colors.white,
          titleTextStyle: const TextStyle(fontSize: 24),
        ),
        // Set the text theme for large display text
        textTheme: const TextTheme(displayLarge: TextStyle(fontSize: 32)),
        // Customize the text button theme
        textButtonTheme: const TextButtonThemeData(
          style: ButtonStyle(
            iconColor: WidgetStatePropertyAll(Colors.white),
            iconSize: WidgetStatePropertyAll(40),
          ),
        ),
        // Customize the list tile theme
        listTileTheme: ListTileThemeData(
          tileColor: listTileColor,
          selectedColor: listTileSelectColor,
          shape: RoundedRectangleBorder(borderRadius: bRA8),
        ),
        // Set the dialog background color
        dialogTheme: DialogTheme(backgroundColor: appBarBGColor),
        // Customize the elevated button theme
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(elevatedButtonColor),
            padding: WidgetStatePropertyAll(pX16Y20),
            shape: WidgetStatePropertyAll(
              RoundedRectangleBorder(borderRadius: bRA8),
            ),
            overlayColor: WidgetStatePropertyAll(overlayColor),
          ),
        ),
      ),
      // Set the home screen of the app
      home: const HomeScreen(),
    );
  }
}
