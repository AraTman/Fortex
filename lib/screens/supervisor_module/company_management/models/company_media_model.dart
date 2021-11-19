
import 'dart:convert';

class modelMediaCompanyTable {
    modelMediaCompanyTable({
        required this.id,
        required this.companyId,
        required this.binaryData,
        required this.fileName,
        required this.contentType,
        required this.company,
    });

    final int id;
    final int companyId;
    final String binaryData;
    final String fileName;
    final String contentType;
    final Company company;

    factory modelMediaCompanyTable.fromRawJson(String str) => modelMediaCompanyTable.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory modelMediaCompanyTable.fromJson(Map<String, dynamic> json) => modelMediaCompanyTable(
        id: json["Id"],
        companyId: json["CompanyId"],
        binaryData: json["BinaryData"],
        fileName: json["FileName"],
        contentType: json["ContentType"],
        company: Company.fromJson(json["Company"]),
    );

    Map<String, dynamic> toJson() => {
        "Id": id,
        "CompanyId": companyId,
        "BinaryData": binaryData,
        "FileName": fileName,
        "ContentType": contentType,
        "Company": company.toJson(),
    };
}

class Company {
    Company({
        required this.id,
        required this.name,
        required this.address,
        required this.country,
        required this.code,
    });

    final int id;
    final String name;
    final String? address;
    final String? country;
    final String code;

    factory Company.fromRawJson(String str) => Company.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Company.fromJson(Map<String, dynamic> json) => Company(
        id: json["Id"],
        name: json["Name"],
        address: json["Address"],
        country: json["Country"],
        code: json["Code"],
    );

    Map<String, dynamic> toJson() => {
        "Id": id,
        "Name": name,
        "Address": address,
        "Country": country,
        "Code": code,
    };
}
