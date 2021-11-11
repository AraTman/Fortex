// To parse this JSON data, do
//
//     final whLocalizationModelList = whLocalizationModelListFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

class WhLocalizationModelList {
    WhLocalizationModelList({
        required this.id,
        required this.warehouseId,
        required this.name,
        required this.qrCode,
        required this.warehouse,
    });

    int id;
    int warehouseId;
    String name;
    String? qrCode;
    Warehouse warehouse;

    factory WhLocalizationModelList.fromRawJson(String str) => WhLocalizationModelList.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory WhLocalizationModelList.fromJson(Map<String, dynamic> json) => WhLocalizationModelList(
        id: json["Id"],
        warehouseId: json["WarehouseId"],
        name: json["Name"],
        qrCode: json["QrCode"],
        warehouse: Warehouse.fromJson(json["Warehouse"]),
    );

    Map<String, dynamic> toJson() => {
        "Id": id,
        "WarehouseId": warehouseId,
        "Name": name,
        "QrCode": qrCode,
        "Warehouse": warehouse.toJson(),
    };
}

class Warehouse {
    Warehouse({
        required this.id,
        required this.categoryId,
        required this.name,
        required this.code,
        required this.description,
        required this.location,
        required this.warehouseCategory,
    });

    int id;
    int categoryId;
    String name;
    String code;
    String description;
    String location;
    WarehouseCategory warehouseCategory;

    factory Warehouse.fromRawJson(String str) => Warehouse.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Warehouse.fromJson(Map<String, dynamic> json) => Warehouse(
        id: json["Id"],
        categoryId: json["CategoryId"],
        name: json["Name"],
        code: json["Code"],
        description: json["Description"],
        location: json["Location"],
        warehouseCategory: WarehouseCategory.fromJson(json["WarehouseCategory"]),
    );

    Map<String, dynamic> toJson() => {
        "Id": id,
        "CategoryId": categoryId,
        "Name": name,
        "Code": code,
        "Description": description,
        "Location": location,
        "WarehouseCategory": warehouseCategory.toJson(),
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
