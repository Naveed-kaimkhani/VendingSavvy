import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vendingsavvy/constant/appcolors.dart' show AppColors;
import 'package:vendingsavvy/constant/route_constants.dart';
import 'package:vendingsavvy/custom_widgets/custom_button.dart'
    show CustomButton;
import 'package:vendingsavvy/custom_widgets/custom_text.dart' show CustomText;
import 'package:vendingsavvy/utils/app_fonts.dart';
import 'package:vendingsavvy/views/authentication/bussiness/prac.dart';

class Bankcardmanagment extends StatelessWidget {
  const Bankcardmanagment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: CustomText(
          text: "Bank Card Management",
          fontsize: 20.00,
          fontWeight: FontWeight.bold,
        ),
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Icon(Icons.arrow_back),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 60.h),
          Center(child: Image.asset("assets/images/searchcard.png")),
          SizedBox(height: 30.h),
          CustomText(
            text: "No Card Connected",
            fontWeight: FontWeight.bold,
            fontsize: 24.0,
          ),
          SizedBox(height: 4.h),
          CustomText(
            text:
                "You haven't connected a card yet. Link a card to\n enable seamless transactions and track your\n financial activity effortlessly.",
            fontsize: 12,
            fontWeight: FontWeight.w400,
          ),
          SizedBox(height: 30.h),
          CustomButton(
            borderRadius: 30,
            buttonColor: AppColors.kPrimaryColor,
            onTap: () {
              Get.toNamed(RouteConstants.bankconnectionpage);
            },
            buttonText: "Add Card",
            fontSize: 14.sp,
            width: 180.w,
            fontFamily: AppFonts.interRegular,
          ),
        ],
      ),
    );
  }
}
