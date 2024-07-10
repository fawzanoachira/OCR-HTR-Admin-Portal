import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:ocr_admin/api/api.dart';
import 'package:ocr_admin/models/annotations.dart';
import 'package:ocr_admin/models/room.dart';
import 'package:ocr_admin/models/user.dart';

final dio = Dio(baseOptions);

Future<Room?> createRoomAPI(Room room) async {
  try {
    final response = await dio.post("/create_room", data: room.toJson());
    return Room.fromJson(response.data);
  } catch (e) {
    log(e.toString());
    return null;
  }
}

Future<List<Room>> getRoomsAPI() async {
  try {
    final response = await dio.get("/get_rooms");
    return Room.listFromJson(response.data);
  } catch (e) {
    log(e.toString());
    return [];
  }
}

Future<List<User?>> getRoomUsersAPI(int roomID) async {
  try {
    final response =
        await dio.post("/get_room_users", data: {"room_id": roomID});
    return User.listFromJson(response.data);
  } catch (e) {
    log(e.toString());
    return [];
  }
}

Future<List<Annotations?>> getRoomUserAnnotationAPI(
    int userID, int roomID) async {
  try {
    final response = await dio.post("/get_room_user_annotations",
        data: {"user_id": userID, "room_id": roomID});
    log(response.data.toString());
    return Annotations.listFromJson(response.data);
  } catch (e) {
    log(e.toString());
    return [];
  }
}
