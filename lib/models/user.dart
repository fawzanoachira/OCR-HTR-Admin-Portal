/// Represents a user in the system.
class User {
  /// The username of the user.
  String? userName;

  /// The ID of the room the user is associated with.
  int? roomID;

  /// Information about the user's device.
  String? deviceInfo;

  /// The user's score.
  double? score;

  /// The unique identifier for the user.
  int? id;

  /// Creates a new [User] instance.
  ///
  /// All parameters are optional.
  User({this.userName, this.roomID, this.deviceInfo, this.score, this.id});

  /// Creates a [User] instance from a JSON map.
  ///
  /// [json] is the map containing the user data.
  User.fromJson(Map<String, dynamic> json) {
    userName = json['username'];
    roomID = json['room_id'];
    deviceInfo = json['device_info'];
    score = json['score'];
    id = json['id'];
  }

  /// Converts the [User] instance to a JSON map.
  ///
  /// Returns a map representation of the user.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['username'] = userName;
    data['room_id'] = roomID;
    data['device_info'] = deviceInfo;
    data['score'] = score;
    data['id'] = id;
    return data;
  }

  /// Creates a list of [User] from a JSON list.
  ///
  /// [list] is the list of JSON maps to convert.
  ///
  /// Returns a list of [User] instances.
  static List<User> listFromJson(List<dynamic> list) {
    List<User> rows = list.map((i) => User.fromJson(i)).toList();
    return rows;
  }
}
