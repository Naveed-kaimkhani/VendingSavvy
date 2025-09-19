import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vendingsavvy/constant/appcolors.dart';
import 'package:vendingsavvy/constant/route_constants.dart';
import 'package:vendingsavvy/custom_widgets/custom_text.dart'; // Assuming you use this
import 'package:vendingsavvy/custom_widgets/customtextfield.dart'
    show CustomTextField; // Assuming you use this

class Phoneverificationscreen extends StatelessWidget {
  const Phoneverificationscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },

          child: Icon(Icons.arrow_back),
        ),
      ),

      backgroundColor: AppColors.primary,

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22.0),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10.h), // Top spacing
              // Heading
              CustomText(
                text: "Set Up 2-Step Verification",
                fontsize: 20.0,
                fontWeight: FontWeight.bold,
              ),
              SizedBox(height: 16.h), // Gap after heading
              // Subtext
              CustomText(
                text: "Enter your email, we will send a authentication code",
                fontsize: 16.0,
                fontWeight: FontWeight.w400,
              ),
              SizedBox(height: 24.h), // Gap before input field
              // Phone/Code Input Field
              CustomText(
                text: "Email ",
                fontsize: 16.0,
                fontWeight: FontWeight.w400,
              ),
              SizedBox(height: 8.h), // Gap after heading
              CustomTextField(
                hintText: "timsmss@email.com",
                fontSize: 12.sp,
                hintTextColor: Colors.white,
                textColor: Colors.white,
                filledColor: const Color(0xff599f94),
                filled: true,
                borderColor: const Color.fromARGB(255, 22, 41, 23),
                borderRadius: BorderRadius.circular(8.0),
                // keyboardType: TextInputType.emailAddress, // Changed to email for email input
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter the email";
                  }
                  // Basic email validation (optional)
                  if (!value.contains('@') || !value.contains('.')) {
                    return "Please enter a valid email";
                  }
                  return null;
                },
              ),
              SizedBox(height: 40.h), // Larger gap before button
              // Verify Button
              ElevatedButton(
                onPressed: () {
                  Get.toNamed(RouteConstants.verifyscreen);
                  // Add verification logic or navigation here
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  minimumSize: Size(double.infinity, 50.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                ),
                child: CustomText(
                  text: "Send Code",
                  color: AppColors.kPrimaryColor,
                  fontsize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16.h), // Bottom spacing
            ],
          ),
        ),
      ),
    );
  }
}
