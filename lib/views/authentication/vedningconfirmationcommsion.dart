import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vendingsavvy/constant/appcolors.dart' show AppColors;
import 'package:vendingsavvy/constant/route_constants.dart';
import 'package:vendingsavvy/custom_widgets/custom_text.dart'; // Assuming you use this

class VendingConfirmationCommission extends StatelessWidget {
  const VendingConfirmationCommission({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 32.h), // Top spacing
              // Circular Image with Light Border
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.blue.withOpacity(0.2), // Light border color
                    width: 20.0, // Border width
                  ),
                ),
                child: CircleAvatar(
                  radius: 50.r,
                  backgroundColor: Colors.blue, // Blue background as requested
                  child: Image.asset("assets/images/taxicon.png"),
                ),
              ),
              SizedBox(height: 24.h), // Gap after image
              // First Text (Heading)
              CustomText(
                text: "Total Tax Amount: \$321",
                fontsize: 20.0,
                fontWeight: FontWeight.bold,
                textAlign: TextAlign.center, // Center align heading
              ),
              SizedBox(height: 16.h), // Gap between texts
              // Second Text (Centered Subtitle)
              CustomText(
                text:
                    "This is the total sales tax calculated based on your business location and current sales data. Ensure your records are up-to-date to stay compliant.",
                fontsize: 16.0,
                fontWeight: FontWeight.w400,
                textAlign: TextAlign.center, // Center align subtitle
                maxLines: 5, // Optional: Limit lines for better layout
                overflow: TextOverflow.ellipsis, // Optional: Handle overflow
              ),
              SizedBox(height: 100.h), // Larger gap before button
              // Button
              ElevatedButton(
                onPressed: () {
                  Get.toNamed(RouteConstants.phoneverification);
                  // Add navigation or action here
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  minimumSize: Size(double.infinity, 50.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                ),
                child: CustomText(
                  text: "Go To Home Page",
                  color: AppColors.primary,
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
