
import 'dart:convert';

class WhSupplierCategoryModelList {
    WhSupplierCategoryModelList({
        required this.id,
        required this.name,
        required this.description,
    });

    int id;
    String name;
    String description;

    factory WhSupplierCategoryModelList.fromRawJson(String str) => WhSupplierCategoryModelList.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory WhSupplierCategoryModelList.fromJson(Map<String, dynamic> json) => WhSupplierCategoryModelList(
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
