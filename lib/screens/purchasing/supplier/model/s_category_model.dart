
import 'dart:convert';

class ModelPsCategory {
    ModelPsCategory({
        required this.id,
        required this.name,
        required this.description,
    });

    final int id;
    final String name;
    final String description;

    factory ModelPsCategory.fromRawJson(String str) => ModelPsCategory.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ModelPsCategory.fromJson(Map<String, dynamic> json) => ModelPsCategory(
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
