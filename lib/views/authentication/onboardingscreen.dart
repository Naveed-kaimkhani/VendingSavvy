import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vendingsavvy/constant/appcolors.dart';
import 'package:vendingsavvy/constant/route_constants.dart';
import 'package:vendingsavvy/custom_widgets/custom_button.dart'
    show CustomButton;
import 'package:vendingsavvy/custom_widgets/custom_text.dart';
import 'package:vendingsavvy/utils/app_fonts.dart';
import 'package:vendingsavvy/utils/app_navigation.dart' show AppNavigation;

class Onboardingscreen extends StatelessWidget {
  const Onboardingscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
           backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30.h),
            // Image placeholder (replace with actual logo widget)
            Image.asset(
              'assets/images/image1.png',
              height: 50.0,
            ), // Adjust path and size
            SizedBox(height: 20.h),
            // Bold Title
            CustomText(
              text: "Our community commitment",
              fontWeight: FontWeight.w400,
              fontsize: 16.0,
            ),
            SizedBox(height: 10.0),
            // Subtitle
            CustomText(
              text: "Vending Savvy is a community where anyone can belong",
              fontsize: 20.0,
              fontWeight: FontWeight.bold,
            ),
            SizedBox(height: 10.0),
            // Body Text
            CustomText(
              text:
                  "To ensure this, we’re asking you to commit to the following:",
              fontsize: 14.0,
              fontWeight: FontWeight.w400,
            ),

            SizedBox(height: 10.0),
            // Body Text
            CustomText(
              text:
                  "Lorem ipsum dolor sit amet consectetur. Tincidunt gravida aliquet vulputate placerat bibendum risus in lectus enim. Massa ultricies purus ac blandit proin amet duis amet. Eget elit eleifend ultricies vitae interdum fermentum neque. Sodales cras.",
              fontsize: 14.0,
              fontWeight: FontWeight.w400,
            ),
            SizedBox(height: 10.0),
            // Learn more link
            CustomText(
              text: "Learn more",
              color: Colors.blue,
              textDecoration: TextDecoration.underline,
              fontsize: 14.0,
            ),
            SizedBox(height: 60.0.h),
            // Buttons
            CustomButton(
              borderRadius: 30,
              buttonColor: AppColors.kPrimaryColor,
              onTap: () {
                Get.toNamed(RouteConstants.signinscreenconfirmation);
              },
              buttonText: "Agree and Continue",
              fontSize: 14.sp,
              width: Get.width,
              fontFamily: AppFonts.interRegular,
            ),
            SizedBox(height: 12.h),
            CustomButton(
              borderRadius: 30,
              buttonColor: Color(0xffd3e8fa),
              onTap: () {
                AppNavigation.navigateCloseDialog(context);
              },
              buttonText: "Decline",
              fontSize: 14.sp,
              width: Get.width,
              textColor: AppColors.kPrimaryColor,
              fontFamily: AppFonts.interRegular,
            ),
          ],
        ),
      ),
    );
  }
}
