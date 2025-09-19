import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show LengthLimitingTextInputFormatter;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vendingsavvy/constant/appcolors.dart';
import 'package:vendingsavvy/constant/route_constants.dart';
import 'package:vendingsavvy/custom_widgets/custom_text.dart';
import 'package:vendingsavvy/custom_widgets/customtextfield.dart'
    show CustomTextField;

class Bussinesscommision extends StatefulWidget {
  const Bussinesscommision({super.key});

  @override
  State<Bussinesscommision> createState() => _BussinesscommisionState();
}

class _BussinesscommisionState extends State<Bussinesscommision> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController commissionController = TextEditingController();
  final TextEditingController salesTaxController = TextEditingController();
  final TextEditingController rentController = TextEditingController();

  @override
  void dispose() {
    commissionController.dispose();
    salesTaxController.dispose();
    rentController.dispose();
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
                  text: "Calculations",
                  fontsize: 14.0,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(height: 16.h),
                CustomText(
                  text: "Commission",
                  fontsize: 12.0,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(height: 4.h),
                CustomTextField(
                  hintText: "Total Commission",
                  textEditingController: commissionController,
                  filled: true,
                  fillColor: Colors.grey[200],
                  prefixIcon: null,
                  borderRadius: BorderRadius.circular(8.0),
                  keyboardType: TextInputType.number,
                  textInputFormattors: [
                    LengthLimitingTextInputFormatter(5), // Limit to 5 digits
                  ],
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
                  ), // % suffix
                  fontSize: 14.sp,
                  hintTextColor: Colors.grey,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter commission";
                    }
                    final numValue = num.tryParse(value);
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
                  hintText: "324",

                  textEditingController: salesTaxController,
                  filled: true,
                  fillColor: Colors.grey[200],
                  prefixIcon: null,
                  borderRadius: BorderRadius.circular(8.0),
                  keyboardType: TextInputType.number,
                  textInputFormattors: [
                    LengthLimitingTextInputFormatter(5), // Limit to 5 digits
                  ],
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
                  ), // suffix
                  fontSize: 14.sp,
                  hintTextColor: Colors.grey,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter sales tax";
                    }
                    final numValue = num.tryParse(value);
                    if (numValue == null || numValue < 0 || numValue > 100) {
                      return "Enter a valid percentage (0-100)";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 12.h),
                CustomText(
                  text: "Rent",
                  fontsize: 12.0,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(height: 4.h),
                CustomTextField(
                  hintText: "Total Rent",
                  textEditingController: rentController,
                  filled: true,
                  fillColor: Colors.grey[200],
                  borderRadius: BorderRadius.circular(8.0),
                  keyboardType: TextInputType.number,
                  textInputFormattors: [
                    LengthLimitingTextInputFormatter(10), // Limit to 10 digits
                  ],
                  fontSize: 14.sp,
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
                  ), // % s
                  hintTextColor: Colors.grey,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter rent";
                    }
                    final numValue = num.tryParse(value);
                    if (numValue == null || numValue < 0) {
                      return "Enter a valid amount";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.h),
                CustomText(
                  text:
                      "A late fee after every 3rd month is \$35 which will be applied. Make the payment on time to avoid further charges.",
                  fontsize: 14.0,
                  color: AppColors.red,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(height: 25.h),
                ElevatedButton(
                  onPressed: () {
                    // if (_formKey.currentState!.validate()) {
                    // Handle next button action
                    Get.toNamed(
                      RouteConstants.vendingconfirmationcomission,
                    ); // Replace with your route
                    // }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    minimumSize: Size(double.infinity, 50.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                  ),
                  child: CustomText(
                    text: "Next",
                    color: Colors.white,
                    fontsize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
