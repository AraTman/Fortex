
import 'dart:convert';

class DepartmanModel {
    DepartmanModel({
        required this.id,
        required this.userId,
        required this.departmentId,
        required this.status,
        required this.department,
    });

    final int id;
    final int userId;
    final int departmentId;
    final bool status;
    final Department department;

    factory DepartmanModel.fromRawJson(String str) => DepartmanModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory DepartmanModel.fromJson(Map<String, dynamic> json) => DepartmanModel(
        id: json["Id"],
        userId: json["UserId"],
        departmentId: json["DepartmentId"],
        status: json["Status"],
        department: Department.fromJson(json["Department"]),
    );

    Map<String, dynamic> toJson() => {
        "Id": id,
        "UserId": userId,
        "DepartmentId": departmentId,
        "Status": status,
        "Department": department.toJson(),
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

    final int id;
    final String name;
    final String code;
    final String routes;
    final String color;
    final String image;

    factory Department.fromRawJson(String str) => Department.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

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
