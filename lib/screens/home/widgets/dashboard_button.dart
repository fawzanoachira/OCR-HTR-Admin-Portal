import 'package:flutter/material.dart';
import 'package:ocr_admin/screens/room/room.dart';

/// A custom button widget for the dashboard.
///
/// This widget creates a button with an icon and text, designed for use in a dashboard layout.
/// It navigates to different screens based on the button's title.
class DashboardButton extends StatelessWidget {
  /// Creates a [DashboardButton].
  ///
  /// The [theme], [title], and [icon] must not be null.
  const DashboardButton({
    super.key,
    required this.theme,
    required this.title,
    required this.icon,
  });

  /// The theme data to be used for styling the button.
  final ThemeData theme;

  /// The title text to be displayed on the button.
  final String title;

  /// The icon to be displayed alongside the title.
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
