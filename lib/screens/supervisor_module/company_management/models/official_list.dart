// To parse this JSON data, do
//
//     final officialList = officialListFromJson(jsonString);

import 'dart:convert';

class OfficialList {
    OfficialList({
        required this.id,
        required this.companySubsidiaryId,
        required this.name,
        required this.surname,
        required this.email,
        required this.telephoneNumber,
    });

    int id;
    int companySubsidiaryId;
    String name;
    String surname;
    dynamic email;
    dynamic telephoneNumber;

    factory OfficialList.fromRawJson(String str) => OfficialList.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory OfficialList.fromJson(Map<String, dynamic> json) => OfficialList(
        id: json["Id"],
        companySubsidiaryId: json["CompanySubsidiaryId"],
        name: json["Name"],
        surname: json["Surname"],
        email: json["Email"],
        telephoneNumber: json["TelephoneNumber"],
    );

    Map<String, dynamic> toJson() => {
        "Id": id,
        "CompanySubsidiaryId": companySubsidiaryId,
        "Name": name,
        "Surname": surname,
        "Email": email,
        "TelephoneNumber": telephoneNumber,
    };
}
