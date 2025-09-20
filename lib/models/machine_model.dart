// To parse this JSON data, do
//
//     final machineModel = machineModelFromJson(jsonString);

import 'dart:convert';

MachineModel machineModelFromJson(String str) => MachineModel.fromJson(json.decode(str));

String machineModelToJson(MachineModel data) => json.encode(data.toJson());

class MachineModel {
    bool? success;
    String? message;
    Data? data;

    MachineModel({
        this.success,
        this.message,
        this.data,
    });

    factory MachineModel.fromJson(Map<String, dynamic> json) => MachineModel(
        success: json["success"],
        message: json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data?.toJson(),
    };
}

class Data {
    List<Machine>? machine;

    Data({
        this.machine,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        machine: json["machine"] == null ? [] : List<Machine>.from(json["machine"]!.map((x) => Machine.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "machine": machine == null ? [] : List<dynamic>.from(machine!.map((x) => x.toJson())),
    };
}

class Machine {
    int? id;
    DateTime? createdAt;
    DateTime? updatedAt;
    dynamic deletedAt;
    int? businessId;
    int? createdBy;
    String? name;
    String? locationName;
    int? mileage;
    String? street;
    String? city;
    String? state;
    String? zipCode;
    String? machineType;
    dynamic otherType;
    double? commissionPercentage;
    double? salesTaxPercentage;
    int? rent;

    Machine({
        this.id,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
        this.businessId,
        this.createdBy,
        this.name,
        this.locationName,
        this.mileage,
        this.street,
        this.city,
        this.state,
        this.zipCode,
        this.machineType,
        this.otherType,
        this.commissionPercentage,
        this.salesTaxPercentage,
        this.rent,
    });

    factory Machine.fromJson(Map<String, dynamic> json) => Machine(
        id: json["id"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
        businessId: json["business_id"],
        createdBy: json["created_by"],
        name: json["name"],
        locationName: json["location_name"],
        mileage: json["mileage"],
        street: json["street"],
        city: json["city"],
        state: json["state"],
        zipCode: json["zip_code"],
        machineType: json["machine_type"],
        otherType: json["other_type"],
        commissionPercentage: json["commission_percentage"]?.toDouble(),
        salesTaxPercentage: json["sales_tax_percentage"]?.toDouble(),
        rent: json["rent"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "deleted_at": deletedAt,
        "business_id": businessId,
        "created_by": createdBy,
        "name": name,
        "location_name": locationName,
        "mileage": mileage,
        "street": street,
        "city": city,
        "state": state,
        "zip_code": zipCode,
        "machine_type": machineType,
        "other_type": otherType,
        "commission_percentage": commissionPercentage,
        "sales_tax_percentage": salesTaxPercentage,
        "rent": rent,
    };
}
