// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:vendingsavvy/controllers/product_controller.dart';
// import 'package:vendingsavvy/views/authentication/bussiness/inventory/component/add_category_tab.dart';
// import 'package:vendingsavvy/views/authentication/bussiness/inventory/component/add_product_tab.dart';

// class AddInventoryScreen extends StatelessWidget {
//   const AddInventoryScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final ProductController controller = Get.find();

//     return DefaultTabController(
//       length: 2,
//       child: Scaffold(
//         appBar: AppBar(
//           title: const Text('Add Inventory'),
//           bottom: const TabBar(
//             tabs: [
//               Tab(text: 'Add Products'),
//               Tab(text: 'Add Category'),
//             ],
//           ),
//         ),
//         body: TabBarView(
//           children: [
//             AddProductTab(controller: controller),
//             AddCategoryTab(controller: controller),
//           ],
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:vendingsavvy/constant/appcolors.dart';
// import 'package:vendingsavvy/controllers/auth_controllers.dart';
// import 'package:vendingsavvy/controllers/product_controller.dart';
// import 'package:image_picker/image_picker.dart';
// import 'dart:io';
// import 'package:vendingsavvy/custom_widgets/custom_button.dart';

// class AddInventoryScreen extends StatefulWidget {
//   // Changed to StatefulWidget
//   const AddInventoryScreen({super.key});

//   @override
//   State<AddInventoryScreen> createState() => _AddInventoryScreenState();
// }

// class _AddInventoryScreenState extends State<AddInventoryScreen>
//     with SingleTickerProviderStateMixin {
//   // Added TickerProviderStateMixin
//   late TabController _tabController; // Added TabController
//   final ProductController controller = Get.find();

//   @override
//   void initState() {
//     super.initState();
//     _tabController = TabController(
//       length: 2,
//       vsync: this,
//     ); // Initialize TabController
//   }

//   @override
//   void dispose() {
//     _tabController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Add Inventory'),
//         bottom: TabBar(
//           controller: _tabController, // Attach TabController
//           tabs: const [
//             Tab(text: 'Add Products'),
//             Tab(text: 'Add Category'),
//           ],
//         ),
//       ),
//       body: TabBarView(
//         controller: _tabController, // Attach TabController
//         children: [
//           AddProductTab(
//             controller: controller,
//             tabController: _tabController,
//           ), // Pass TabController
//           AddCategoryTab(
//             controller: controller,
//             tabController: _tabController,
//           ), // Pass TabController
//         ],
//       ),
//     );
//   }
// }

// class AddProductTab extends StatefulWidget {
//   final ProductController controller;
//   final TabController tabController; // Added TabController

//   const AddProductTab({
//     super.key,
//     required this.controller,
//     required this.tabController, // Required now
//   });

//   @override
//   State<AddProductTab> createState() => _AddProductTabState();
// }

// class _AddProductTabState extends State<AddProductTab> {
//   final _formKey = GlobalKey<FormState>();
//   final _picker = ImagePicker();
//   XFile? _imageFile;
//   final _productNameController = TextEditingController();
//   final _barcodeNumberController = TextEditingController();
//   final _sellingPriceController = TextEditingController();
//   final _cogsPriceController = TextEditingController();
//   final _taxRateController = TextEditingController();
//   final _stockQuantityController = TextEditingController();
//   final _reorderQuantityController = TextEditingController();
//   final _expiryDateController = TextEditingController();
//   final _descriptionController = TextEditingController();
//   int? _selectedCategoryId;
//   int? _selectedMachineId; // Optional machine ID

//   final authController = Get.find<AuthController>();
//   @override
//   void initState() {
//     super.initState();
//     if (widget.controller.getCategories.value == null) {
//       widget.controller.getCategoriesData();
//     }
//     if (widget.controller.machinesdata.value == null) {
//       widget.controller.getmachines(); // Fetch machines on init
//     }
//   }

