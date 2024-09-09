/// Represents an annotation in the OCR system.
class Annotations {
  /// The filename of the annotated document.
  String? filename;

  /// The actual annotation text.
  String? annotation;

  /// The current status of the annotation.
  String? status;

  /// The name or identifier of the annotator.
  String? annotator;

  /// Indicates whether this item can be annotated.
  bool? isAnnotable;

  /// Unique identifier for the annotation.
  int? id;

  /// Indicates whether this annotation has been verified.
  bool? isVerified;

  /// The ID of the room this annotation belongs to.
  int? roomID;

  /// Creates an instance of [Annotations].
  ///
  /// All parameters are optional.
  Annotations({
    this.filename,
    this.annotation,
    this.status,
    this.annotator,
    this.isAnnotable,
    this.id,
    this.isVerified,
    this.roomID,
  });

  /// Creates an [Annotations] instance from a JSON map.
  ///
  /// [json] is the map containing the annotation data.
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

  /// Converts the [Annotations] instance to a JSON map.
  ///
  /// Returns a map representation of the annotation.
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

  /// Creates a list of [Annotations] from a JSON list.
  ///
  /// [list] is the list of JSON maps to convert.
  ///
  /// Returns a list of [Annotations] instances.
  static List<Annotations> listFromJson(List<dynamic> list) {
    List<Annotations> rows = list.map((i) => Annotations.fromJson(i)).toList();
    return rows;
  }
}
