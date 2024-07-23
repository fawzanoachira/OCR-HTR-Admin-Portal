import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:ocr_admin/api/admin.dart';
import 'package:ocr_admin/config/colors/colors.dart';
import 'package:ocr_admin/models/room.dart';
import 'package:ocr_admin/screens/user/view/view.dart';

class Rooms extends StatefulWidget {
  const Rooms({super.key});

  @override
  State<Rooms> createState() => _RoomsState();
}

class _RoomsState extends State<Rooms> {
  void _createRoom() async {
    final room = Room(
        name: nameController.text.toString(),
        description: descriptionController.text.toString(),
        targetTime: int.tryParse(targetTimeController.text.toString()));

    log(room.toJson().toString());
    await createRoomAPI(room);
    getRooms();
    setState(() {});
  }

  final TextEditingController nameController = TextEditingController();

  final TextEditingController descriptionController = TextEditingController();

  final TextEditingController targetTimeController = TextEditingController();

  void _show(BuildContext ctx) {
    showDialog(
      context: ctx,
      builder: (context) {
        return Dialog(
          elevation: 8,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8))),
          // insetPadding: const EdgeInsets.all(210),
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                TextFormField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter room name',
                  ),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: descriptionController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter room description',
                  ),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  keyboardType: TextInputType.number,
                  controller: targetTimeController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter target time',
                  ),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                    onPressed: () {
                      _createRoom();
                      Navigator.pop(context);
                    },
                    child: const Text("Create room"))
              ],
            ),
          ),
        );
      },
    );
  }

  List<Room> rooms = [];
  getRooms() async {
    rooms = await getRoomsAPI();
    setState(() {});
  }

  navigateToRoomUser(Room room) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => RoomUsers(room: room)));
  }

  @override
  void initState() {
    super.initState();
    getRooms();
  }

  @override
  void dispose() {
    nameController.dispose();
    descriptionController.dispose();
    targetTimeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Rooms"),
        actions: [
          IconButton(
              onPressed: () => getRooms(),
              icon: const Icon(Icons.refresh_rounded))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton.icon(
                    onPressed: () {
                      _show(context);
                    },
                    icon: const Icon(Icons.add),
                    style: const ButtonStyle(
                        iconColor: WidgetStatePropertyAll(Colors.white),
                        iconSize: WidgetStatePropertyAll(30)),
                    label: const Text("Create New Room",
                        style: TextStyle(color: Colors.white, fontSize: 20)),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              ...rooms.map((i) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      onTap: () => navigateToRoomUser(i),
                      leading: CircleAvatar(
                        backgroundColor: circleAvatarBGColor,
                        child: Text(i.id.toString()),
                      ),
                      title: Text(i.name ?? ""),
                      subtitle: Text(i.description ?? ""),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Target Time: ${i.targetTime.toString()} minutes',
                            style: const TextStyle(fontSize: 16),
                          ),
                          TextButton(
                              onPressed: () => navigateToRoomUser(i),
                              child: const Icon(Icons.arrow_right_rounded)),
                        ],
                      ),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
