import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show LengthLimitingTextInputFormatter;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vendingsavvy/controllers/auth_controllers.dart';
import 'package:vendingsavvy/custom_widgets/custom_text.dart';
import 'package:vendingsavvy/custom_widgets/customtextfield.dart'
    show CustomTextField;

class VendingsavingaddressScreen extends StatefulWidget {
  const VendingsavingaddressScreen({super.key});

  @override
  State<VendingsavingaddressScreen> createState() =>
      _VendingsavingaddressScreenState();
}

class _VendingsavingaddressScreenState
    extends State<VendingsavingaddressScreen> {
  final _formKey = GlobalKey<FormState>();
  final AuthController authController = Get.find<AuthController>();

  // Controllers for different machine types
  Map<String, Map<String, TextEditingController>> vendingControllers = {};
  Map<String, Map<String, TextEditingController>> cottonCandyControllers = {};
  Map<String, Map<String, TextEditingController>> otherControllers = {};

  @override
  void initState() {
    super.initState();
    _initializeControllers();
  }

  void _initializeControllers() {
    // Initialize vending machine controllers
    int vendingCount = int.parse(authController.selectedVendingMachines.value);
    for (int i = 1; i <= vendingCount; i++) {
      vendingControllers['vending_$i'] = {
        'locationName': TextEditingController(),
        'mileage': TextEditingController(),
        'street': TextEditingController(),
        'city': TextEditingController(),
        'state': TextEditingController(),
        'zipCode': TextEditingController(),
        'commission': TextEditingController(),
        'salesTax': TextEditingController(),
        'rent': TextEditingController(),
        'breakeven': TextEditingController(),
      };
    }

    // Initialize cotton candy machine controllers
    int cottonCandyCount = int.parse(
      authController.selectedCottonCandyMachines.value,
    );
    for (int i = 1; i <= cottonCandyCount; i++) {
      cottonCandyControllers['cottonCandy_$i'] = {
        'locationName': TextEditingController(),
        'mileage': TextEditingController(),
        'street': TextEditingController(),
        'city': TextEditingController(),
        'state': TextEditingController(),
        'zipCode': TextEditingController(),
        'commission': TextEditingController(),
        'salesTax': TextEditingController(),
        'rent': TextEditingController(),
        'breakeven': TextEditingController(),
      };
    }

    // Initialize other machine controllers
    int otherCount = int.parse(authController.selectedOtherMachines.value);
    for (int i = 1; i <= otherCount; i++) {
      otherControllers['other_$i'] = {
        'locationName': TextEditingController(),
        'mileage': TextEditingController(),
        'street': TextEditingController(),
        'city': TextEditingController(),
        'state': TextEditingController(),
        'zipCode': TextEditingController(),
        'commission': TextEditingController(),
        'salesTax': TextEditingController(),
        'rent': TextEditingController(),
        'breakeven': TextEditingController(),
      };
    }
  }

  @override
  void dispose() {
    // Dispose all controllers
    for (var controllers in vendingControllers.values) {
      for (var controller in controllers.values) {
        controller.dispose();
      }
    }
    for (var controllers in cottonCandyControllers.values) {
      for (var controller in controllers.values) {
        controller.dispose();
      }
    }
    for (var controllers in otherControllers.values) {
      for (var controller in controllers.values) {
        controller.dispose();
      }
    }
    super.dispose();
  }

  Widget _buildLocationForm({
    required String machineName,
    required String machineType,
    required Map<String, TextEditingController> controllers,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: "$machineName",
          fontsize: 16.0,
          fontWeight: FontWeight.bold,
        ),
        SizedBox(height: 16.h),
        CustomText(
          text: "Location Name",
          fontsize: 12.0,
          fontWeight: FontWeight.bold,
        ),
        SizedBox(height: 6.h),
        CustomTextField(
          hintText: "Enter Location Name",
          fontSize: 14,
          textEditingController: controllers['locationName']!,
          filled: true,
          fillColor: Colors.grey[200],
          prefixIcon: Icon(Icons.location_on),
          borderRadius: BorderRadius.circular(8.0),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Please enter location name";
            }
            return null;
          },
        ),
        SizedBox(height: 12.h),
        CustomText(
          text: "Mileage",
          fontsize: 14.0,
          fontWeight: FontWeight.bold,
        ),
        SizedBox(height: 6.h),
        CustomTextField(
          hintText: "Enter Mileage",
          textEditingController: controllers['mileage']!,
          filled: true,
          fontSize: 14,
          fillColor: Colors.grey[200],
          prefixIcon: Icon(Icons.gas_meter),
          borderRadius: BorderRadius.circular(8.0),
          keyboardType: TextInputType.number,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Please enter mileage";
            }
            final numValue = double.tryParse(value);
            if (numValue == null || numValue < 0) {
              return "Please enter a valid mileage";
            }
            return null;
          },
        ),
        SizedBox(height: 12.h),
        CustomText(text: "Street", fontsize: 12.0, fontWeight: FontWeight.bold),
        SizedBox(height: 6.h),
        CustomTextField(
          hintText: "Enter Street",
          fontSize: 14,
          textEditingController: controllers['street']!,
          filled: true,
          fillColor: Colors.grey[200],
          prefixIcon: Icon(Icons.home),
          borderRadius: BorderRadius.circular(8.0),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Please enter street";
            }
            return null;
          },
        ),
        SizedBox(height: 12.h),
        CustomText(text: "City", fontsize: 12.0, fontWeight: FontWeight.bold),
        SizedBox(height: 6.h),
        CustomTextField(
          hintText: "Enter City",
          fontSize: 14,
          textEditingController: controllers['city']!,
          filled: true,
          fillColor: Colors.grey[200],
          prefixIcon: Icon(Icons.location_city),
          borderRadius: BorderRadius.circular(8.0),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Please enter city";
            }
            return null;
          },
        ),
        SizedBox(height: 12.h),
        CustomText(text: "State", fontsize: 12.0, fontWeight: FontWeight.bold),
        SizedBox(height: 6.h),
        CustomTextField(
          hintText: "Enter State",
          fontSize: 14,
          textEditingController: controllers['state']!,
          filled: true,
          fillColor: Colors.grey[200],
          prefixIcon: Icon(Icons.map),
          borderRadius: BorderRadius.circular(8.0),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Please enter state";
            }
            return null;
          },
        ),
        SizedBox(height: 12.h),
        CustomText(
          text: "Zip Code",
          fontsize: 12.0,
          fontWeight: FontWeight.bold,
        ),
        SizedBox(height: 6.h),
        CustomTextField(
          hintText: "Enter Zip Code",
          fontSize: 14,
          textEditingController: controllers['zipCode']!,
          filled: true,
          fillColor: Colors.grey[200],
          prefixIcon: Icon(Icons.code),
          borderRadius: BorderRadius.circular(8.0),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Please enter zip code";
            }
            return null;
          },
        ),
        SizedBox(height: 12.h),
        _buildFinancialFields(controllers),
        SizedBox(height: 16.h),
      ],
    );
  }

  Widget _buildFinancialFields(Map<String, TextEditingController> controllers) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: "Commission",
          fontsize: 12.0,
          fontWeight: FontWeight.bold,
        ),
        SizedBox(height: 4.h),
        CustomTextField(
          hintText: "Total Commission",
          textEditingController: controllers['commission']!,
          filled: true,
          fillColor: Colors.grey[200],
          prefixIcon: null,
          borderRadius: BorderRadius.circular(8.0),
          keyboardType: TextInputType.number,
          textInputFormattors: [LengthLimitingTextInputFormatter(5)],
          suffixIcon: Container(
            height: 35.h,
            width: 35.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Color(0xffF3F4F6),
            ),
            child: Center(
              child: Text("%", style: TextStyle(fontSize: 14.sp)),
            ),
          ),
          fontSize: 14,
          hintTextColor: Colors.grey,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Please enter commission";
            }
            final numValue = double.tryParse(value);
            if (numValue == null || numValue < 0 || numValue > 100) {
              return "Enter a valid percentage (0-100)";
            }
            return null;
          },
        ),
        SizedBox(height: 12.h),
        CustomText(
          text: "Sales Tax",
          fontsize: 12.0,
          fontWeight: FontWeight.bold,
        ),
        SizedBox(height: 4.h),
        CustomTextField(
          hintText: "Enter Sales Tax",
          textEditingController: controllers['salesTax']!,
          filled: true,
          fillColor: Colors.grey[200],
          prefixIcon: null,
          borderRadius: BorderRadius.circular(8.0),
          keyboardType: TextInputType.number,
          textInputFormattors: [LengthLimitingTextInputFormatter(5)],
          suffixIcon: Container(
            height: 35.h,
            width: 35.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Color(0xffF3F4F6),
            ),
            child: Center(
              child: Text("%", style: TextStyle(fontSize: 14.sp)),
            ),
          ),
          fontSize: 14,
          hintTextColor: Colors.grey,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Please enter sales tax";
            }
            final numValue = double.tryParse(value);
            if (numValue == null || numValue < 0 || numValue > 100) {
              return "Enter a valid percentage (0-100)";
            }
            return null;
          },
        ),
        SizedBox(height: 12.h),
        CustomText(text: "Rent", fontsize: 12.0, fontWeight: FontWeight.bold),
        SizedBox(height: 4.h),
        CustomTextField(
          hintText: "Total Rent",
          textEditingController: controllers['rent']!,
          filled: true,
          fillColor: Colors.grey[200],
          borderRadius: BorderRadius.circular(8.0),
          keyboardType: TextInputType.number,
          textInputFormattors: [LengthLimitingTextInputFormatter(10)],
          fontSize: 14,
          suffixIcon: Container(
            height: 35.h,
            width: 35.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Color(0xffF3F4F6),
            ),
            child: Center(
              child: Text("\$", style: TextStyle(fontSize: 14.sp)),
            ),
          ),
          hintTextColor: Colors.grey,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Please enter rent";
            }
            final numValue = double.tryParse(value);
            if (numValue == null || numValue < 0) {
              return "Enter a valid amount";
            }
            return null;
          },
        ),
        SizedBox(height: 12.h),
        CustomText(
          text: "Breakeven Amount",
          fontsize: 12.0,
          fontWeight: FontWeight.bold,
        ),
        SizedBox(height: 4.h),
        CustomTextField(
          hintText: "Breakeven Amount",
          textEditingController: controllers['breakeven']!,
          filled: true,
          fillColor: Colors.grey[200],
          borderRadius: BorderRadius.circular(8.0),
          keyboardType: TextInputType.number,
          textInputFormattors: [LengthLimitingTextInputFormatter(10)],
          fontSize: 14,
          suffixIcon: Container(
            height: 35.h,
            width: 35.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Color(0xffF3F4F6),
            ),
            child: Center(
              child: Text("\$", style: TextStyle(fontSize: 14.sp)),
            ),
          ),
          hintTextColor: Colors.grey,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Please enter Breakeven Amount";
            }
            final numValue = double.tryParse(value);
            if (numValue == null || numValue < 0) {
              return "Enter a valid Breakeven Amount";
            }
            return null;
          },
        ),
      ],
    );
  }

  List<Map<String, dynamic>> _generateMachineData() {
    List<Map<String, dynamic>> machineData = [];

    // Add vending machines
    for (int i = 1; i <= vendingControllers.length; i++) {
      final controllers = vendingControllers['vending_$i']!;
      machineData.add({
        "name": "Vending Machine $i",
        "location_name": controllers['locationName']!.text,
        "mileage": double.tryParse(controllers['mileage']!.text) ?? 0.0,
        "street": controllers['street']!.text,
        "city": controllers['city']!.text,
        "state": controllers['state']!.text,
        "zip_code": controllers['zipCode']!.text,
        "machine_type": "VENDING",
        "commission_percentage":
            double.tryParse(controllers['commission']!.text) ?? 0.0,
        "sales_tax_percentage":
            double.tryParse(controllers['salesTax']!.text) ?? 0.0,
        "rent": double.tryParse(controllers['rent']!.text) ?? 0.0,
      });
    }

    // Add cotton candy machines
    for (int i = 1; i <= cottonCandyControllers.length; i++) {
      final controllers = cottonCandyControllers['cottonCandy_$i']!;
      machineData.add({
        "name": "Cotton Candy Machine $i",
        "location_name": controllers['locationName']!.text,
        "mileage": double.tryParse(controllers['mileage']!.text) ?? 0.0,
        "street": controllers['street']!.text,
        "city": controllers['city']!.text,
        "state": controllers['state']!.text,
        "zip_code": controllers['zipCode']!.text,
        "machine_type": "COTTON_CANDY",
        "commission_percentage":
            double.tryParse(controllers['commission']!.text) ?? 0.0,
        "sales_tax_percentage":
            double.tryParse(controllers['salesTax']!.text) ?? 0.0,
        "rent": double.tryParse(controllers['rent']!.text) ?? 0.0,
      });
    }

    // Add other machines
    for (int i = 1; i <= otherControllers.length; i++) {
      final controllers = otherControllers['other_$i']!;
      machineData.add({
        "name": "Other Machine $i",
        "location_name": controllers['locationName']!.text,
        "mileage": double.tryParse(controllers['mileage']!.text) ?? 0.0,
        "street": controllers['street']!.text,
        "city": controllers['city']!.text,
        "state": controllers['state']!.text,
        "zip_code": controllers['zipCode']!.text,
        "machine_type": "OTHER",
        "other_type": "Custom Type", // You might want to add a field for this
        "commission_percentage":
            double.tryParse(controllers['commission']!.text) ?? 0.0,
        "sales_tax_percentage":
            double.tryParse(controllers['salesTax']!.text) ?? 0.0,
        "rent": double.tryParse(controllers['rent']!.text) ?? 0.0,
      });
    }

    return machineData;
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      final machineData = _generateMachineData();
      authController.submitVendingMachineInformation(machineData);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Icon(Icons.arrow_back),
        ),
      ),
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Obx(() {
            // Rebuild when machine counts change
            _initializeControllers();
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(left: 22.0, right: 22.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: "Vending Machines'\nAddresses",
                        fontsize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                      SizedBox(height: 16.h),

                      // Vending Machines
                      ...List.generate(
                        int.parse(authController.selectedVendingMachines.value),
                        (index) => _buildLocationForm(
                          machineName: "Vending Machine ${index + 1}",
                          machineType: "VENDING",
                          controllers:
                              vendingControllers['vending_${index + 1}']!,
                        ),
                      ),

                      // Cotton Candy Machines
                      ...List.generate(
                        int.parse(
                          authController.selectedCottonCandyMachines.value,
                        ),
                        (index) => _buildLocationForm(
                          machineName: "Cotton Candy Machine ${index + 1}",
                          machineType: "COTTON_CANDY",
                          controllers:
                              cottonCandyControllers['cottonCandy_${index + 1}']!,
                        ),
                      ),

                      // Other Machines
                      ...List.generate(
                        int.parse(authController.selectedOtherMachines.value),
                        (index) => _buildLocationForm(
                          machineName: "Other Machine ${index + 1}",
                          machineType: "OTHER",
                          controllers: otherControllers['other_${index + 1}']!,
                        ),
                      ),

                      SizedBox(height: 16.h),

                      SizedBox(height: 16.h),
                    ],
                  ),
                ),
              ),
            );
          }),
          Align(
            alignment: Alignment.bottomCenter,
            child: Obx(
              () => Padding(
                padding: const EdgeInsets.only(left: 30, right: 30, bottom: 20),
                child: ElevatedButton(
                  onPressed: authController.isLoading.value
                      ? null
                      : _submitForm,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    minimumSize: Size(double.infinity, 50.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                  ),
                  child: authController.isLoading.value
                      ? CircularProgressIndicator.adaptive(
                          backgroundColor: Colors.white,
                        )
                      : CustomText(
                          text: "Submit",
                          color: Colors.white,
                          fontsize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart' show LengthLimitingTextInputFormatter;
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:vendingsavvy/controllers/auth_controllers.dart';
// import 'package:vendingsavvy/custom_widgets/custom_text.dart';
// import 'package:vendingsavvy/custom_widgets/customtextfield.dart'
//     show CustomTextField;

// class VendingsavingaddressScreen extends StatefulWidget {
//   const VendingsavingaddressScreen({super.key});

//   @override
//   State<VendingsavingaddressScreen> createState() =>
//       _VendingsavingaddressScreenState();
// }

// class _VendingsavingaddressScreenState
//     extends State<VendingsavingaddressScreen> {
//   final _formKey = GlobalKey<FormState>();
//   final AuthController authController = Get.find<AuthController>();

//   // Controllers for different machine types
//   Map<String, Map<String, TextEditingController>> vendingControllers = {};
//   Map<String, Map<String, TextEditingController>> cottonCandyControllers = {};
//   Map<String, Map<String, TextEditingController>> otherControllers = {};

//   @override
//   void initState() {
//     super.initState();
//     _initializeControllers();
//   }

//   void _initializeControllers() {
//     // Initialize vending machine controllers
//     int vendingCount = int.parse(authController.selectedVendingMachines.value);
//     for (int i = 1; i <= vendingCount; i++) {
//       vendingControllers['vending_$i'] = {
//         'locationName': TextEditingController(),
//         'mileage': TextEditingController(),
//         'street': TextEditingController(),
//         'city': TextEditingController(),
//         'state': TextEditingController(),
//         'zipCode': TextEditingController(),
//         'commission': TextEditingController(),
//         'salesTax': TextEditingController(),
//         'rent': TextEditingController(),
//         'breakeven': TextEditingController(),
//       };
//     }

//     // Initialize cotton candy machine controllers
//     int cottonCandyCount = int.parse(
//       authController.selectedCottonCandyMachines.value,
//     );
//     for (int i = 1; i <= cottonCandyCount; i++) {
//       cottonCandyControllers['cottonCandy_$i'] = {
//         'locationName': TextEditingController(),
//         'mileage': TextEditingController(),
//         'street': TextEditingController(),
//         'city': TextEditingController(),
//         'state': TextEditingController(),
//         'zipCode': TextEditingController(),
//         'commission': TextEditingController(),
//         'salesTax': TextEditingController(),
//         'rent': TextEditingController(),
//         'breakeven': TextEditingController(),
//       };
//     }

//     // Initialize other machine controllers
//     int otherCount = int.parse(authController.selectedOtherMachines.value);
//     for (int i = 1; i <= otherCount; i++) {
//       otherControllers['other_$i'] = {
//         'locationName': TextEditingController(),
//         'mileage': TextEditingController(),
//         'street': TextEditingController(),
//         'city': TextEditingController(),
//         'state': TextEditingController(),
//         'zipCode': TextEditingController(),
//         'commission': TextEditingController(),
//         'salesTax': TextEditingController(),
//         'rent': TextEditingController(),
//         'breakeven': TextEditingController(),
//       };
//     }
//   }

//   @override
//   void dispose() {
//     // Dispose all controllers
//     for (var controllers in vendingControllers.values) {
//       for (var controller in controllers.values) {
//         controller.dispose();
//       }
//     }
//     for (var controllers in cottonCandyControllers.values) {
//       for (var controller in controllers.values) {
//         controller.dispose();
//       }
//     }
//     for (var controllers in otherControllers.values) {
//       for (var controller in controllers.values) {
//         controller.dispose();
//       }
//     }
//     super.dispose();
//   }

//   Widget _buildLocationForm({
//     required String machineName,
//     required String machineType,
//     required Map<String, TextEditingController> controllers,
//   }) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         CustomText(
//           text: "$machineName",
//           fontsize: 16.0,
//           fontWeight: FontWeight.bold,
//         ),
//         SizedBox(height: 16.h),
//         CustomText(
//           text: "Location Name",
//           fontsize: 12.0,
//           fontWeight: FontWeight.bold,
//         ),
//         SizedBox(height: 6.h),
//         CustomTextField(
//           hintText: "Enter Location Name",
//           fontSize: 14,
//           textEditingController: controllers['locationName']!,
//           filled: true,
//           fillColor: Colors.grey[200],
//           prefixIcon: Icon(Icons.location_on),
//           borderRadius: BorderRadius.circular(8.0),
//           validator: (value) {
//             if (value == null || value.isEmpty) {
//               return "Please enter location name";
//             }
//             return null;
//           },
//         ),
//         SizedBox(height: 12.h),
//         CustomText(
//           text: "Mileage",
//           fontsize: 14.0,
//           fontWeight: FontWeight.bold,
//         ),
//         SizedBox(height: 6.h),
//         CustomTextField(
//           hintText: "Enter Mileage",
//           textEditingController: controllers['mileage']!,
//           filled: true,
//           fontSize: 14,
//           fillColor: Colors.grey[200],
//           prefixIcon: Icon(Icons.gas_meter),
//           borderRadius: BorderRadius.circular(8.0),
//           keyboardType: TextInputType.number,
//           validator: (value) {
//             if (value == null || value.isEmpty) {
//               return "Please enter mileage";
//             }
//             final numValue = double.tryParse(value);
//             if (numValue == null || numValue < 0) {
//               return "Please enter a valid mileage";
//             }
//             return null;
//           },
//         ),
//         SizedBox(height: 12.h),
//         CustomText(text: "Street", fontsize: 12.0, fontWeight: FontWeight.bold),
//         SizedBox(height: 6.h),
//         CustomTextField(
//           hintText: "Enter Street",
//           fontSize: 14,
//           textEditingController: controllers['street']!,
//           filled: true,
//           fillColor: Colors.grey[200],
//           prefixIcon: Icon(Icons.home),
//           borderRadius: BorderRadius.circular(8.0),
//           validator: (value) {
//             if (value == null || value.isEmpty) {
//               return "Please enter street";
//             }
//             return null;
//           },
//         ),
//         SizedBox(height: 12.h),
//         CustomText(text: "City", fontsize: 12.0, fontWeight: FontWeight.bold),
//         SizedBox(height: 6.h),
//         CustomTextField(
//           hintText: "Enter City",
//           fontSize: 14,
//           textEditingController: controllers['city']!,
//           filled: true,
//           fillColor: Colors.grey[200],
//           prefixIcon: Icon(Icons.location_city),
//           borderRadius: BorderRadius.circular(8.0),
//           validator: (value) {
//             if (value == null || value.isEmpty) {
//               return "Please enter city";
//             }
//             return null;
//           },
//         ),
//         SizedBox(height: 12.h),
//         CustomText(text: "State", fontsize: 12.0, fontWeight: FontWeight.bold),
//         SizedBox(height: 6.h),
//         CustomTextField(
//           hintText: "Enter State",
//           fontSize: 14,
//           textEditingController: controllers['state']!,
//           filled: true,
//           fillColor: Colors.grey[200],
//           prefixIcon: Icon(Icons.map),
//           borderRadius: BorderRadius.circular(8.0),
//           validator: (value) {
//             if (value == null || value.isEmpty) {
//               return "Please enter state";
//             }
//             return null;
//           },
//         ),
//         SizedBox(height: 12.h),
//         CustomText(
//           text: "Zip Code",
//           fontsize: 12.0,
//           fontWeight: FontWeight.bold,
//         ),
//         SizedBox(height: 6.h),
//         CustomTextField(
//           hintText: "Enter Zip Code",
//           fontSize: 14,
//           textEditingController: controllers['zipCode']!,
//           filled: true,
//           fillColor: Colors.grey[200],
//           prefixIcon: Icon(Icons.code),
//           borderRadius: BorderRadius.circular(8.0),
//           validator: (value) {
//             if (value == null || value.isEmpty) {
//               return "Please enter zip code";
//             }
//             return null;
//           },
//         ),
//         SizedBox(height: 12.h),
//         _buildFinancialFields(controllers),
//         SizedBox(height: 16.h),
//       ],
//     );
//   }

//   Widget _buildFinancialFields(Map<String, TextEditingController> controllers) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         CustomText(
//           text: "Commission",
//           fontsize: 12.0,
//           fontWeight: FontWeight.bold,
//         ),
//         SizedBox(height: 4.h),
//         CustomTextField(
//           hintText: "Total Commission",
//           textEditingController: controllers['commission']!,
//           filled: true,
//           fillColor: Colors.grey[200],
//           prefixIcon: null,
//           borderRadius: BorderRadius.circular(8.0),
//           keyboardType: TextInputType.number,
//           textInputFormattors: [LengthLimitingTextInputFormatter(5)],
//           suffixIcon: Container(
//             height: 35.h,
//             width: 35.w,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(8),
//               color: Color(0xffF3F4F6),
//             ),
//             child: Center(
//               child: Text("%", style: TextStyle(fontSize: 14.sp)),
//             ),
//           ),
//           fontSize: 14,
//           hintTextColor: Colors.grey,
//           validator: (value) {
//             if (value == null || value.isEmpty) {
//               return "Please enter commission";
//             }
//             final numValue = double.tryParse(value);
//             if (numValue == null || numValue < 0 || numValue > 100) {
//               return "Enter a valid percentage (0-100)";
//             }
//             return null;
//           },
//         ),
//         SizedBox(height: 12.h),
//         CustomText(
//           text: "Sales Tax",
//           fontsize: 12.0,
//           fontWeight: FontWeight.bold,
//         ),
//         SizedBox(height: 4.h),
//         CustomTextField(
//           hintText: "Enter Sales Tax",
//           textEditingController: controllers['salesTax']!,
//           filled: true,
//           fillColor: Colors.grey[200],
//           prefixIcon: null,
//           borderRadius: BorderRadius.circular(8.0),
//           keyboardType: TextInputType.number,
//           textInputFormattors: [LengthLimitingTextInputFormatter(5)],
//           suffixIcon: Container(
//             height: 35.h,
//             width: 35.w,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(8),
//               color: Color(0xffF3F4F6),
//             ),
//             child: Center(
//               child: Text("%", style: TextStyle(fontSize: 14.sp)),
//             ),
//           ),
//           fontSize: 14,
//           hintTextColor: Colors.grey,
//           validator: (value) {
//             if (value == null || value.isEmpty) {
//               return "Please enter sales tax";
//             }
//             final numValue = double.tryParse(value);
//             if (numValue == null || numValue < 0 || numValue > 100) {
//               return "Enter a valid percentage (0-100)";
//             }
//             return null;
//           },
//         ),
//         SizedBox(height: 12.h),
//         CustomText(text: "Rent", fontsize: 12.0, fontWeight: FontWeight.bold),
//         SizedBox(height: 4.h),
//         CustomTextField(
//           hintText: "Total Rent",
//           textEditingController: controllers['rent']!,
//           filled: true,
//           fillColor: Colors.grey[200],
//           borderRadius: BorderRadius.circular(8.0),
//           keyboardType: TextInputType.number,
//           textInputFormattors: [LengthLimitingTextInputFormatter(10)],
//           fontSize: 14,
//           suffixIcon: Container(
//             height: 35.h,
//             width: 35.w,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(8),
//               color: Color(0xffF3F4F6),
//             ),
//             child: Center(
//               child: Text("\$", style: TextStyle(fontSize: 14.sp)),
//             ),
//           ),
//           hintTextColor: Colors.grey,
//           validator: (value) {
//             if (value == null || value.isEmpty) {
//               return "Please enter rent";
//             }
//             final numValue = double.tryParse(value);
//             if (numValue == null || numValue < 0) {
//               return "Enter a valid amount";
//             }
//             return null;
//           },
//         ),
//         SizedBox(height: 12.h),
//         CustomText(
//           text: "Breakeven Amount",
//           fontsize: 12.0,
//           fontWeight: FontWeight.bold,
//         ),
//         SizedBox(height: 4.h),
//         CustomTextField(
//           hintText: "Breakeven Amount",
//           textEditingController: controllers['breakeven']!,
//           filled: true,
//           fillColor: Colors.grey[200],
//           borderRadius: BorderRadius.circular(8.0),
//           keyboardType: TextInputType.number,
//           textInputFormattors: [LengthLimitingTextInputFormatter(10)],
//           fontSize: 14,
//           suffixIcon: Container(
//             height: 35.h,
//             width: 35.w,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(8),
//               color: Color(0xffF3F4F6),
//             ),
//             child: Center(
//               child: Text("\$", style: TextStyle(fontSize: 14.sp)),
//             ),
//           ),
//           hintTextColor: Colors.grey,
//           validator: (value) {
//             if (value == null || value.isEmpty) {
//               return "Please enter Breakeven Amount";
//             }
//             final numValue = double.tryParse(value);
//             if (numValue == null || numValue < 0) {
//               return "Enter a valid Breakeven Amount";
//             }
//             return null;
//           },
//         ),
//       ],
//     );
//   }

//   List<Map<String, dynamic>> _generateMachineData() {
//     List<Map<String, dynamic>> machineData = [];

//     // Add vending machines
//     for (int i = 1; i <= vendingControllers.length; i++) {
//       final controllers = vendingControllers['vending_$i']!;
//       machineData.add({
//         "name": "Vending Machine $i",
//         "location_name": controllers['locationName']!.text,
//         "mileage": double.tryParse(controllers['mileage']!.text) ?? 0.0,
//         "street": controllers['street']!.text,
//         "city": controllers['city']!.text,
//         "state": controllers['state']!.text,
//         "zip_code": controllers['zipCode']!.text,
//         "machine_type": "VENDING",
//         "commission_percentage":
//             double.tryParse(controllers['commission']!.text) ?? 0.0,
//         "sales_tax_percentage":
//             double.tryParse(controllers['salesTax']!.text) ?? 0.0,
//         "rent": double.tryParse(controllers['rent']!.text) ?? 0.0,
//       });
//     }

//     // Add cotton candy machines
//     for (int i = 1; i <= cottonCandyControllers.length; i++) {
//       final controllers = cottonCandyControllers['cottonCandy_$i']!;
//       machineData.add({
//         "name": "Cotton Candy Machine $i",
//         "location_name": controllers['locationName']!.text,
//         "mileage": double.tryParse(controllers['mileage']!.text) ?? 0.0,
//         "street": controllers['street']!.text,
//         "city": controllers['city']!.text,
//         "state": controllers['state']!.text,
//         "zip_code": controllers['zipCode']!.text,
//         "machine_type": "COTTON_CANDY",
//         "commission_percentage":
//             double.tryParse(controllers['commission']!.text) ?? 0.0,
//         "sales_tax_percentage":
//             double.tryParse(controllers['salesTax']!.text) ?? 0.0,
//         "rent": double.tryParse(controllers['rent']!.text) ?? 0.0,
//       });
//     }

//     // Add other machines
//     for (int i = 1; i <= otherControllers.length; i++) {
//       final controllers = otherControllers['other_$i']!;
//       machineData.add({
//         "name": "Other Machine $i",
//         "location_name": controllers['locationName']!.text,
//         "mileage": double.tryParse(controllers['mileage']!.text) ?? 0.0,
//         "street": controllers['street']!.text,
//         "city": controllers['city']!.text,
//         "state": controllers['state']!.text,
//         "zip_code": controllers['zipCode']!.text,
//         "machine_type": "OTHER",
//         "other_type": "Custom Type", // You might want to add a field for this
//         "commission_percentage":
//             double.tryParse(controllers['commission']!.text) ?? 0.0,
//         "sales_tax_percentage":
//             double.tryParse(controllers['salesTax']!.text) ?? 0.0,
//         "rent": double.tryParse(controllers['rent']!.text) ?? 0.0,
//       });
//     }

//     return machineData;
//   }

//   void _submitForm() {
//     if (_formKey.currentState!.validate()) {
//       final machineData = _generateMachineData();
//       authController.submitVendingMachineInformation(machineData);
//     }
//   }

//   Widget _buildStickyButton() {
//     return Obx(
//       () => Container(
//         width: double.infinity,
//         margin: EdgeInsets.symmetric(horizontal: 22.w, vertical: 16.h),
//         child: ElevatedButton(
//           onPressed: authController.isLoading.value ? null : _submitForm,
//           style: ElevatedButton.styleFrom(
//             backgroundColor: Colors.blue,
//             minimumSize: Size(double.infinity, 50.0),
//             elevation: 2,
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(25.0),
//             ),
//           ),
//           child: authController.isLoading.value
//               ? Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     SizedBox(
//                       width: 20.w,
//                       height: 20.h,
//                       child: CircularProgressIndicator(
//                         color: Colors.white,
//                         strokeWidth: 2,
//                       ),
//                     ),
//                     SizedBox(width: 12.w),
//                     CustomText(
//                       text: "Submitting...",
//                       color: Colors.white,
//                       fontsize: 16.0,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ],
//                 )
//               : CustomText(
//                   text: "Submit Vending Information",
//                   color: Colors.white,
//                   fontsize: 16.0,
//                   fontWeight: FontWeight.bold,
//                 ),
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Column(
//         children: [
//           // AppBar
//           Container(
//             width: double.infinity,
//             color: Colors.white,
//             padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
//             child: SafeArea(
//               child: Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 16.h),
//                 child: Row(
//                   children: [
//                     GestureDetector(
//                       onTap: () {
//                         Get.back();
//                       },
//                       child: Container(
//                         padding: EdgeInsets.all(8.w),
//                         decoration: BoxDecoration(
//                           color: Colors.grey[100],
//                           borderRadius: BorderRadius.circular(8.r),
//                         ),
//                         child: Icon(Icons.arrow_back, color: Colors.black),
//                       ),
//                     ),
//                     SizedBox(width: 16.w),
//                     Expanded(
//                       child: CustomText(
//                         text: "Vending Machines' Addresses",
//                         fontsize: 20.0,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),

//           // Form Content
//           Expanded(
//             child: Obx(() {
//               // Rebuild when machine counts change
//               _initializeControllers();
//               return SingleChildScrollView(
//                 padding: EdgeInsets.symmetric(horizontal: 22.w),
//                 child: Form(
//                   key: _formKey,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       SizedBox(height: 16.h),
//                       CustomText(
//                         text:
//                             "Complete the information below for each machine location",
//                         fontsize: 14.0,
//                         fontWeight: FontWeight.w500,
//                         color: Colors.grey[600],
//                       ),
//                       SizedBox(height: 24.h),

//                       // Vending Machines
//                       ...List.generate(
//                         int.parse(authController.selectedVendingMachines.value),
//                         (index) => _buildLocationForm(
//                           machineName: "Vending Machine ${index + 1}",
//                           machineType: "VENDING",
//                           controllers:
//                               vendingControllers['vending_${index + 1}']!,
//                         ),
//                       ),

//                       // Cotton Candy Machines
//                       ...List.generate(
//                         int.parse(
//                           authController.selectedCottonCandyMachines.value,
//                         ),
//                         (index) => _buildLocationForm(
//                           machineName: "Cotton Candy Machine ${index + 1}",
//                           machineType: "COTTON_CANDY",
//                           controllers:
//                               cottonCandyControllers['cottonCandy_${index + 1}']!,
//                         ),
//                       ),

//                       // Other Machines
//                       ...List.generate(
//                         int.parse(authController.selectedOtherMachines.value),
//                         (index) => _buildLocationForm(
//                           machineName: "Other Machine ${index + 1}",
//                           machineType: "OTHER",
//                           controllers: otherControllers['other_${index + 1}']!,
//                         ),
//                       ),

//                       SizedBox(
//                         height: 100.h,
//                       ), // Extra space for the sticky button
//                     ],
//                   ),
//                 ),
//               );
//             }),
//           ),

//           // Sticky Bottom Button
//           Container(
//             width: double.infinity,
//             decoration: BoxDecoration(
//               color: Colors.white,
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.black.withOpacity(0.1),
//                   blurRadius: 10,
//                   offset: Offset(0, -2),
//                 ),
//               ],
//             ),
//             child: _buildStickyButton(),
//           ),
//         ],
//       ),
//     );
//   }
// }
