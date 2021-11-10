// To parse this JSON data, do
//
//     final subsidiaryList = subsidiaryListFromJson(jsonString);

import 'dart:convert';

class SubsidiaryList {
  SubsidiaryList({
    required this.id,
    required this.companyId,
    required this.name,
    required this.code,
    required this.address,
  });

  int id;
  int companyId;
  String name;
  String code;
  String address;

  factory SubsidiaryList.fromRawJson(String str) =>
      SubsidiaryList.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SubsidiaryList.fromJson(Map<String, dynamic> json) => SubsidiaryList(
        id: json["Id"],
        companyId: json["CompanyId"],
        name: json["Name"],
        code: json["Code"],
        address: json["Address"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "CompanyId": companyId,
        "Name": name,
        "Code": code,
        "Address": address,
      };
}
