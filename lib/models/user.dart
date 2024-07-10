class User {
  String? userName;
  int? roomID;
  String? deviceInfo;
  double? score;
  int? id;

  User({this.userName, this.roomID, this.deviceInfo, this.score, id});

  User.fromJson(Map<String, dynamic> json) {
    userName = json['username'];
    roomID = json['room_id'];
    deviceInfo = json['device_info'];
    score = json['score'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['username'] = userName;
    data['room_id'] = roomID;
    data['device_info'] = deviceInfo;
    data['score'] = score;
    data['id'] = id;
    return data;
  }

  static List<User> listFromJson(List<dynamic> list) {
    List<User> rows = list.map((i) => User.fromJson(i)).toList();
    return rows;
  }
}
