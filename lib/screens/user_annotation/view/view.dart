import 'package:flutter/material.dart';
import 'package:ocr_admin/api/admin.dart';
import 'package:ocr_admin/api/api.dart';
import 'package:ocr_admin/models/annotations.dart';
import 'package:ocr_admin/models/room.dart';
import 'package:ocr_admin/models/user.dart';

class UserAnnotation extends StatefulWidget {
  const UserAnnotation({this.room, this.user, super.key});
  final Room? room;
  final User? user;

  @override
  State<UserAnnotation> createState() => _UserAnnotationState();
}

class _UserAnnotationState extends State<UserAnnotation> {
  List<Annotations?> annotations = [];

  getRoomUserAnnotation() async {
    if (widget.room != null && widget.user != null) {
      annotations =
          await getRoomUserAnnotationAPI(widget.user!.id!, widget.room!.id!);
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getRoomUserAnnotation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Annotations")),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ...annotations.map((i) => Container(
                  decoration: const BoxDecoration(),
                  child: Column(
                    children: [
                      i!.filename != null
                          ? Image(image: NetworkImage("$baseURL/${i.filename}"))
                          : const SizedBox()
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
