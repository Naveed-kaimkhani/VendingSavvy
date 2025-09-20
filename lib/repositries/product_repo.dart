import 'dart:developer';
import 'dart:io';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:vendingsavvy/constant/api_endpoints.dart';
import 'package:vendingsavvy/controllers/auth_controllers.dart';
import 'package:vendingsavvy/models/category_model.dart';
import 'package:vendingsavvy/models/machine_model.dart';
import 'package:vendingsavvy/models/product_model.dart';

import 'package:vendingsavvy/services/api_client.dart';

class ProductRepo {
  final ApiClient apiClient;

  ProductRepo({required this.apiClient});

  // Existing method
  Future<ActiveProductsModel?> getProducts() async {
    try {
      final res = await apiClient.get(url: ApiEndpoints.getproducts);
      if (res.statusCode == 200) {
        final productsModel = activeProductsModelFromJson(res.body);
        return productsModel;
      } else {
        throw Exception("No data field found in the GetProducts");
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  // Existing method
  Future<CategoriesModel?> getCategories() async {
    try {
      final res = await apiClient.get(url: ApiEndpoints.getcategories);
      if (res.statusCode == 200) {
        final categories = categoriesModelFromJson(res.body);
        return categories;
      } else {
        throw Exception("No data field found in the GetCategories response");
      }
    } catch (e) {
      throw Exception("Error fetching categories: $e");
    }
  }

  // machines
  Future<MachineModel?> getmachines() async {
    try {
      final res = await apiClient.get(url: ApiEndpoints.getmachines);
      if (res.statusCode == 200) {
        final machines = machineModelFromJson(res.body);
        return machines;
      } else {
        throw Exception("No data field found in the mahcines response");
      }
    } catch (e) {
      throw Exception("Error fetching categories: $e");
    }
  }

  // Updated method to create a category
  Future<bool> createCategory(String categoryName, File? imageFile) async {
    try {
      final data = {'category_name': categoryName};
      final files = imageFile != null
          ? <String, dynamic>{'file': imageFile}
          : <String, dynamic>{};

      final response = await apiClient.postImagesToServer(
        endPoint: ApiEndpoints.createcategory,
        data: data,
        files: files,
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return true;
      } else {
        throw Exception(
          "Failed to create category: ${response.statusCode} - ${response.body}",
        );
      }
    } catch (e) {
      throw Exception("Error creating category: $e");
    }
  }

  // // Updated method to create a product
  // Future<bool> createProduct({
  //   required String productName,
  //   required int categoryId,
  //   required int? machineId,
  //   String? barcodeNumber,
  //   required int sellingPrice,
  //   required int cogsPrice,
  //   required int taxRate,
  //   required int stockQuantity,
  //   int? reorderQuantity,
  //   String? expiryDate,
  //   String? description,
  //   File? imageFile,
  // }) async {
  //   try {
  //     final data = {
  //       'product_name': productName,
  //       'category_id': categoryId.toString(),
  //       'machine_id': machineId.toString(),
  //       if (barcodeNumber != null) 'barcode_number': barcodeNumber,
  //       'selling_price': sellingPrice.toString(),
  //       'cogs_price': cogsPrice.toString(),
  //       'tax_rate': taxRate.toString(),
  //       'stock_quantity': stockQuantity.toString(),
  //       if (reorderQuantity != null)
  //         'reorder_quantity': reorderQuantity.toString(),
  //       if (expiryDate != null) 'expiry_date': expiryDate,
  //       if (description != null) 'description': description,
  //     };
  //     final files = imageFile != null
  //         ? <String, dynamic>{'file': imageFile}
  //         : <String, dynamic>{};

  //     final response = await apiClient.postImagesToServer(
  //       endPoint: ApiEndpoints.createProduct,
  //       data: data,
  //       files: files,
  //     );
  //     log(
  //       "Failed to create product: ${response.statusCode} - ${response.body}",
  //     );
  //     if (response.statusCode == 200 || response.statusCode == 201) {
  //       return true;
  //     } else {
  //       throw Exception(
  //         "Failed to create product: ${response.statusCode} - ${response.body}",
  //       );
  //     }
  //   } catch (e) {
  //     throw Exception("Error creating product: $e");
  //   }
  // }
  // Updated method to create a product
  Future<bool> createProduct({
    required String productName,
    required int categoryId,
    int? machineId, // Made optional since it might not be sent for non-vendors
    String? barcodeNumber,
    required int sellingPrice,
    required int cogsPrice,
    required int taxRate,
    required int stockQuantity,
    int? reorderQuantity,
    String? expiryDate,
    String? description,
    File? imageFile,
  }) async {
    try {
      // Get the current user's role
      final authController = Get.find<AuthController>();
      final isVendor = authController.selectedRole.value == "VENDOR";

      final data = {
        'product_name': productName,
        'category_id': categoryId.toString(),
        if (isVendor && machineId != null) 'machine_id': machineId.toString(),
        if (barcodeNumber != null) 'barcode_number': barcodeNumber,
        'selling_price': sellingPrice.toString(),
        'cogs_price': cogsPrice.toString(),
        'tax_rate': taxRate.toString(),
        'stock_quantity': stockQuantity.toString(),
        if (reorderQuantity != null)
          'reorder_quantity': reorderQuantity.toString(),
        if (expiryDate != null) 'expiry_date': expiryDate,
        if (description != null) 'description': description,
      };

      final files = imageFile != null
          ? <String, dynamic>{'file': imageFile}
          : <String, dynamic>{};

      final response = await apiClient.postImagesToServer(
        endPoint: ApiEndpoints.createProduct,
        data: data,
        files: files,
      );

      log(
        "Product creation response: ${response.statusCode} - ${response.body}",
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return true;
      } else {
        throw Exception(
          "Failed to create product: ${response.statusCode} - ${response.body}",
        );
      }
    } catch (e) {
      log("Error creating product: $e");
      throw Exception("Error creating product: $e");
    }
  }
}
