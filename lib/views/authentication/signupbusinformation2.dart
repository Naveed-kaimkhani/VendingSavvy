import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vendingsavvy/constant/route_constants.dart';
import 'package:vendingsavvy/custom_widgets/custom_text.dart';
import 'package:vendingsavvy/custom_widgets/customtextfield.dart'
    show CustomTextField;

class Signup2businformation extends StatefulWidget {
  const Signup2businformation({super.key});

  @override
  State<Signup2businformation> createState() => _Signup2businformationState();
}

class _Signup2businformationState extends State<Signup2businformation> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController customerNumberController =
      TextEditingController();
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailPhoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  void dispose() {
    customerNumberController.dispose();
    fullNameController.dispose();
    emailPhoneController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
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
                  textEditingController: customerNumberController,
                  fontSize: 12.sp, // Set hint text font size to 12
                  filled: true,
                  fillColor: Colors.grey[200],
                  prefixIcon: Icon(Icons.person),
                  borderRadius: BorderRadius.circular(8.0),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter customer number";
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
                  textEditingController: fullNameController,
                  filled: true,
                  fontSize: 12.sp, // Set hint text font size to 12
                  fillColor: Colors.grey[200],
                  prefixIcon: Icon(Icons.home),
                  borderRadius: BorderRadius.circular(8.0),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter full name";
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
                  hintText: "(+1) 234 567 890|",
                  textEditingController: fullNameController,
                  filled: true,
                  fontSize: 12.sp, // Set hint text font size to 12
                  fillColor: Colors.grey[200],
                  prefixIcon: Icon(Icons.phone),
                  borderRadius: BorderRadius.circular(8.0),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter full name";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.h),
                ElevatedButton(
                  onPressed: () {
                    Get.toNamed(RouteConstants.vendinginformationscreen);
                    // if (_formKey.currentState!.validate()) {
                    // Handle next button action
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                      text: "Have an account?",
                      fontsize: 14.0,
                      color: Colors.grey,
                    ),
                    SizedBox(width: 4.0),
                    CustomText(
                      text: "Login",
                      fontsize: 14.0,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
