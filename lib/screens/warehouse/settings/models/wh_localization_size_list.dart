
import 'dart:convert';

class WhLocalizationSizeModelList {
    WhLocalizationSizeModelList({
         required this.id,
         required this.warehouseId,
         required this.materialsId,
         required this.locationId,
         required this.materialsOrderId,
         required this.quantity,
         required this.width,
         required this.weight,
         required this.status,
         required this.receivingDate,
         required this.materials,
         required this.materialsOrder,
         required this.warehouse,
         required this.warehouseLocalization,
    });

    int id;
    int warehouseId;
    int materialsId;
    int locationId;
    int materialsOrderId;
    int quantity;
    int width;
    int weight;
    bool status;
    String receivingDate;
    Materials materials;
    MaterialsOrder materialsOrder;
    Warehouse warehouse;
    WarehouseLocalization warehouseLocalization;

    factory WhLocalizationSizeModelList.fromRawJson(String str) => WhLocalizationSizeModelList.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory WhLocalizationSizeModelList.fromJson(Map<String, dynamic> json) => WhLocalizationSizeModelList(
        id: json["Id"],
        warehouseId: json["WarehouseId"],
        materialsId: json["MaterialsId"],
        locationId: json["LocationId"],
        materialsOrderId: json["MaterialsOrderId"],
        quantity: json["Quantity"],
        width: json["Width"],
        weight: json["Weight"],
        status: json["Status"],
        receivingDate: json["ReceivingDate"],
        materials: Materials.fromJson(json["Materials"]),
        materialsOrder: MaterialsOrder.fromJson(json["MaterialsOrder"]),
        warehouse: Warehouse.fromJson(json["Warehouse"]),
        warehouseLocalization: WarehouseLocalization.fromJson(json["WarehouseLocalization"]),
    );

    Map<String, dynamic> toJson() => {
        "Id": id,
        "WarehouseId": warehouseId,
        "MaterialsId": materialsId,
        "LocationId": locationId,
        "MaterialsOrderId": materialsOrderId,
        "Quantity": quantity,
        "Width": width,
        "Weight": weight,
        "Status": status,
        "ReceivingDate": receivingDate,
        "Materials": materials.toJson(),
        "MaterialsOrder": materialsOrder.toJson(),
        "Warehouse": warehouse.toJson(),
        "WarehouseLocalization": warehouseLocalization.toJson(),
    };
}

class Materials {
    Materials({
         required this.id,
         required this.materialCategoryId,
         required this.name,
         required this.code,
         required this.type,
         required this.color,
         required this.status,
         required this.criticalLevel,
         required this.weight,
         required this.description,
         required this.expirationDate,
         required this.depreciation,
         required this.createdUserId,
         required this.createdDate,
         required this.materialCategory,
    });

    int id;
    int materialCategoryId;
    String name;
    String code;
    String type;
    String color;
    String status;
    int criticalLevel;
    int weight;
    String description;
    String expirationDate;
    int depreciation;
    int createdUserId;
    String createdDate;
    Category materialCategory;

    factory Materials.fromRawJson(String str) => Materials.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Materials.fromJson(Map<String, dynamic> json) => Materials(
        id: json["Id"],
        materialCategoryId: json["MaterialCategoryId"],
        name: json["Name"],
        code: json["Code"],
        type: json["Type"],
        color: json["Color"],
        status: json["Status"],
        criticalLevel: json["CriticalLevel"],
        weight: json["Weight"],
        description: json["Description"],
        expirationDate: json["ExpirationDate"],
        depreciation: json["Depreciation"],
        createdUserId: json["CreatedUserId"],
        createdDate: json["CreatedDate"],
        materialCategory: Category.fromJson(json["MaterialCategory"]),
    );

