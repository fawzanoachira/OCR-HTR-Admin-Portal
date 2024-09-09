import 'package:flutter/material.dart';
import 'package:ocr_admin/app.dart';

/// The main entry point for the application.
void main(List<String> args) {
  /// Ensure that widget binding is initialized.
  WidgetsFlutterBinding.ensureInitialized();

  /// Run the app by calling runApp with an instance of MyApp.
  ///
  /// [MyApp] is the root widget of the application, defined in app.dart.
  runApp(const MyApp());
}