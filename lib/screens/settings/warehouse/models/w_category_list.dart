
import 'dart:convert';

class ModelSWarehouseCategory {
    ModelSWarehouseCategory({
        required this.id,
        required this.name,
        required this.code,
        required this.description,
    });

    final int id;
    final String name;
    final String code;
    final String description;

    factory ModelSWarehouseCategory.fromRawJson(String str) => ModelSWarehouseCategory.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ModelSWarehouseCategory.fromJson(Map<String, dynamic> json) => ModelSWarehouseCategory(
        id: json["Id"],
        name: json["Name"],
        code: json["Code"],
        description: json["Description"] == null ? null : json["Description"],
    );

    Map<String, dynamic> toJson() => {
        "Id": id,
        "Name": name,
        "Code": code,
        "Description": description == "" ? "" : description,
    };
}
