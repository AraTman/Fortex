
import 'dart:convert';

class ModelSMaterialsGroup {
    ModelSMaterialsGroup({
        required this.materialCategory,
        required this.id,
        required this.materialsCategoryId,
        required this.name,
        required this.code,
        required this.description,
    });

    final MaterialCategory materialCategory;
    final int id;
    final int materialsCategoryId;
    final String name;
    final String code;
    final String description;

    factory ModelSMaterialsGroup.fromRawJson(String str) => ModelSMaterialsGroup.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ModelSMaterialsGroup.fromJson(Map<String, dynamic> json) => ModelSMaterialsGroup(
        materialCategory: MaterialCategory.fromJson(json["MaterialCategory"]),
        id: json["Id"],
        materialsCategoryId: json["MaterialsCategoryId"],
        name: json["Name"],
        code: json["Code"],
        description: json["Description"],
    );

    Map<String, dynamic> toJson() => {
        "MaterialCategory": materialCategory.toJson(),
        "Id": id,
        "MaterialsCategoryId": materialsCategoryId,
        "Name": name,
        "Code": code,
        "Description": description,
    };
}

class MaterialCategory {
    MaterialCategory({
        required this.id,
        required this.name,
        required this.code,
        required this.description,
    });

    final int id;
    final String name;
    final String code;
    final String description;

    factory MaterialCategory.fromRawJson(String str) => MaterialCategory.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory MaterialCategory.fromJson(Map<String, dynamic> json) => MaterialCategory(
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
