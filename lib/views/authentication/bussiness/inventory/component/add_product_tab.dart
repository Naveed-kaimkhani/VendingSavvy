import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vendingsavvy/constant/appcolors.dart';
import 'package:vendingsavvy/controllers/product_controller.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:vendingsavvy/custom_widgets/custom_button.dart';

class AddProductTab extends StatefulWidget {
  final ProductController controller;

  const AddProductTab({super.key, required this.controller});

  @override
  State<AddProductTab> createState() => _AddProductTabState();
}

class _AddProductTabState extends State<AddProductTab> {
  final _formKey = GlobalKey<FormState>();
  final _picker = ImagePicker();
  XFile? _imageFile;
  final _productNameController = TextEditingController();
  final _barcodeNumberController = TextEditingController();
  final _sellingPriceController = TextEditingController();
  final _cogsPriceController = TextEditingController();
  final _taxRateController = TextEditingController();
  final _stockQuantityController = TextEditingController();
  final _reorderQuantityController = TextEditingController();
  final _expiryDateController = TextEditingController();
  final _descriptionController = TextEditingController();
  int? _selectedCategoryId;
  int? _selectedMachineId; // Optional machine ID

  @override
  void initState() {
    super.initState();
    if (widget.controller.getCategories.value == null) {
      widget.controller.getCategoriesData();
    }
    if (widget.controller.machinesdata.value == null) {
      widget.controller.getmachines(); // Fetch machines on init
    }
  }

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _imageFile = pickedFile;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.w),
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: _pickImage,
                child: Container(
                  width: 100.w,
                  height: 100.h,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: _imageFile == null
                      ? const Icon(
                          Icons.add_a_photo,
                          size: 40,
                          color: Colors.grey,
                        )
                      : Image.file(File(_imageFile!.path), fit: BoxFit.cover),
                ),
              ),
              SizedBox(height: 8.h),
              const Text(
                'Max size: 5mb, format: jpg, png',
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(height: 16.h),
              TextFormField(
                controller: _productNameController,
                decoration: const InputDecoration(labelText: 'Product Name'),
                validator: (value) =>
                    value?.isEmpty ?? true ? 'Required' : null,
              ),
              SizedBox(height: 16.h),
              Obx(() {
                final categories =
                    widget.controller.getCategories.value?.data?.categories ??
                    [];
                return DropdownButtonFormField<int>(
                  value: _selectedCategoryId,
                  hint: const Text('Select Category'),
                  items: categories.map((category) {
                    return DropdownMenuItem<int>(
                      value: category.id,
                      child: Text(category.categoryName ?? ''),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedCategoryId = value;
                    });
                  },
                  validator: (value) => value == null ? 'Required' : null,
                );
              }),
              SizedBox(height: 16.h),
              Obx(() {
                final machines =
                    widget.controller.machinesdata.value?.data?.machine ?? [];
                return DropdownButtonFormField<int>(
                  value: _selectedMachineId,
                  hint: const Text('Select Machine (Optional)'),
                  items: machines.map((machine) {
                    return DropdownMenuItem<int>(
                      value: machine.id,
                      child: Text(machine.name ?? ''),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedMachineId = value;
                    });
                  },
                  // No validator, making it optional
                );
              }),
              SizedBox(height: 16.h),
              TextFormField(
                controller: _barcodeNumberController,
                decoration: const InputDecoration(labelText: 'Barcode Number'),
              ),
              SizedBox(height: 16.h),
              TextFormField(
                controller: _sellingPriceController,
                decoration: const InputDecoration(labelText: 'Selling Price'),
                keyboardType: TextInputType.number,
                validator: (value) =>
                    value?.isEmpty ?? true ? 'Required' : null,
              ),
              SizedBox(height: 16.h),
              TextFormField(
                controller: _cogsPriceController,
                decoration: const InputDecoration(labelText: 'COGS Price'),
                keyboardType: TextInputType.number,
                validator: (value) =>
                    value?.isEmpty ?? true ? 'Required' : null,
              ),
              SizedBox(height: 16.h),
              TextFormField(
                controller: _taxRateController,
                decoration: const InputDecoration(labelText: 'Tax Rate'),
                keyboardType: TextInputType.number,
                validator: (value) =>
                    value?.isEmpty ?? true ? 'Required' : null,
              ),
              SizedBox(height: 16.h),
              TextFormField(
                controller: _stockQuantityController,
                decoration: const InputDecoration(labelText: 'Stock Quantity'),
                keyboardType: TextInputType.number,
                validator: (value) =>
                    value?.isEmpty ?? true ? 'Required' : null,
              ),
              SizedBox(height: 16.h),
              TextFormField(
                controller: _reorderQuantityController,
                decoration: const InputDecoration(
                  labelText: 'Reorder Quantity',
                ),
              ),
              SizedBox(height: 16.h),
              TextFormField(
                controller: _expiryDateController,
                decoration: const InputDecoration(labelText: 'Expiry Date'),
                onTap: () async {
                  DateTime? picked = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2100),
                  );
                  if (picked != null) {
                    _expiryDateController.text = "${picked.toLocal()}".split(
                      ' ',
                    )[0];
                  }
                },
              ),
              SizedBox(height: 16.h),
              TextFormField(
                controller: _descriptionController,
                decoration: const InputDecoration(labelText: 'Description'),
              ),
              SizedBox(height: 20.h),
              Obx(
                () => CustomButton(
                  buttonColor: AppColors.kPrimaryColor,
                  onTap: widget.controller.createProductLoading.value
                      ? null
                      : () {
                          if (_formKey.currentState!.validate() &&
                              _selectedCategoryId != null) {
                            widget.controller.createProduct(
                              productName: _productNameController.text,
                              categoryId: _selectedCategoryId!,
                              machineId:
                                  _selectedMachineId, // Optional, can be null
                              barcodeNumber:
                                  _barcodeNumberController.text.isNotEmpty
                                  ? _barcodeNumberController.text
                                  : null,
                              sellingPrice: int.parse(
                                _sellingPriceController.text,
                              ),
                              cogsPrice: int.parse(_cogsPriceController.text),
                              taxRate: int.parse(_taxRateController.text),
                              stockQuantity: int.parse(
                                _stockQuantityController.text,
                              ),
                              reorderQuantity:
                                  _reorderQuantityController.text.isNotEmpty
                                  ? int.parse(_reorderQuantityController.text)
                                  : null,
                              expiryDate: _expiryDateController.text.isNotEmpty
                                  ? _expiryDateController.text
                                  : null,
                              description:
                                  _descriptionController.text.isNotEmpty
                                  ? _descriptionController.text
                                  : null,
                              imageFile: _imageFile != null
                                  ? File(_imageFile!.path)
                                  : null,
                            );
                            _formKey.currentState!.reset();
                            _imageFile = null;
                            Get.back();
                          }
                        },
                  buttonText: widget.controller.createProductLoading.value
                      ? ''
                      : 'Add Now',
                  textColor: Colors.white,
                  height: 50.h,
                  fontSize: 16,
                  child: widget.controller.createProductLoading.value
                      ? const Center(
                          child: CircularProgressIndicator(color: Colors.white),
                        )
                      : null,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
