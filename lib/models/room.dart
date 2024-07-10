class Room {
  int? id;
  String? name;
  String? description;
  int? targetTime;

  Room({this.id, this.name, this.description, this.targetTime});

  Room.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    targetTime = json['target_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['target_time'] = targetTime;
    return data;
  }

  static List<Room> listFromJson(List<dynamic> list) {
    List<Room> rows = list.map((i) => Room.fromJson(i)).toList();
    return rows;
  }
}
