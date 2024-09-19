import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:ocr_admin/api/api.dart';
import 'package:ocr_admin/models/annotations.dart';
import 'package:ocr_admin/models/room.dart';
import 'package:ocr_admin/models/user.dart';


/// Dio instance for making HTTP requests
final dio = Dio(baseOptions);

/// Creates a new room using the provided [Room] object.
///
/// Returns the created [Room] object if successful, null otherwise.
Future<Room?> createRoomAPI(Room room) async {
  try {
    final response = await dio.post("/create_room", data: room.toJson());
    return Room.fromJson(response.data);
  } catch (e) {
    log(e.toString());
    return null;
  }
}

/// Fetches all available rooms.
///
/// Returns a list of [Room] objects. If an error occurs, returns an empty list.
Future<List<Room>> getRoomsAPI() async {
  try {
    final response = await dio.get("/get_rooms");
    return Room.listFromJson(response.data);
  } catch (e) {
    log(e.toString());
    return [];
  }
}

/// Retrieves users associated with a specific room.
///
/// [roomID] is the ID of the room to fetch users for.
/// Returns a list of [User] objects. If an error occurs, returns an empty list.
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

/// Fetches annotations for a specific user in a specific room.
///
/// [userID] is the ID of the user.
/// [roomID] is the ID of the room.
/// Returns a list of [Annotations] objects. If an error occurs, returns an empty list.
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

/// Verifies a user's annotation for a room.
///
/// [ocrAnnotation] is the [Annotations] object to be verified.
/// Returns the verified [Annotations] object if successful, null otherwise.
Future<Annotations?> verifyRoomUserAnnotationAPI(
    Annotations ocrAnnotation) async {
  try {
    log(ocrAnnotation.toJson().toString());
    final response = await dio.post("/verify_room_user_annotation",
        data: ocrAnnotation.toJson());
    log(response.data.toString());
    return Annotations.fromJson(response.data);
  } catch (e) {
    log(e.toString());
  }
  return null;
}