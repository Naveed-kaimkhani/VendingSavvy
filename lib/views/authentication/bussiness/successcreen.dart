import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vendingsavvy/constant/appcolors.dart' show AppColors;
import 'package:vendingsavvy/constant/route_constants.dart';
import 'package:vendingsavvy/custom_widgets/custom_text.dart'; // Assuming you use this

class Successcreen extends StatelessWidget {
  const Successcreen({super.key});

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
                text: "Amount Withdrawn Successfully!!!",
                fontsize: 20.0,
                fontWeight: FontWeight.bold,
                textAlign: TextAlign.center, // Center align heading
              ),
              SizedBox(height: 16.h), // Gap between texts
              // Second Text (Centered Subtitle)
              CustomText(
                text:
                    "Withdrawal Successful! 🎉 The amount has been successfully transferred and will be added to your account soon..",
                fontsize: 16.0,
                fontWeight: FontWeight.w400,
                textAlign: TextAlign.center, // Center align subtitle
                maxLines: 5, // Limit lines for better layout
                overflow: TextOverflow.ellipsis, // Handle overflow
              ),
              SizedBox(height: 20.h), // Larger gap before price
              // Price with Grey Opacity
              Container(
                height: 60.h,
                width: Get.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey.withOpacity(0.23),
                ),
                child: Center(
                  child: CustomText(
                    fontsize: 25.00,
                    text: "\$ 60,200",
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(height: 20.h), // Larger gap before button
              // Awesome Button
              ElevatedButton(
                onPressed: () {
                  Get.toNamed(RouteConstants.addnewcard);
                  // Add navigation or action here
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  minimumSize: Size(double.infinity, 50.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                ),
                child: CustomText(
                  text: "Awesome",
                  color: AppColors.whiteColor,
                  fontsize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16.h), // Gap between buttons
              // Download Receipt Button with Blue Opacity
              ElevatedButton(
                onPressed: () {
                  // Add download receipt logic here
                  Get.toNamed(RouteConstants.addnewcard);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightBlue.withOpacity(
                    0.6,
                  ), // Blue opacity
                  minimumSize: Size(double.infinity, 50.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                ),
                child: CustomText(
                  text: "Download Receipt",
                  color: Colors.white,
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
