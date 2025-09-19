import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vendingsavvy/constant/appcolors.dart' show AppColors;
import 'package:vendingsavvy/constant/route_constants.dart';
import 'package:vendingsavvy/custom_widgets/custom_button.dart';
import 'package:vendingsavvy/custom_widgets/custom_text.dart';
import 'package:vendingsavvy/utils/app_fonts.dart';

class SigninConfirmation extends StatelessWidget {
  const SigninConfirmation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomText(
              text: "Do you have a vending machine?",
              fontWeight: FontWeight.bold,
              fontsize: 16.0,
            ),
            SizedBox(height: 60.0.h),
            // Buttons
            CustomButton(
              borderRadius: 30,
              buttonColor: AppColors.kPrimaryColor,
              onTap: () {
                Get.toNamed(RouteConstants.loginscreen);
              },
              buttonText: "Yes, Sign Up",
              fontSize: 14.sp,
              width: Get.width,
              fontFamily: AppFonts.interRegular,
            ),
            SizedBox(height: 12.h),
            CustomButton(
              borderRadius: 30,
              buttonColor: Color(0xffd3e8fa),
              onTap: () {
                Get.toNamed(RouteConstants.bussinesslogin);
                // AppNavigation.navigateCloseDialog(context);
              },
              buttonText: "No, Sign Up As Other Business",
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
