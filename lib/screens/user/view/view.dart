import 'package:flutter/material.dart';
import 'package:ocr_admin/api/admin.dart';
import 'package:ocr_admin/models/room.dart';
import 'package:ocr_admin/models/user.dart';
import 'package:ocr_admin/screens/user_annotation/view/view.dart';

/// A widget that displays a list of users in a room.
class RoomUsers extends StatefulWidget {
  /// Creates a [RoomUsers] widget.
  ///
  /// The [room] parameter is optional and represents the room whose users are being displayed.
  const RoomUsers({this.room, super.key});

  /// The room whose users are being displayed.
  final Room? room;

  @override
  State<RoomUsers> createState() => _RoomUsersState();
}

class _RoomUsersState extends State<RoomUsers> {
  /// List of users in the room.
  List<User?> roomUsers = [];

  /// Total score of all users in the room.
  double totalScore = 0;

  /// Fetches the list of users in the room from the API.
  Future<void> getRoomUsers() async {
    if (widget.room != null) {
      roomUsers = await getRoomUsersAPI(widget.room!.id!);
    }
    setState(() {
      // Sort users by score in descending order
      roomUsers.sort(
        (a, b) => b!.score!.compareTo(a!.score as num),
      );
      // Calculate total score
      totalScore = 0.0;
      for (var element in roomUsers) {
        if (element == null || element.score == null) {
          continue;
        }
        totalScore += element.score!;
      }
    });
  }

  @override
  void initState() {
    super.initState();
    getRoomUsers();
  }

  /// Navigates to the UserAnnotation screen for the selected user.
  void navigateToAnnotation(User? user) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => UserAnnotation(
              room: widget.room,
              user: user,
            )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("List of users"),
        actions: [
          Text('Completed: ${(totalScore * 10).floor().toString()}'),
          const SizedBox(width: 8),
          IconButton(
              onPressed: () => getRoomUsers(),
              icon: const Icon(Icons.refresh)),
          const SizedBox(width: 8)
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
        child: Column(
          children: [
            ...roomUsers.map((i) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 4),
                    onTap: () => navigateToAnnotation(i),
                    leading: _buildLeadingWidget(roomUsers.indexOf(i)),
                    title: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            if (i!.userName != "") ...[
                              CircleAvatar(
                                  child: Text(
                                      (i.userName ?? "OA")[0].toUpperCase()))
                            ]
                          ],
                        ),
                        const SizedBox(width: 12),
                        if (i.userName != "") ...[Text(i.userName.toString())]
                      ],
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('${(i.score! * 10).floor()} XP',
                            style: const TextStyle(
                                color: Color.fromARGB(255, 181, 95, 252),
                                fontSize: 16))
                      ],
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }

  /// Builds the leading widget for the ListTile based on the user's rank.
  Widget _buildLeadingWidget(int index) {
    if (index > 2) {
      return Text("${index + 1}",
          style: const TextStyle(
              color: Color.fromARGB(255, 255, 255, 255), fontSize: 20));
    } else {
      final Color color = index == 0
          ? const Color(0xFFFFD700)
          : index == 1
              ? const Color(0xFFC0C0C0)
              : const Color(0xFFCD7F32);
      return Icon(Icons.workspace_premium, color: color);
    }
  }
}
