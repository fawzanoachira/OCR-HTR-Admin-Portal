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

  getRoomUsers() async {
    if (widget.room != null) {
      roomUsers = await getRoomUsersAPI(widget.room!.id!);
    }
    setState(() {});
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
      appBar: AppBar(title: const Text("List of users")),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ...roomUsers.map((i) => Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: ListTile(
                    onTap: () => navigateToAnnotation(i),
                    leading: CircleAvatar(
                      backgroundColor: const Color.fromARGB(255, 143, 22, 199),
                      child: Text(i?.id.toString() ?? ""),
                    ),
                    title: Text(i!.userName ?? ""),
                    subtitle: Text(i.score.toString()),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