//   Future<void> _pickImage() async {
//     final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
//     if (pickedFile != null) {
//       setState(() {
//         _imageFile = pickedFile;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.all(16.w),
//       child: Form(
//         key: _formKey,
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               GestureDetector(
//                 onTap: _pickImage,
//                 child: Container(
//                   width: 100.w,
//                   height: 100.h,
//                   decoration: BoxDecoration(
//                     border: Border.all(color: Colors.grey),
//                     borderRadius: BorderRadius.circular(8.r),
//                   ),
//                   child: _imageFile == null
//                       ? const Icon(
//                           Icons.add_a_photo,
//                           size: 40,
//                           color: Colors.grey,
//                         )
//                       : Image.file(File(_imageFile!.path), fit: BoxFit.cover),
//                 ),
//               ),
//               SizedBox(height: 8.h),
//               const Text(
//                 'Max size: 5mb, format: jpg, png',
//                 style: TextStyle(color: Colors.grey),
//               ),
//               SizedBox(height: 16.h),
//               TextFormField(
//                 controller: _productNameController,
//                 decoration: const InputDecoration(labelText: 'Product Name'),
//                 validator: (value) =>
//                     value?.isEmpty ?? true ? 'Required' : null,
//               ),
//               SizedBox(height: 16.h),
//               Obx(() {
//                 final categories =
//                     widget.controller.getCategories.value?.data?.categories ??
//                     [];
//                 return DropdownButtonFormField<int>(
//                   value: _selectedCategoryId,
//                   hint: const Text('Select Category'),
//                   items: categories.map((category) {
//                     return DropdownMenuItem<int>(
//                       value: category.id,
//                       child: Text(category.categoryName ?? ''),
//                     );
//                   }).toList(),
//                   onChanged: (value) {
//                     setState(() {
//                       _selectedCategoryId = value;
//                     });
//                   },
//                   validator: (value) => value == null ? 'Required' : null,
//                 );
//               }),
//               SizedBox(height: 16.h),
//               Visibility(
//                 visible: authController.selectedRole.value == "VENDOR",

//                 child: Obx(() {
//                   final machines =
//                       widget.controller.machinesdata.value?.data?.machine ?? [];
//                   return DropdownButtonFormField<int>(
//                     value: _selectedMachineId,
//                     hint: const Text('Select Machine (Optional)'),
//                     items: machines.map((machine) {
//                       return DropdownMenuItem<int>(
//                         value: machine.id,
//                         child: Text(machine.name ?? ''),
//                       );
//                     }).toList(),
//                     onChanged: (value) {
//                       setState(() {
//                         _selectedMachineId = value;
//                       });
//                     },
//                     // No validator, making it optional
//                   );
//                 }),
//               ),
//               SizedBox(height: 16.h),
//               TextFormField(
//                 controller: _barcodeNumberController,
//                 decoration: const InputDecoration(labelText: 'Barcode Number'),
//               ),
//               SizedBox(height: 16.h),
//               TextFormField(
//                 controller: _sellingPriceController,
//                 decoration: const InputDecoration(labelText: 'Selling Price'),
//                 keyboardType: TextInputType.number,
//                 validator: (value) =>
//                     value?.isEmpty ?? true ? 'Required' : null,
//               ),
//               SizedBox(height: 16.h),
//               TextFormField(
//                 controller: _cogsPriceController,
//                 decoration: const InputDecoration(labelText: 'COGS Price'),
//                 keyboardType: TextInputType.number,
//                 validator: (value) =>
//                     value?.isEmpty ?? true ? 'Required' : null,
//               ),
//               SizedBox(height: 16.h),
//               TextFormField(
//                 controller: _taxRateController,
//                 decoration: const InputDecoration(labelText: 'Tax Rate'),
//                 keyboardType: TextInputType.number,
//                 validator: (value) =>
//                     value?.isEmpty ?? true ? 'Required' : null,
//               ),
//               SizedBox(height: 16.h),
//               TextFormField(
//                 controller: _stockQuantityController,
//                 decoration: const InputDecoration(labelText: 'Stock Quantity'),
//                 keyboardType: TextInputType.number,
//                 validator: (value) =>
//                     value?.isEmpty ?? true ? 'Required' : null,
//               ),
//               SizedBox(height: 16.h),
//               TextFormField(
//                 controller: _reorderQuantityController,
//                 decoration: const InputDecoration(
//                   labelText: 'Reorder Quantity',
//                 ),
//               ),
//               SizedBox(height: 16.h),
//               TextFormField(
//                 controller: _expiryDateController,
//                 decoration: const InputDecoration(labelText: 'Expiry Date'),
//                 onTap: () async {
//                   DateTime? picked = await showDatePicker(
//                     context: context,
//                     initialDate: DateTime.now(),
//                     firstDate: DateTime.now(),
//                     lastDate: DateTime(2100),
//                   );
//                   if (picked != null) {
//                     _expiryDateController.text = "${picked.toLocal()}".split(
//                       ' ',
//                     )[0];
//                   }
//                 },
//               ),
//               SizedBox(height: 16.h),
//               TextFormField(
//                 controller: _descriptionController,
//                 decoration: const InputDecoration(labelText: 'Description'),
//               ),
//               SizedBox(height: 20.h),
//               Obx(
//                 () => CustomButton(
//                   buttonColor: AppColors.kPrimaryColor,
//                   onTap: widget.controller.createProductLoading.value
//                       ? null
//                       : () {
//                           if (_formKey.currentState!.validate() &&
//                               _selectedCategoryId != null) {
//                             widget.controller.createProduct(
//                               productName: _productNameController.text,
//                               categoryId: _selectedCategoryId!,
//                               machineId:
//                                   _selectedMachineId, // Optional, can be null
//                               barcodeNumber:
//                                   _barcodeNumberController.text.isNotEmpty
//                                   ? _barcodeNumberController.text
//                                   : null,
//                               sellingPrice: int.parse(
//                                 _sellingPriceController.text,
//                               ),
//                               cogsPrice: int.parse(_cogsPriceController.text),
//                               taxRate: int.parse(_taxRateController.text),
//                               stockQuantity: int.parse(
//                                 _stockQuantityController.text,
//                               ),
//                               reorderQuantity:
//                                   _reorderQuantityController.text.isNotEmpty
//                                   ? int.parse(_reorderQuantityController.text)
//                                   : null,
//                               expiryDate: _expiryDateController.text.isNotEmpty
//                                   ? _expiryDateController.text
//                                   : null,
//                               description:
//                                   _descriptionController.text.isNotEmpty
//                                   ? _descriptionController.text
//                                   : null,
//                               imageFile: _imageFile != null
//                                   ? File(_imageFile!.path)
//                                   : null,
//                             );
//                             _formKey.currentState!.reset();
//                             _imageFile = null;
//                             Get.back();
//                           }
//                         },
//                   buttonText: widget.controller.createProductLoading.value
//                       ? ''
//                       : 'Add Now',
//                   textColor: Colors.white,
//                   height: 50.h,
//                   fontSize: 16,
//                   child: widget.controller.createProductLoading.value
//                       ? const Center(
//                           child: CircularProgressIndicator(color: Colors.white),
//                         )
//                       : null,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class AddCategoryTab extends StatefulWidget {
//   final ProductController controller;
//   final TabController tabController; // Added TabController

//   const AddCategoryTab({
//     super.key,
//     required this.controller,
//     required this.tabController, // Required now
//   });

//   @override
//   State<AddCategoryTab> createState() => _AddCategoryTabState();
// }

// class _AddCategoryTabState extends State<AddCategoryTab> {
//   final _formKey = GlobalKey<FormState>();
//   final _picker = ImagePicker();
//   XFile? _imageFile;
//   final _categoryNameController = TextEditingController();

//   @override
//   void initState() {
//     super.initState();
//   }

//   Future<void> _pickImage() async {
//     final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
//     if (pickedFile != null) {
//       setState(() {
//         _imageFile = pickedFile;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.all(16.w),
//       child: Form(
//         key: _formKey,
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               GestureDetector(
//                 onTap: _pickImage,
//                 child: Container(
//                   width: 100.w,
//                   height: 100.h,
//                   decoration: BoxDecoration(
//                     border: Border.all(color: Colors.grey),
//                     borderRadius: BorderRadius.circular(8.r),
//                   ),
//                   child: _imageFile == null
//                       ? const Icon(
//                           Icons.add_a_photo,
//                           size: 40,
//                           color: Colors.grey,
//                         )
//                       : Image.file(File(_imageFile!.path), fit: BoxFit.cover),
//                 ),
//               ),
//               SizedBox(height: 8.h),
//               const Text(
//                 'Max size: 5mb, format: jpg, png',
//                 style: TextStyle(color: Colors.grey),
//               ),
//               SizedBox(height: 16.h),
//               TextFormField(
//                 controller: _categoryNameController,
//                 decoration: const InputDecoration(labelText: 'Category Name'),
//                 validator: (value) =>
//                     value?.isEmpty ?? true ? 'Required' : null,
//               ),
//               SizedBox(height: 20.h),
//               Obx(
//                 () => CustomButton(
//                   buttonColor: AppColors.kPrimaryColor,
//                   onTap: widget.controller.createCategoryLoading.value
//                       ? null
//                       : () {
//                           if (_formKey.currentState!.validate()) {
//                             widget.controller.createCategory(
//                               _categoryNameController.text,
//                               _imageFile != null
//                                   ? File(_imageFile!.path)
//                                   : null,
//                             );
//                             _formKey.currentState!.reset();
//                             _imageFile = null;
//                             // Route to product tab instead of Get.back()
//                             widget.tabController.animateTo(0);
//                           }
//                         },
//                   buttonText: widget.controller.createCategoryLoading.value
//                       ? ''
//                       : 'Add Now',
//                   textColor: Colors.white,
//                   height: 50.h,
//                   fontSize: 16,
//                   child: widget.controller.createCategoryLoading.value
//                       ? const Center(
//                           child: CircularProgressIndicator(color: Colors.white),
//                         )
//                       : null,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vendingsavvy/constant/appcolors.dart';
import 'package:vendingsavvy/controllers/auth_controllers.dart';
import 'package:vendingsavvy/controllers/product_controller.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:vendingsavvy/custom_widgets/custom_button.dart';

class AddInventoryScreen extends StatefulWidget {
  // Changed to StatefulWidget
  const AddInventoryScreen({super.key});

  @override
  State<AddInventoryScreen> createState() => _AddInventoryScreenState();
}

class _AddInventoryScreenState extends State<AddInventoryScreen>
    with SingleTickerProviderStateMixin {
  // Added TickerProviderStateMixin
  late TabController _tabController; // Added TabController
  final ProductController controller = Get.find();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 2,
      vsync: this,
    ); // Initialize TabController
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Inventory'),
        bottom: TabBar(
          controller: _tabController, // Attach TabController
          tabs: const [
            Tab(text: 'Add Products'),
            Tab(text: 'Add Category'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController, // Attach TabController
        children: [
          AddProductTab(
            controller: controller,
            tabController: _tabController,
          ), // Pass TabController
          AddCategoryTab(
            controller: controller,
            tabController: _tabController,
          ), // Pass TabController
        ],
      ),
    );
  }
}

class AddProductTab extends StatefulWidget {
  final ProductController controller;
  final TabController tabController; // Added TabController

  const AddProductTab({
    super.key,
    required this.controller,
    required this.tabController, // Required now
  });

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

  final authController = Get.find<AuthController>();

  // Added InputDecoration for consistent styling
  InputDecoration _buildInputDecoration(String labelText) {
    return InputDecoration(
      labelText: labelText,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.r),
        borderSide: const BorderSide(color: Colors.grey),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.r),
        borderSide: BorderSide(color: AppColors.kPrimaryColor, width: 2),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.r),
        borderSide: const BorderSide(color: Colors.grey),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.r),
        borderSide: const BorderSide(color: Colors.red),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.r),
        borderSide: const BorderSide(color: Colors.red, width: 2),
      ),
      filled: true,
      fillColor: Colors.grey[50],
      contentPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
    );
  }

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
                decoration: _buildInputDecoration('Product Name'),
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
                  decoration: _buildInputDecoration('Select Category'),
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
              Visibility(
                visible: authController.selectedRole.value == "VENDOR",
         
                child: Obx(() {
                  final machines =
                      widget.controller.machinesdata.value?.data?.machine ?? [];
                  return DropdownButtonFormField<int>(
                    value: _selectedMachineId,
                    hint: const Text('Select Machine (Optional)'),
                    decoration: _buildInputDecoration(
                      'Select Machine (Optional)',
                    ),
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
              ),
              SizedBox(height: 16.h),
              TextFormField(
                controller: _barcodeNumberController,
                decoration: _buildInputDecoration('Barcode Number'),
              ),
              SizedBox(height: 16.h),
              TextFormField(
                controller: _sellingPriceController,
                decoration: _buildInputDecoration('Selling Price'),
                keyboardType: TextInputType.number,
                validator: (value) =>
                    value?.isEmpty ?? true ? 'Required' : null,
              ),
              SizedBox(height: 16.h),
              TextFormField(
                controller: _cogsPriceController,
                decoration: _buildInputDecoration('COGS Price'),
                keyboardType: TextInputType.number,
                validator: (value) =>
                    value?.isEmpty ?? true ? 'Required' : null,
              ),
              SizedBox(height: 16.h),
              TextFormField(
                controller: _taxRateController,
                decoration: _buildInputDecoration('Tax Rate'),
                keyboardType: TextInputType.number,
                validator: (value) =>
                    value?.isEmpty ?? true ? 'Required' : null,
              ),
              SizedBox(height: 16.h),
              TextFormField(
                controller: _stockQuantityController,
                decoration: _buildInputDecoration('Stock Quantity'),
                keyboardType: TextInputType.number,
                validator: (value) =>
                    value?.isEmpty ?? true ? 'Required' : null,
              ),
              SizedBox(height: 16.h),
              TextFormField(
                controller: _reorderQuantityController,
                decoration: _buildInputDecoration('Reorder Quantity'),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 16.h),
              TextFormField(
                controller: _expiryDateController,
                decoration: _buildInputDecoration('Expiry Date'),
                readOnly: true,
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
                decoration: _buildInputDecoration('Description'),
                maxLines: 3,
              ),
              SizedBox(height: 20.h),
              Obx(
                () => CustomButton(
                  width: Get.width * 0.7,
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

class AddCategoryTab extends StatefulWidget {
  final ProductController controller;
  final TabController tabController; // Added TabController

  const AddCategoryTab({
    super.key,
    required this.controller,
    required this.tabController, // Required now
  });

  @override
  State<AddCategoryTab> createState() => _AddCategoryTabState();
}

class _AddCategoryTabState extends State<AddCategoryTab> {
  final _formKey = GlobalKey<FormState>();
  final _picker = ImagePicker();
  XFile? _imageFile;
  final _categoryNameController = TextEditingController();

  // Added InputDecoration for consistent styling
  InputDecoration _buildInputDecoration(String labelText) {
    return InputDecoration(
      labelText: labelText,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.r),
        borderSide: const BorderSide(color: Colors.grey),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.r),
        borderSide: BorderSide(color: AppColors.kPrimaryColor, width: 2),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.r),
        borderSide: const BorderSide(color: Colors.grey),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.r),
        borderSide: const BorderSide(color: Colors.red),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.r),
        borderSide: const BorderSide(color: Colors.red, width: 2),
      ),
      filled: true,
      fillColor: Colors.grey[50],
      contentPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
    );
  }

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
                decoration: _buildInputDecoration('Category Name'),
                validator: (value) =>
                    value?.isEmpty ?? true ? 'Required' : null,
              ),
              SizedBox(height: 20.h),
              Obx(
                () => CustomButton(
                  buttonColor: AppColors.kPrimaryColor,
                  onTap: widget.controller.createCategoryLoading.value
                      ? null
                      : () {
                          if (_formKey.currentState!.validate()) {
                            widget.controller.createCategory(
                              _categoryNameController.text,
                              _imageFile != null
                                  ? File(_imageFile!.path)
                                  : null,
                            );
                            _formKey.currentState!.reset();
                            _imageFile = null;
                            // Route to product tab instead of Get.back()
                            widget.tabController.animateTo(0);
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
