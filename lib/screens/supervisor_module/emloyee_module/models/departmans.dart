// To parse this JSON data, do
//
//     final departmans = departmansFromJson(jsonString);

import 'dart:convert';

List<Departmans> departmansFromJson(String str) =>
    List<Departmans>.from(json.decode(str).map((x) => Departmans.fromJson(x)));

String departmansToJson(List<Departmans> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Departmans {
  Departmans({
  required  this.department,
  required  this.id,
  });

  Department department;
  int id;

  factory Departmans.fromJson(Map<String, dynamic> json) => Departmans(
        department: Department.fromJson(json["Department"]),
        id: json["Id"],
      );

  Map<String, dynamic> toJson() => {
        "Department": department.toJson(),
        "Id": id,
      };
}

class Department {
  Department({
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
  dynamic color;
  dynamic image;

  factory Department.fromJson(Map<String, dynamic> json) => Department(
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