    Map<String, dynamic> toJson() => {
        "Id": id,
        "MaterialCategoryId": materialCategoryId,
        "Name": name,
        "Code": code,
        "Type": type,
        "Color": color,
        "Status": status,
        "CriticalLevel": criticalLevel,
        "Weight": weight,
        "Description": description,
        "ExpirationDate": expirationDate,
        "Depreciation": depreciation,
        "CreatedUserId": createdUserId,
        "CreatedDate": createdDate,
        "MaterialCategory": materialCategory.toJson(),
    };
}

class Category {
    Category({
         required this.id,
         required this.name,
         required this.code,
         required this.description,
    });

    int id;
    String name;
    String code;
    String description;

    factory Category.fromRawJson(String str) => Category.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["Id"],
        name: json["Name"],
        code: json["Code"],
        description: json["Description"],
    );

    Map<String, dynamic> toJson() => {
        "Id": id,
        "Name": name,
        "Code": code,
        "Description": description,
    };
}

class MaterialsOrder {
    MaterialsOrder({
         required this.id,
         required this.materialsId,
         required this.supplierId,
         required this.createdDate,
         required this.createdUserId,
         required this.supplier,
    });

    int id;
    int materialsId;
    int supplierId;
    String createdDate;
    int createdUserId;
    Supplier supplier;

    factory MaterialsOrder.fromRawJson(String str) => MaterialsOrder.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory MaterialsOrder.fromJson(Map<String, dynamic> json) => MaterialsOrder(
        id: json["Id"],
        materialsId: json["MaterialsId"],
        supplierId: json["SupplierId"],
        createdDate: json["CreatedDate"],
        createdUserId: json["CreatedUserId"],
        supplier: Supplier.fromJson(json["Supplier"]),
    );

    Map<String, dynamic> toJson() => {
        "Id": id,
        "MaterialsId": materialsId,
        "SupplierId": supplierId,
        "CreatedDate": createdDate,
        "CreatedUserId": createdUserId,
        "Supplier": supplier.toJson(),
    };
}

class Supplier {
    Supplier({
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
    int updatedUserId;
    String updatedDate;
    SupplierCategory supplierCategory;

    factory Supplier.fromRawJson(String str) => Supplier.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Supplier.fromJson(Map<String, dynamic> json) => Supplier(
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

class Warehouse {
    Warehouse({
         required this.id,
         required this.categoryId,
         required this.name,
         required this.code,
         required this.description,
         required this.location,
         required this.warehouseCategory,
    });

    int id;
    int categoryId;
    String name;
    String code;
    String description;
    String location;
    Category warehouseCategory;

    factory Warehouse.fromRawJson(String str) => Warehouse.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Warehouse.fromJson(Map<String, dynamic> json) => Warehouse(
        id: json["Id"],
        categoryId: json["CategoryId"],
        name: json["Name"],
        code: json["Code"],
        description: json["Description"],
        location: json["Location"],
        warehouseCategory: Category.fromJson(json["WarehouseCategory"]),
    );

    Map<String, dynamic> toJson() => {
        "Id": id,
        "CategoryId": categoryId,
        "Name": name,
        "Code": code,
        "Description": description,
        "Location": location,
        "WarehouseCategory": warehouseCategory.toJson(),
    };
}

class WarehouseLocalization {
    WarehouseLocalization({
         required this.id,
         required this.warehouseId,
         required this.name,
         required this.qrCode,
         required this.warehouse,
    });

    int id;
    int warehouseId;
    String name;
    String qrCode;
    Warehouse warehouse;

    factory WarehouseLocalization.fromRawJson(String str) => WarehouseLocalization.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory WarehouseLocalization.fromJson(Map<String, dynamic> json) => WarehouseLocalization(
        id: json["Id"],
        warehouseId: json["WarehouseId"],
        name: json["Name"],
        qrCode: json["QrCode"],
        warehouse: Warehouse.fromJson(json["Warehouse"]),
    );

    Map<String, dynamic> toJson() => {
        "Id": id,
        "WarehouseId": warehouseId,
        "Name": name,
        "QrCode": qrCode,
        "Warehouse": warehouse.toJson(),
    };
}
