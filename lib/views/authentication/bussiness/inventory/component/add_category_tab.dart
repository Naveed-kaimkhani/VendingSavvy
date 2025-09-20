import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vendingsavvy/controllers/product_controller.dart';
import 'package:vendingsavvy/custom_widgets/custom_button.dart';
import 'package:vendingsavvy/utils/app_colors.dart';
import 'package:vendingsavvy/views/authentication/bussiness/inventory/component/add_product_tab.dart';

class AddCategoryTab extends StatefulWidget {
  final ProductController controller;

  const AddCategoryTab({super.key, required this.controller});

  @override
  State<AddCategoryTab> createState() => _AddCategoryTabState();
}

class _AddCategoryTabState extends State<AddCategoryTab> {
  final _formKey = GlobalKey<FormState>();
  final _picker = ImagePicker();
  XFile? _imageFile;
  final _categoryNameController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _imageFile = pickedFile;
      });
    }
  }

  final ProductController controller = Get.find();
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
                controller: _categoryNameController,
                decoration: const InputDecoration(labelText: 'Category Name'),
                validator: (value) =>
                    value?.isEmpty ?? true ? 'Required' : null,
              ),
              SizedBox(height: 20.h),
              // Spacer(),
              Obx(
                () => CustomButton(
                  width: Get.width * 0.7,
                  buttonColor: AppColors.kPrimaryColor,
                  onTap: widget.controller.createCategoryLoading.value
                      ? null
                      : () async {
                          if (_formKey.currentState!.validate()) {
                            await widget.controller.createCategory(
                              _categoryNameController.text,
                              _imageFile != null
                                  ? File(_imageFile!.path)
                                  : null,
                            );
                            _formKey.currentState!.reset();
                            _imageFile = null;

                            Get.back();
                          }
                        },
                  buttonText: widget.controller.createCategoryLoading.value
                      ? ''
                      : 'Add Now',
                  textColor: Colors.white,
                  height: 50.h,
                  fontSize: 16,
                  child: widget.controller.createCategoryLoading.value
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
