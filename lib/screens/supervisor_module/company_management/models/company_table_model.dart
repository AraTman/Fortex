// To parse this JSON data, do
//
//     final companytable = companytableFromJson(jsonString);

// ignore: camel_case_types
/*class modelCompanyTable {
  String name;

  modelCompanyTable({
    required this.name,
  });

  factory modelCompanyTable.fromJson(Map<String, dynamic> json) {
    return modelCompanyTable(
      name: json["Name"],
    );
  }
}*/

// ignore: camel_case_types
class modelCompanyTable {
  modelCompanyTable({
    required this.id,
    required this.name,
    required this.code,
    required this.address,
    required this.country
  });

  int id;
  String? name;
  String? address;
  String? country;
  String? code;

  factory modelCompanyTable.fromJson(Map<String, dynamic> json) =>
      modelCompanyTable(
        id: json["Id"],
        name: json["Name"],
        code: json["Code"],
        country:json["Country"],
        address: json["Address"],
      );
  Map<String, dynamic> toJson() => {
        "Id": id,
        "Name": name,
        "Code": code,
        "Country":country,
        "Address": address,
      };
}


