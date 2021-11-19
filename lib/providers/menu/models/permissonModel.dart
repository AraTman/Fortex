
import 'dart:convert';

class permissionModel {
    permissionModel({
        required this.id,
        required this.userId,
        required this.permissions,
    });

    final int id;
    final int userId;
    final Permissions permissions;

    factory permissionModel.fromRawJson(String str) => permissionModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory permissionModel.fromJson(Map<String, dynamic> json) => permissionModel(
        id: json["Id"],
        userId: json["UserId"],
        permissions: Permissions.fromJson(json["Permissions"]),
    );

    Map<String, dynamic> toJson() => {
        "Id": id,
        "UserId": userId,
        "Permissions": permissions.toJson(),
    };
}

class Permissions {
    Permissions({
        required this.id,
        required this.name,
        required this.code,
        required this.url,
        required this.icon,
    });

    final int id;
    final String name;
    final String code;
    final String url;
    final String icon;

    factory Permissions.fromRawJson(String str) => Permissions.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Permissions.fromJson(Map<String, dynamic> json) => Permissions(
        id: json["Id"],
        name: json["Name"],
        code: json["Code"],
        url: json["Url"],
        icon: json["Icon"],
    );

    Map<String, dynamic> toJson() => {
        "Id": id,
        "Name": name,
        "Code": code,
        "Url": url,
        "Icon": icon,
    };
}
