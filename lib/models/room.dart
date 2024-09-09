/// Represents a room in the system.
class Room {
  /// The unique identifier of the room.
  int? id;

  /// The name of the room.
  String? name;

  /// A description of the room.
  String? description;

  /// The target time associated with the room, typically in seconds.
  int? targetTime;

  /// Creates a new [Room] instance.
  ///
  /// All parameters are optional.
  Room({this.id, this.name, this.description, this.targetTime});

  /// Creates a [Room] instance from a JSON map.
  ///
  /// [json] is the map containing the room data.
  Room.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    targetTime = json['target_time'];
  }

  /// Converts the [Room] instance to a JSON map.
  ///
  /// Returns a map representation of the room.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['target_time'] = targetTime;
    return data;
  }

  /// Creates a list of [Room] from a JSON list.
  ///
  /// [list] is the list of JSON maps to convert.
  ///
  /// Returns a list of [Room] instances.
  static List<Room> listFromJson(List<dynamic> list) {
    List<Room> rows = list.map((i) => Room.fromJson(i)).toList();
    return rows;
  }
}
