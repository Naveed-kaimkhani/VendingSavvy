import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:vendingsavvy/constant/appcolors.dart';
import 'package:vendingsavvy/constant/route_constants.dart' show RouteConstants;
import 'package:vendingsavvy/custom_widgets/custom_text.dart';

class Verifybankcard extends StatelessWidget {
  const Verifybankcard({super.key});

  @override
  Widget build(BuildContext context) {
    // Default PIN theme
    final defaultPinTheme = PinTheme(
      width: 45.w,
      height: 45.h,
      textStyle: TextStyle(fontSize: 20.sp, color: Colors.white),
      decoration: BoxDecoration(
        color: const Color(0xff599f94), // Matching your previous fillColor
        border: Border.all(color: const Color.fromARGB(255, 22, 41, 23)),
        borderRadius: BorderRadius.circular(8.0),
      ),
    );

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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10.h), // Top spacing
              // Heading
              CustomText(
                text: "Verify Code",
                fontsize: 20.0,
                fontWeight: FontWeight.bold,
              ),
              SizedBox(height: 16.h), // Gap after heading
              // Subtext
              CustomText(
                text:
                    "Please enter the code we just sent to email timsmxxx@email.com",
                fontsize: 16.0,
                fontWeight: FontWeight.w400,
              ),
              SizedBox(height: 24.h), // Gap before input field
              // PIN Input Field (Replaced CustomTextField with Pinput)
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Pinput(
                    length: 4, // 6-digit PIN, adjust as per SS
                    defaultPinTheme: defaultPinTheme,
                    focusedPinTheme: defaultPinTheme.copyWith(
                      decoration: defaultPinTheme.decoration!.copyWith(
                        border: Border.all(
                          color: Colors.white,
                        ), // Highlight on focus
                      ),
                    ),
                    onCompleted: (pin) {
                      // Handle PIN completion (e.g., validate)
                      print("Entered PIN: $pin");
                    },
                    // validator: (value) {
                    //   if (value == null || value.length < 6) {
                    //     return "Please enter the full code";
                    //   }
                    //   return null;
                    // },
                  ),
                ),
              ),
              SizedBox(height: 6.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(
                    text: "Resend code in ",
                    fontsize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                  CustomText(
                    text: "00:48",
                    fontsize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ],
              ),
              SizedBox(height: 40.h), // Larger gap before button
              // Send Code Button
              ElevatedButton(
                onPressed: () {
                  Get.toNamed(RouteConstants.bankcardconnected);
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
                  text: "Verify",
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
