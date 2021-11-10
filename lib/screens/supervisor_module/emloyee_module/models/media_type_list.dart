import 'dart:convert';

class MediaTypeList {
  MediaTypeList({
    required this.id,
    required this.name,
  });

  int id;
  String name;

  factory MediaTypeList.fromRawJson(String str) =>
      MediaTypeList.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MediaTypeList.fromJson(Map<String, dynamic> json) => MediaTypeList(
        id: json["Id"],
        name: json["Name"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "Name": name,
      };
}
