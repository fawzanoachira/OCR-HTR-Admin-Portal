import 'package:flutter/material.dart';
import 'package:ocr_admin/screens/room/room.dart';

class DashboardButton extends StatelessWidget {
  const DashboardButton({
    super.key,
    required this.theme,
    required this.title,
    required this.icon,
  });

  final ThemeData theme;
  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  title == "Room" ? const Rooms() : const Placeholder())),
      label: Text(title, style: theme.textTheme.displayLarge),
      icon: Icon(icon),
    );
  }
}
