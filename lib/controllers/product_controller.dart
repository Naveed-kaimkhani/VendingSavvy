import 'dart:io';

import 'package:get/get.dart';
import 'package:vendingsavvy/models/category_model.dart';
import 'package:vendingsavvy/models/machine_model.dart';
import 'package:vendingsavvy/models/product_model.dart';
import 'package:vendingsavvy/repositries/product_repo.dart';

class ProductController extends GetxController {
  final ProductRepo productRepo;
  final Rx<ActiveProductsModel?> getProducts = Rx<ActiveProductsModel?>(null);
  final RxBool isLoading = false.obs;
  final Rx<CategoriesModel?> getCategories = Rx<CategoriesModel?>(null);
  final Rx<MachineModel?> machinesdata = Rx<MachineModel?>(null);
  final RxBool getCategoriesLoading = false.obs;
  final RxBool getmachinesloading = false.obs;
  final RxBool createCategoryLoading = false.obs;
  final RxBool createProductLoading = false.obs;

  ProductController({required this.productRepo});

  // Existing method (updated name to match your snippet)
  Future<void> getProductsData() async {
    if (isLoading.value) return;

    try {
      isLoading.value = true;
      final value = await productRepo.getProducts();
      getProducts.value = value;
    } catch (e) {
      Get.snackbar('Error', 'Failed to fetch products: $e');
    } finally {
      isLoading.value = false;
    }
  }

  // New method to get categories
  Future<void> getCategoriesData() async {
    if (getCategoriesLoading.value) return;

    try {
      getCategoriesLoading.value = true;
      final value = await productRepo.getCategories();
      getCategories.value = value;
    } catch (e) {
      Get.snackbar('Error', 'Failed to fetch categories: $e');
    } finally {
      getCategoriesLoading.value = false;
    }
  }

  // New method to get machines
  Future<void> getmachines() async {
    if (getmachinesloading.value) return;

    try {
      getmachinesloading.value = true;
      final value = await productRepo.getmachines();
      machinesdata.value = value;
    } catch (e) {
      Get.snackbar('Error', 'Failed to fetch machines: $e');
    } finally {
      getmachinesloading.value = false;
    }
  }

  // New method to create a category
  Future<bool> createCategory(String categoryName, File? imageFile) async {
    if (createCategoryLoading.value) return false;

    try {
      createCategoryLoading.value = true;
      final success = await productRepo.createCategory(categoryName, imageFile);
      if (success) {
        Get.snackbar('Success', 'Category created successfully!');
        getCategoriesData(); // Refresh categories
        return true;
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to create category: $e');
      return false;
    } finally {
      createCategoryLoading.value = false;
        return false;
    }
  }
  
  

  // Updated method to create a product
  Future<void> createProduct({
    required String productName,
    required int categoryId,
    int? machineId, // Changed from required int to int?
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
    if (createProductLoading.value) return;

    try {
      createProductLoading.value = true;
      final success = await productRepo.createProduct(
        productName: productName,
        categoryId: categoryId,
        machineId: machineId, // Now accepts null
        barcodeNumber: barcodeNumber,
        sellingPrice: sellingPrice,
        cogsPrice: cogsPrice,
        taxRate: taxRate,
        stockQuantity: stockQuantity,
        reorderQuantity: reorderQuantity,
        expiryDate: expiryDate,
        description: description,
        imageFile: imageFile,
      );
      if (success) {
        Get.snackbar('Success', 'Product created successfully!');
        getProductsData(); // Refresh products
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to create product: $e');
    } finally {
      createProductLoading.value = false;
    }
  }

  @override
  void onInit() {
    super.onInit();
    getProductsData();
    getCategoriesData(); // Load categories for the dropdown
  }
}
