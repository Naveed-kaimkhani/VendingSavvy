import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vendingsavvy/constant/appcolors.dart';

import 'package:vendingsavvy/custom_widgets/custom_text.dart';

class DataPrivacy extends StatefulWidget {
  const DataPrivacy({super.key});

  @override
  State<DataPrivacy> createState() => _DataPrivacyState();
}

class _DataPrivacyState extends State<DataPrivacy> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary, // Outer scaffold background
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top Section with Green Background
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 40.h),
            color: AppColors.primary, // Green background for top section
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Icon(Icons.arrow_back, color: Colors.black),
                ),
                SizedBox(width: 30.w),
                CustomText(
                  text: "DataPrivacy",
                  fontsize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black, // White text for contrast
                ),
              ],
            ),
          ),
          // Content Section with White Background
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                color: Colors
                    .white, // White background for the rest of the content
              ),
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: "Description",
                      fontsize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    SizedBox(height: 10.h),

                    CustomText(
                      text:
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.Euismod metus faucibus pulvinar id facilisis quam. Dictum sed condimentum integer ac maecenas suspendisse gravida ut fusce. In dictum enim eu lacus ullamcorper fermentum adipiscing id. Augue sagittis a ut elit euismod. Integer tempor ullamcorper tellus at posuere vitae",
                      fontsize: 14,
                      fontWeight: FontWeight.normal,
                      color: Colors.grey,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
