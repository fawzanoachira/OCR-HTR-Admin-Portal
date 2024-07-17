import 'package:flutter/material.dart';
import 'package:ocr_admin/api/admin.dart';
import 'package:ocr_admin/api/api.dart';
import 'package:ocr_admin/config/colors/colors.dart';
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
  List<TextEditingController> controllers = [];

  getRoomUserAnnotation() async {
    if (widget.room != null && widget.user != null) {
      annotations =
          await getRoomUserAnnotationAPI(widget.user!.id!, widget.room!.id!);
      for (var annotation in annotations) {
        controllers
            .add(TextEditingController(text: annotation!.annotation ?? ""));
      }
    }
    setState(() {});
  }

  verifyRoomUserAnnotation(Annotations ocrAnnotation) async {
    ocrAnnotation.isVerified = true;
    final int ocrIndex = annotations.indexOf(ocrAnnotation);
    ocrAnnotation.annotation = controllers[ocrIndex].text;
    final annotation = await verifyRoomUserAnnotationAPI(ocrAnnotation);
    controllers[ocrIndex].text = annotation!.annotation ?? "";
    annotations[ocrIndex] = annotation;
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
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              ...annotations.map((i) => Container(
                    margin: const EdgeInsets.all(8),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        color: circleAvatarBGColor,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8))),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        i!.filename != null
                            ? Image(
                                image: NetworkImage("$baseURL${i.filename}"))
                            : const SizedBox(),
                        const SizedBox(height: 8),
                        TextFormField(
                          controller: controllers[annotations.indexOf(i)],
                          decoration: const InputDecoration(
                              border: OutlineInputBorder()),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            i.isVerified!
                                ? Container(
                                    decoration: const BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(8))),
                                    padding: const EdgeInsets.all(8),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          "Verified",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium!
                                              .copyWith(
                                                  color:
                                                      Colors.greenAccent[700]),
                                        ),
                                        const SizedBox(width: 4),
                                        Icon(
                                          Icons.check_circle_rounded,
                                          color: Colors.green[700],
                                        )
                                      ],
                                    ),
                                  )
                                : ElevatedButton(
                                    onPressed: () =>
                                        verifyRoomUserAnnotation(i),
                                    child: const Text('Verify'))
                          ],
                        )
                      ],
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
