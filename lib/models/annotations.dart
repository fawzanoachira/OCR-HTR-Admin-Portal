class Annotations {
  String? filename;
  String? annotation;
  String? status;
  String? annotator;
  bool? isAnnotable;
  int? id;
  bool? isVerified;
  int? roomID;

  Annotations(
      {this.filename,
      this.annotation,
      this.status,
      this.annotator,
      this.isAnnotable,
      this.id,
      this.isVerified,
      this.roomID});

  Annotations.fromJson(Map<String, dynamic> json) {
    filename = json['filename'];
    annotation = json['annotation'];
    status = json['status'];
    annotator = json['annotator'];
    isAnnotable = json['is_annotable'];
    id = json['id'];
    isVerified = json['is_verified'];
    roomID = json['room_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['filename'] = filename;
    data['annotation'] = annotation;
    data['status'] = status;
    data['annotator'] = annotator;
    data['is_annotable'] = isAnnotable;
    data['id'] = id;
    data['is_verified'] = isVerified;
    data['room_id'] = roomID;
    return data;
  }

  static List<Annotations> listFromJson(List<dynamic> list) {
    List<Annotations> rows = list.map((i) => Annotations.fromJson(i)).toList();
    return rows;
  }
}
