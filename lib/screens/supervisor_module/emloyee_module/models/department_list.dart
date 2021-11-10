// To parse this JSON data, do
//
//     final departmentList = departmentListFromJson(jsonString);

import 'dart:convert';

class DepartmentLists {
  DepartmentLists({
    required this.id,
    required this.name,
    required this.code,
    required this.routes,
    required this.color,
    required this.image,
  });

  int id;
  String name;
  String code;
  String routes;
  String color;
  String image;

  factory DepartmentLists.fromRawJson(String str) =>
      DepartmentLists.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DepartmentLists.fromJson(Map<String, dynamic> json) =>
      DepartmentLists(
        id: json["Id"],
        name: json["Name"],
        code: json["Code"],
        routes: json["Routes"],
        color: json["Color"],
        image: json["Image"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "Name": name,
        "Code": code,
        "Routes": routes,
        "Color": color,
        "Image": image,
      };
}
