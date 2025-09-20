// To parse this JSON data, do
//
//     final activeProductsModel = activeProductsModelFromJson(jsonString);

import 'dart:convert';

ActiveProductsModel activeProductsModelFromJson(String str) =>
    ActiveProductsModel.fromJson(json.decode(str));

String activeProductsModelToJson(ActiveProductsModel data) =>
    json.encode(data.toJson());

class ActiveProductsModel {
  bool? success;
  String? message;
  Data? data;

  ActiveProductsModel({this.success, this.message, this.data});

  factory ActiveProductsModel.fromJson(Map<String, dynamic> json) =>
      ActiveProductsModel(
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
  List<Product>? products;

  Data({this.products});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    products: json["products"] == null
        ? []
        : List<Product>.from(json["products"]!.map((x) => Product.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "products": products == null
        ? []
        : List<dynamic>.from(products!.map((x) => x.toJson())),
  };
}

class Product {
  int? id;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic deletedAt;
  String? productName;
  int? categoryId;
  int? machineId;
  int? businessId;
  String? barcodeNumber;
  int? sellingPrice;
  int? cogsPrice;
  int? taxRate;
  dynamic? stockQuantity;
  dynamic? reorderQuantity;
  dynamic expiryDate;
  String? description;
  String? productImage;
  Category? category;
  Machine? machine;

  Product({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.productName,
    this.categoryId,
    this.machineId,
    this.businessId,
    this.barcodeNumber,
    this.sellingPrice,
    this.cogsPrice,
    this.taxRate,
    this.stockQuantity,
    this.reorderQuantity,
    this.expiryDate,
    this.description,
    this.productImage,
    this.category,
    this.machine,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json["id"],
    createdAt: json["created_at"] == null
        ? null
        : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null
        ? null
        : DateTime.parse(json["updated_at"]),
    deletedAt: json["deleted_at"],
    productName: json["product_name"],
    categoryId: json["category_id"],
    machineId: json["machine_id"],
    businessId: json["business_id"],
    barcodeNumber: json["barcode_number"],
    sellingPrice: json["selling_price"],
    cogsPrice: json["cogs_price"],
    taxRate: json["tax_rate"],
    stockQuantity: json["stock_quantity"],
    reorderQuantity: json["reorder_quantity"],
    expiryDate: json["expiry_date"],
    description: json["description"],
    productImage: json["product_image"],
    category: json["category"] == null
        ? null
        : Category.fromJson(json["category"]),
    machine: json["machine"] == null ? null : Machine.fromJson(json["machine"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "deleted_at": deletedAt,
    "product_name": productName,
    "category_id": categoryId,
    "machine_id": machineId,
    "business_id": businessId,
    "barcode_number": barcodeNumber,
    "selling_price": sellingPrice,
    "cogs_price": cogsPrice,
    "tax_rate": taxRate,
    "stock_quantity": stockQuantity,
    "reorder_quantity": reorderQuantity,
    "expiry_date": expiryDate,
    "description": description,
    "product_image": productImage,
    "category": category?.toJson(),
    "machine": machine?.toJson(),
  };
}

class Category {
  int? id;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic deletedAt;
  int? businessId;
  int? createdBy;
  String? categoryName;
  String? categoryImage;

  Category({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.businessId,
    this.createdBy,
    this.categoryName,
    this.categoryImage,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: json["id"],
    createdAt: json["created_at"] == null
        ? null
        : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null
        ? null
        : DateTime.parse(json["updated_at"]),
    deletedAt: json["deleted_at"],
    businessId: json["business_id"],
    createdBy: json["created_by"],
    categoryName: json["category_name"],
    categoryImage: json["category_image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "deleted_at": deletedAt,
    "business_id": businessId,
    "created_by": createdBy,
    "category_name": categoryName,
    "category_image": categoryImage,
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
  String? otherType;
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
    createdAt: json["created_at"] == null
        ? null
        : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null
        ? null
        : DateTime.parse(json["updated_at"]),
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
