import 'package:flutter/material.dart';
import 'package:ocr_admin/screens/home/widgets/dashboard_button.dart';

class HomeScreen extends StatelessWidget {
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
                  DashboardButton(
                      theme: theme,
                      title: "Room",
                      icon: Icons.meeting_room_sharp)
                ])));
  }
}
