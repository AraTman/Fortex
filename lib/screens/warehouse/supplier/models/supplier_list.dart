// To parse this JSON data, do
//
//     final supplierModelList = supplierModelListFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

class SupplierModelList {
    SupplierModelList({
         required this.id,
         required this.supplierCategoryId,
         required this.name,
         required this.address,
         required this.country,
         required this.code,
         required this.createdUserId,
         required this.createdDate,
         required this.updatedUserId,
         required this.updatedDate,
         required this.supplierCategory,
    });

    int id;
    int supplierCategoryId;
    String name;
    String address;
    String country;
    String code;
    int createdUserId;
    String createdDate;
    int? updatedUserId;
    String? updatedDate;
    SupplierCategory supplierCategory;

    factory SupplierModelList.fromRawJson(String str) => SupplierModelList.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory SupplierModelList.fromJson(Map<String, dynamic> json) => SupplierModelList(
        id: json["Id"],
        supplierCategoryId: json["SupplierCategoryId"],
        name: json["Name"],
        address: json["Address"],
        country: json["Country"],
        code: json["Code"],
        createdUserId: json["CreatedUserId"],
        createdDate: json["CreatedDate"],
        updatedUserId: json["UpdatedUserId"],
        updatedDate: json["UpdatedDate"],
        supplierCategory: SupplierCategory.fromJson(json["SupplierCategory"]),
    );

    Map<String, dynamic> toJson() => {
        "Id": id,
        "SupplierCategoryId": supplierCategoryId,
        "Name": name,
        "Address": address,
        "Country": country,
        "Code": code,
        "CreatedUserId": createdUserId,
        "CreatedDate": createdDate,
        "UpdatedUserId": updatedUserId,
        "UpdatedDate": updatedDate,
        "SupplierCategory": supplierCategory.toJson(),
    };
}

class SupplierCategory {
    SupplierCategory({
         required this.id,
         required this.name,
         required this.description,
    });

    int id;
    String name;
    String description;

    factory SupplierCategory.fromRawJson(String str) => SupplierCategory.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory SupplierCategory.fromJson(Map<String, dynamic> json) => SupplierCategory(
        id: json["Id"],
        name: json["Name"],
        description: json["Description"],
    );

    Map<String, dynamic> toJson() => {
        "Id": id,
        "Name": name,
        "Description": description,
    };
}
