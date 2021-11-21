
import 'dart:convert';

class ModelSMaterialCategory {
    ModelSMaterialCategory({
        required this.id,
        required this.name,
        required this.code,
        required this.description,
    });

    final int id;
    final String name;
    final String code;
    final String description;

    factory ModelSMaterialCategory.fromRawJson(String str) => ModelSMaterialCategory.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ModelSMaterialCategory.fromJson(Map<String, dynamic> json) => ModelSMaterialCategory(
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
