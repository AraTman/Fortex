// To parse this JSON data, do
//
//     final whCategory = whCategoryFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

class WhCategoryLists {
    WhCategoryLists({
        required this.id,
        required this.name,
        required this.code,
        required this.description,
    });

    int id;
    String name;
    String code;
    String? description;

    factory WhCategoryLists.fromRawJson(String str) => WhCategoryLists.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory WhCategoryLists.fromJson(Map<String, dynamic> json) => WhCategoryLists(
        id: json["Id"],
        name: json["Name"],
        code: json["Code"],
        description: json["Description"],
    );

    Map<String, dynamic> toJson() => {
        "Id": id,
        "Name": name,
        "Code": code,
        "Description": description == null ? null : description,
    };
}
