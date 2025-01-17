import 'package:flutter/material.dart';
import 'package:ocr_admin/screens/home/widgets/dashboard_button.dart';

///
/// [HomeScreen]
///
/// [author] Muhammed Fawzan A
/// [date]	July 10th, 2024
/// [version]	v1.0.0
/// [see]		StatefulWidget
///
/// A widget that displays the home screen of the admin dashboard.
///
/// This screen contains a dashboard button for navigating to the Room section.
class HomeScreen extends StatelessWidget {
  /// Creates a [HomeScreen] widget.
  ///
  /// The [key] parameter is optional and is used to control how one widget replaces
  /// another widget in the tree.
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
        appBar: AppBar(title: const Center(child: Text("Admin Dashboard"))),
        body: Padding(
            padding: const EdgeInsets.all(32),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Dashboard button for the Room section
                  DashboardButton(
                      theme: theme,
                      title: "Room",
                      icon: Icons.meeting_room_sharp)
                ])));
  }
}
