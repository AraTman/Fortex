// To parse this JSON data, do
//
//     final employeeListModel = employeeListModelFromJson(jsonString);

import 'dart:convert';

class EmployeeListModel {
  EmployeeListModel({
    required this.id,
    required this.departmentId,
    required this.isUser,
    required this.name,
    required this.surname,
    required this.identityNumber,
    required this.telephoneNumber,
    required this.birtdayDate,
    required this.note,
    required this.createdUserId,
  });

  int id;
  int departmentId;
  bool isUser;
  String name;
  String? surname;
  double identityNumber;
  double telephoneNumber;
  dynamic birtdayDate;
  dynamic note;
  int? createdUserId;

  factory EmployeeListModel.fromRawJson(String str) =>
      EmployeeListModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory EmployeeListModel.fromJson(Map<String, dynamic> json) =>
      EmployeeListModel(
        id: json["Id"],
        departmentId: json["DepartmentId"],
        isUser: json["IsUser"],
        name: json["Name"],
        surname: json["Surname"],
        identityNumber: json["IdentityNumber"],
        telephoneNumber: json["TelephoneNumber"],
        birtdayDate: json["BirtdayDate"],
        note: json["Note"],
        createdUserId: json["CreatedUserId"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "DepartmentId": departmentId,
        "IsUser": isUser,
        "Name": name,
        // ignore: prefer_if_null_operators
        "Surname": surname == null ? null : surname,
        "IdentityNumber": identityNumber,
        "TelephoneNumber": telephoneNumber,
        "BirtdayDate": birtdayDate,
        "Note": note,
        "CreatedUserId": createdUserId,
      };
}
