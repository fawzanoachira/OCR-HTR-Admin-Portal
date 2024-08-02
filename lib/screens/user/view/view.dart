import 'package:flutter/material.dart';
import 'package:ocr_admin/api/admin.dart';
import 'package:ocr_admin/models/room.dart';
import 'package:ocr_admin/models/user.dart';
import 'package:ocr_admin/screens/user_annotation/view/view.dart';

class RoomUsers extends StatefulWidget {
  const RoomUsers({this.room, super.key});
  final Room? room;

  @override
  State<RoomUsers> createState() => _RoomUsersState();
}

class _RoomUsersState extends State<RoomUsers> {
  List<User?> roomUsers = [];
  double totalScore = 0;

  getRoomUsers() async {
    if (widget.room != null) {
      roomUsers = await getRoomUsersAPI(widget.room!.id!);
    }
    setState(() {
      roomUsers.sort(
        (a, b) => b!.score!.compareTo(a!.score as num),
      );
      totalScore = 0.0;
      for (var element in roomUsers) {
        if (element == null) {
          continue;
        }
        if (element.score == null) {
          continue;
        }
        totalScore = totalScore + element.score!;
      }
    });
  }

  @override
  void initState() {
    super.initState();
    getRoomUsers();
  }

  navigateToAnnotation(user) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => UserAnnotation(
              room: widget.room,
              user: user,
            )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("List of users"), actions: [
        Text('Completed: ${(totalScore * 10).floor().toString()}'),
        const SizedBox(width: 8),
        IconButton(
            onPressed: () => getRoomUsers(), icon: const Icon(Icons.refresh)),
        const SizedBox(width: 8)
      ]),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
        child: Column(children: [
          ...roomUsers.map((i) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
                  onTap: () => navigateToAnnotation(i),
                  leading: roomUsers.indexOf(i) > 2
                      ? Text("${roomUsers.indexOf(i) + 1}",
                          style: const TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontSize: 20))
                      : roomUsers.indexOf(i) == 0
                          ? const Icon(Icons.workspace_premium,
                              color: Color(0xFFFFD700))
                          : roomUsers.indexOf(i) == 1
                              ? const Icon(Icons.workspace_premium,
                                  color: Color(0xFFC0C0C0))
                              : const Icon(Icons.workspace_premium,
                                  color: Color(0xFFCD7F32)),
                  title: Row(mainAxisSize: MainAxisSize.min, children: [
                    Row(mainAxisSize: MainAxisSize.min, children: [
                      if (i!.userName != "") ...[
                        CircleAvatar(
                            child: Text((i.userName ?? "OA")[0].toUpperCase()))
                      ]
                    ]),
                    const SizedBox(width: 12),
                    if (i.userName != "") ...[Text((i.userName.toString()))]
                  ]),
                  trailing: Row(mainAxisSize: MainAxisSize.min, children: [
                    Text('${(i.score! * 10).floor()} XP',
                        style: const TextStyle(
                            color: Color.fromARGB(255, 181, 95, 252),
                            fontSize: 16))
                  ]))))
        ]),
      ),
    );
  }
}
