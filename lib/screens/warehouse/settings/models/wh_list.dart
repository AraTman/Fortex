// To parse this JSON data, do
//
//     final whModelList = whModelListFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

class WhModelList {
    WhModelList({
        required this.id,
        required this.categoryId,
        required this.name,
        required this.code,
        required this.description,
        required this.location,
    });

    int id;
    int? categoryId;
    String name;
    String? code;
    String? description;
    String? location;

    factory WhModelList.fromRawJson(String str) => WhModelList.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory WhModelList.fromJson(Map<String, dynamic> json) => WhModelList(
        id: json["Id"],
        categoryId: json["CategoryId"],
        name: json["Name"],
        code: json["Code"],
        description: json["Description"],
        location: json["Location"],
    );

    Map<String, dynamic> toJson() => {
        "Id": id,
        "CategoryId": categoryId,
        "Name": name,
        "Code": code,
        "Description": description,
        "Location": location,
    };
}

class WarehouseCategory {
    WarehouseCategory({
        required this.id,
        required this.name,
        required this.code,
        required this.description,
    });

    int id;
    String name;
    String code;
    String description;

    factory WarehouseCategory.fromRawJson(String str) => WarehouseCategory.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory WarehouseCategory.fromJson(Map<String, dynamic> json) => WarehouseCategory(
        id: json["Id"],
        name: json["Name"],
        code: json["Code"],
        description: json["Description"],
    );

    Map<String, dynamic> toJson() => {
        "Id": id,
        "Name": name,
        "Code": code,
        "Description": description,
    };
}
