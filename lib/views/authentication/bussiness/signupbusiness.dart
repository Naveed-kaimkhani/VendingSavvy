import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vendingsavvy/constant/route_constants.dart';
import 'package:vendingsavvy/controllers/auth_controllers.dart';
import 'package:vendingsavvy/custom_widgets/custom_button.dart';
import 'package:vendingsavvy/custom_widgets/custom_text.dart';
import 'package:vendingsavvy/custom_widgets/customtextfield.dart'
    show CustomTextField;

class BussinessinformationScreen extends StatefulWidget {
  const BussinessinformationScreen({super.key});

  @override
  State<BussinessinformationScreen> createState() =>
      _BussinessinformationScreenState();
}

class _BussinessinformationScreenState
    extends State<BussinessinformationScreen> {
  final _formKey = GlobalKey<FormState>();
  final authController = Get.find<AuthController>();
  // bool _isPasswordVisible = false;
  // bool _isConfirmPasswordVisible = false;
  // String? _passwordError;

  // Dropdown value

  @override
  void dispose() {
    super.dispose();
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 22.0, right: 22.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: "Business Information",
                  fontsize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(height: 16.h),
                CustomText(
                  text: "Business Name",
                  fontsize: 12.0,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(height: 4.h),
                CustomTextField(
                  hintText: "Vending Savvy",
                  textEditingController: authController.businessNameController,
                  filled: true,
                  fontSize: 12.sp,
                  fillColor: Colors.grey[200],
                  prefixIcon: Icon(Icons.person_outline),
                  borderRadius: BorderRadius.circular(8.0),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter business name";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 12.h),
                CustomText(
                  text: "Business Address",
                  fontsize: 12.0,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(height: 4.h),
                CustomTextField(
                  hintText: "Address",
                  textEditingController:
                      authController.businessAddressController,
                  filled: true,
                  fontSize: 12.sp,
                  fillColor: Colors.grey[200],
                  prefixIcon: Icon(Icons.home),
                  borderRadius: BorderRadius.circular(8.0),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter address";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 12.h),
                CustomText(
                  text: "Business Contact Number",
                  fontsize: 12.0,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(height: 4.h),
                CustomTextField(
                  hintText: "(+1) 234 567 890",
                  fontSize: 12.sp,
                  textEditingController: authController.contactNumberController,
                  keyboardType: TextInputType.phone,
                  filled: true,
                  fillColor: Colors.grey[200],
                  prefixIcon: Icon(Icons.phone),
                  borderRadius: BorderRadius.circular(8.0),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter contact number";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 12.h),
                CustomText(
                  text: "Type of Business",
                  fontsize: 12.0,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(height: 4.h),
                // Dropdown for Type of Business
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: DropdownButton<String>(
                    value: authController.selectedBusinessType.value,
                    hint: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Select Business Type",
                        style: TextStyle(fontSize: 12.sp, color: Colors.grey),
                      ),
                    ),
                    icon: Icon(Icons.arrow_drop_down),
                    iconSize: 24,
                    elevation: 16,
                    style: TextStyle(color: Colors.black, fontSize: 12.sp),
                    underline: Container(
                      height: 0, // Remove default underline
                    ),
                    onChanged: (String? newValue) {
                      setState(() {
                        authController.selectedBusinessType.value =
                            newValue ?? "RETAILER";
                      });
                    },
                    items: <String>['RETAILER', 'VENDOR']
                        .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12.0,
                              ),
                              child: Text(value),
                            ),
                          );
                        })
                        .toList(),
                    isExpanded: true, // Fill the container width
                  ),
                ),
                SizedBox(height: 12.h),
                // New Field: Business Email
                CustomText(
                  text: "Business Email",
                  fontsize: 12.0,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(height: 4.h),
                CustomTextField(
                  hintText: "example@email.com",
                  textEditingController: authController.emailController,
                  filled: true,
                  fontSize: 12.sp,
                  fillColor: Colors.grey[200],
                  prefixIcon: Icon(Icons.email),
                  borderRadius: BorderRadius.circular(8.0),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter business email";
                    }
                    if (!value.contains('@') || !value.contains('.')) {
                      return "Please enter a valid email";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.h),
                buildTaxFields(authController),

                SizedBox(height: 16.h),
              
             Obx(()=>   ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      authController.submitBusinessInformation(
                        businessName:
                            authController.businessNameController.text,
                        businessAddress:
                            authController.businessAddressController.text,
                        contactNumber:
                            authController.contactNumberController.text,
                        businessType: authController.selectedBusinessType.value,
                        country: authController.countryController.text,
                        state: authController.stateController.text,
                        county: authController.countyController.text,
                        stateTax: double.parse(
                          authController.stateController.text,
                        ),
                        countyTax: double.parse(
                          authController.countyTaxController.text,
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    minimumSize: Size(double.infinity, 50.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                  ),
                  child: authController.isLoading.value?CircularProgressIndicator.adaptive() :CustomText(
                    text: "Next",
                    color: Colors.white,
                    fontsize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget buildTaxFields(authController) {
  return Visibility(
    visible: authController.selectedBusinessType.value == "RETAILER",
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: "Tax Information",
          fontsize: 20.0,
          fontWeight: FontWeight.bold,
        ),
        SizedBox(height: 16.h),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: "State Tax (%)",
              fontsize: 12.0,
              fontWeight: FontWeight.bold,
            ),
            SizedBox(height: 4.h),
            CustomTextField(
              hintText: "Enter state tax percentage",
              textEditingController: authController.stateTaxController,
              filled: true,
              fontSize: 12.sp,
              fillColor: Colors.grey[200],
              prefixIcon: const Icon(Icons.percent),
              borderRadius: BorderRadius.circular(8.0),
              keyboardType: TextInputType.number,
              validator: (value) {
                // if (authController.selected) {}
                if (value == null || value.isEmpty) {
                  return "Please enter state tax percentage";
                }
                final numValue = double.tryParse(value);
                if (numValue == null) {
                  return "Please enter a valid number";
                }
                if (numValue < 0 || numValue > 100) {
                  return "Tax percentage must be between 0 and 100";
                }
                return null;
              },
            ),
            SizedBox(height: 12.h),
            CustomText(
              text: "County Tax (%)",
              fontsize: 12.0,
              fontWeight: FontWeight.bold,
            ),
            SizedBox(height: 4.h),
            CustomTextField(
              hintText: "Enter county tax percentage",
              textEditingController: authController.countyTaxController,
              filled: true,
              fontSize: 12.sp,
              fillColor: Colors.grey[200],
              prefixIcon: const Icon(Icons.percent),
              borderRadius: BorderRadius.circular(8.0),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter county tax percentage";
                }
                final numValue = double.tryParse(value);
                if (numValue == null) {
                  return "Please enter a valid number";
                }
                if (numValue < 0 || numValue > 100) {
                  return "Tax percentage must be between 0 and 100";
                }
                return null;
              },
            ),
          ],
        ),
      ],
    ),
  );
}
