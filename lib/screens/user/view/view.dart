import 'package:flutter/material.dart';
import 'package:ocr_admin/api/admin.dart';
import 'package:ocr_admin/config/colors/colors.dart';
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
      appBar: AppBar(
        title: const Text("List of users"),
        actions: [
          Text('Completed: ${(totalScore * 10).floor().toString()}'),
          const SizedBox(width: 8),
          IconButton(
              onPressed: () => getRoomUsers(), icon: const Icon(Icons.refresh)),
          const SizedBox(width: 8)
        ],
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          ...roomUsers.map((i) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                onTap: () => navigateToAnnotation(i),
                leading: CircleAvatar(
                  backgroundColor: circleAvatarBGColor,
                  child: Text(i?.id.toString() ?? ""),
                ),
                title: Text(i!.userName ?? ""),
                subtitle: Text('Total Score: ${(i.score! * 10).floor()}'),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text("Place: ", style: TextStyle(fontSize: 20)),
                    Text(
                      "${roomUsers.indexOf(i) + 1}",
                      style: const TextStyle(
                          color: Color.fromARGB(255, 252, 212, 95),
                          fontSize: 25),
                    ),
                  ],
                ),
              )))
        ]),
      ),
    );
  }
}
