
import 'dart:convert';

class ModelSMaterialsMaterial {
    ModelSMaterialsMaterial({
        required this.materialsGroup,
        required this.id,
        required this.materialsGroupId,
        required this.name,
        required this.code,
        required this.type,
        required this.color,
        required this.status,
        required this.criticalLevel,
        required this.weight,
        required this.description,
        required this.expirationDate,
        required this.depreciation,
        required this.createdUserId,
        required this.createdDate,
    });

    final MaterialsGroup materialsGroup;
    final int id;
    final int materialsGroupId;
    final String name;
    final String code;
    final String type;
    final String color;
    final dynamic status;
    final dynamic criticalLevel;
    final double? weight;
    final String description;
    final dynamic expirationDate;
    final dynamic depreciation;
    final dynamic createdUserId;
    final dynamic createdDate;

    factory ModelSMaterialsMaterial.fromRawJson(String str) => ModelSMaterialsMaterial.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ModelSMaterialsMaterial.fromJson(Map<String, dynamic> json) => ModelSMaterialsMaterial(
        materialsGroup: MaterialsGroup.fromJson(json["MaterialsGroup"]),
        id: json["Id"],
        materialsGroupId: json["MaterialsGroupId"],
        name: json["Name"],
        code: json["Code"],
        type: json["Type"],
        color: json["Color"],
        status: json["Status"],
        criticalLevel: json["CriticalLevel"],
        weight: json["Weight"],
        description: json["Description"],
        expirationDate: json["ExpirationDate"],
        depreciation: json["Depreciation"],
        createdUserId: json["CreatedUserId"],
        createdDate: json["CreatedDate"],
    );

    Map<String, dynamic> toJson() => {
        "MaterialsGroup": materialsGroup.toJson(),
        "Id": id,
        "MaterialsGroupId": materialsGroupId,
        "Name": name,
        "Code": code,
        "Type": type,
        "Color": color,
        "Status": status,
        "CriticalLevel": criticalLevel,
        "Weight": weight,
        "Description": description,
        "ExpirationDate": expirationDate,
        "Depreciation": depreciation,
        "CreatedUserId": createdUserId,
        "CreatedDate": createdDate,
    };
}

class MaterialsGroup {
    MaterialsGroup({
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

    factory MaterialsGroup.fromRawJson(String str) => MaterialsGroup.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory MaterialsGroup.fromJson(Map<String, dynamic> json) => MaterialsGroup(
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
