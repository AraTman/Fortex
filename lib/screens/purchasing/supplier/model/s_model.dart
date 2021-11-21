
import 'dart:convert';

class ModelSupplier {
    ModelSupplier({
        required this.supplierCategory,
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
    });

    final SupplierCategory supplierCategory;
    final int id;
    final int supplierCategoryId;
    final String name;
    final String address;
    final String country;
    final String? code;
    final int createdUserId;
    final String createdDate;
    final dynamic updatedUserId;
    final dynamic updatedDate;

    factory ModelSupplier.fromRawJson(String str) => ModelSupplier.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ModelSupplier.fromJson(Map<String, dynamic> json) => ModelSupplier(
        supplierCategory: SupplierCategory.fromJson(json["SupplierCategory"]),
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
    );

    Map<String, dynamic> toJson() => {
        "SupplierCategory": supplierCategory.toJson(),
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
    };
}

class SupplierCategory {
    SupplierCategory({
        required this.id,
        required this.name,
        required this.description,
    });

    final int id;
    final String name;
    final String description;

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
