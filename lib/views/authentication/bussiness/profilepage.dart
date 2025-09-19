import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vendingsavvy/constant/appcolors.dart';
import 'package:vendingsavvy/constant/route_constants.dart';

import 'package:vendingsavvy/custom_widgets/custom_text.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  text: "Profile",
                  fontsize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black, // White text for contrast
                ),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(RouteConstants.expensemanagemeent);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color.fromARGB(
                        255,
                        126,
                        123,
                        123,
                      ).withOpacity(0.3),
                    ),
                    height: 35.h,
                    width: 40.w,
                    child: const Icon(Icons.settings, color: Colors.black),
                  ),
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
                    Center(
                      child: CircleAvatar(
                        radius: 40,
                        backgroundImage: AssetImage(
                          "assets/images/profilepic.png",
                        ),
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Center(
                      child: CustomText(
                        text: "Raisa Adriana",
                        fontsize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Center(
                      child: CustomText(
                        text: "raisaandriana@mail.com",
                        fontsize: 14.0,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(height: 12.h),
                    CustomText(
                      text: "Account Details",
                      fontsize: 16.0,
                      fontWeight: FontWeight.w600,
                    ),
                    SizedBox(height: 12.h),
                    // Profile Information Container
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(RouteConstants.profileinformation);
                      },
                      child: Container(
                        margin: EdgeInsets.only(bottom: 12.h),
                        padding: EdgeInsets.all(12.w),
                        decoration: BoxDecoration(
                          color: Colors.white, // Already white, kept as++1 is
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: Color(0xffeaecf0),
                            width: 2,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.1),
                              blurRadius: 5,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.blue.withOpacity(0.1),
                              ),
                              padding: EdgeInsets.all(8.w),
                              child: const Icon(
                                Icons.person_outline,
                                color: Colors.blue,
                              ),
                            ),
                            SizedBox(width: 12.w),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomText(
                                    text: "Profile Information",
                                    fontsize: 14.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  CustomText(
                                    text: "Manage account details",
                                    fontsize: 12.0,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.grey,
                                  ),
                                ],
                              ),
                            ),
                            const Icon(Icons.chevron_right, color: Colors.grey),
                          ],
                        ),
                      ),
                    ),
                    // Manage Account Details Container
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(RouteConstants.widthdrawehistory);
                      },
                      child: Container(
                        margin: EdgeInsets.only(bottom: 12.h),
                        padding: EdgeInsets.all(12.w),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Color(0xffeaecf0),
                            width: 2,
                          ),
                          color: Colors.white, // Already white, kept as is
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.1),
                              blurRadius: 5,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.blue.withOpacity(0.1),
                              ),
                              padding: EdgeInsets.all(8.w),
                              child: const Icon(
                                Icons.account_circle,
                                color: Colors.blue,
                              ),
                            ),
                            SizedBox(width: 12.w),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomText(
                                    text: "Withdrawal History",
                                    fontsize: 14.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  CustomText(
                                    text: "Review your past withdrawals",
                                    fontsize: 12.0,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.grey,
                                  ),
                                ],
                              ),
                            ),
                            const Icon(Icons.chevron_right, color: Colors.grey),
                          ],
                        ),
                      ),
                    ),
                    // Withdraw History Container
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(RouteConstants.bankcardmanagement);
                      },
                      child: Container(
                        margin: EdgeInsets.only(bottom: 12.h),
                        padding: EdgeInsets.all(12.w),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Color(0xffeaecf0),
                            width: 2,
                          ),
                          color: Colors.white, // Already white, kept as is
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.1),
                              blurRadius: 5,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,

                                color: Colors.blue.withOpacity(0.1),
                              ),
                              padding: EdgeInsets.all(8.w),
                              child: const Icon(
                                Icons.history,
                                color: Colors.blue,
                              ),
                            ),
                            SizedBox(width: 12.w),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomText(
                                    text: "Linked Bank Accounts",
                                    fontsize: 14.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  CustomText(
                                    text: "Manage your bank account",
                                    fontsize: 12.0,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.grey,
                                  ),
                                ],
                              ),
                            ),
                            const Icon(Icons.chevron_right, color: Colors.grey),
                          ],
                        ),
                      ),
                    ),
                    // Linked Bank Accounts Container
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(RouteConstants.reports);
                      },
                      child: Container(
                        margin: EdgeInsets.only(bottom: 12.h),
                        padding: EdgeInsets.all(12.w),

                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Color(0xffeaecf0),
                            width: 2,
                          ),
                          color: Colors.white, // Already white, kept as is
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.1),
                              blurRadius: 5,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.blue.withOpacity(0.1),
                              ),
                              padding: EdgeInsets.all(8.w),
                              child: const Icon(
                                Icons.account_balance,
                                color: Colors.blue,
                              ),
                            ),
                            SizedBox(width: 12.w),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomText(
                                    text: "Reports",
                                    fontsize: 14.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  CustomText(
                                    text: "Manage your bank account",
                                    fontsize: 12.0,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.grey,
                                  ),
                                ],
                              ),
                            ),
                            const Icon(Icons.chevron_right, color: Colors.grey),
                          ],
                        ),
                      ),
                    ),
                    // Reports Container

                    //Setting part
                    CustomText(
                      text: "Settings",
                      fontsize: 16.0,
                      fontWeight: FontWeight.w600,
                    ),
                    SizedBox(height: 12.h),
                    Container(
                      margin: EdgeInsets.only(bottom: 12.h),
                      padding: EdgeInsets.all(12.w),
                      decoration: BoxDecoration(
                        color: Colors.white, // Already white, kept as++1 is
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Color(0xffeaecf0), width: 2),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            blurRadius: 5,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.blue.withOpacity(0.1),
                            ),
                            padding: EdgeInsets.all(8.w),
                            child: const Icon(Icons.lock, color: Colors.blue),
                          ),
                          SizedBox(width: 12.w),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                  text: "Security Settings",
                                  fontsize: 14.0,
                                  fontWeight: FontWeight.w500,
                                ),
                                CustomText(
                                  text: "Set New Password",
                                  fontsize: 12.0,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey,
                                ),
                              ],
                            ),
                          ),
                          const Icon(Icons.chevron_right, color: Colors.grey),
                        ],
                      ),
                    ),
                    // Manage Account Details Container
                    Container(
                      margin: EdgeInsets.only(bottom: 12.h),
                      padding: EdgeInsets.all(12.w),
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0xffeaecf0), width: 2),
                        color: Colors.white, // Already white, kept as is
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            blurRadius: 5,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.blue.withOpacity(0.1),
                            ),
                            padding: EdgeInsets.all(8.w),
                            child: const Icon(
                              Icons.notification_add,
                              color: Colors.blue,
                            ),
                          ),
                          SizedBox(width: 12.w),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                  text: "Notifications",
                                  fontsize: 14.0,
                                  fontWeight: FontWeight.w500,
                                ),
                                CustomText(
                                  text: "Adjust your alert preferences",
                                  fontsize: 12.0,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey,
                                ),
                              ],
                            ),
                          ),
                          const Icon(Icons.chevron_right, color: Colors.grey),
                        ],
                      ),
                    ),
                    CustomText(
                      text: "Others",
                      fontsize: 16.0,
                      fontWeight: FontWeight.w600,
                    ),
                    SizedBox(height: 12.h),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(RouteConstants.aboutus);
                      },
                      child: Container(
                        margin: EdgeInsets.only(bottom: 12.h),
                        padding: EdgeInsets.all(12.w),
                        decoration: BoxDecoration(
                          color: Colors.white, // Already white, kept as++1 is
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: Color(0xffeaecf0),
                            width: 2,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.1),
                              blurRadius: 5,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.blue.withOpacity(0.1),
                              ),
                              padding: EdgeInsets.all(8.w),
                              child: const Icon(
                                Icons.task_alt,
                                color: Colors.blue,
                              ),
                            ),
                            SizedBox(width: 12.w),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomText(
                                    text: "About Us",
                                    fontsize: 14.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  CustomText(
                                    text: "Paychain more information",
                                    fontsize: 12.0,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.grey,
                                  ),
                                ],
                              ),
                            ),
                            const Icon(Icons.chevron_right, color: Colors.grey),
                          ],
                        ),
                      ),
                    ),
                    // Manage Account Details Container
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(RouteConstants.termscondition);
                      },
                      child: Container(
                        margin: EdgeInsets.only(bottom: 12.h),
                        padding: EdgeInsets.all(12.w),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Color(0xffeaecf0),
                            width: 2,
                          ),
                          color: Colors.white, // Already white, kept as is
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.1),
                              blurRadius: 5,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.blue.withOpacity(0.1),
                              ),
                              padding: EdgeInsets.all(8.w),
                              child: const Icon(
                                Icons.description,
                                color: Colors.blue,
                              ),
                            ),
                            SizedBox(width: 12.w),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomText(
                                    text: "Terms & Conditions",
                                    fontsize: 14.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  CustomText(
                                    text: "Our terms & conditions",
                                    fontsize: 12.0,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.grey,
                                  ),
                                ],
                              ),
                            ),
                            const Icon(Icons.chevron_right, color: Colors.grey),
                          ],
                        ),
                      ),
                    ),
                    // Manage Account Details Container
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(RouteConstants.dataprivacy);
                      },
                      child: Container(
                        margin: EdgeInsets.only(bottom: 12.h),
                        padding: EdgeInsets.all(12.w),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Color(0xffeaecf0),
                            width: 2,
                          ),
                          color: Colors.white, // Already white, kept as is
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.1),
                              blurRadius: 5,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.blue.withOpacity(0.1),
                              ),
                              padding: EdgeInsets.all(8.w),
                              child: const Icon(
                                Icons.privacy_tip,
                                color: Colors.blue,
                              ),
                            ),
                            SizedBox(width: 12.w),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomText(
                                    text: "Data Privacy",
                                    fontsize: 14.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  CustomText(
                                    text: "Policy details",
                                    fontsize: 12.0,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.grey,
                                  ),
                                ],
                              ),
                            ),
                            const Icon(Icons.chevron_right, color: Colors.grey),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(RouteConstants.loginscreen);
                      },

                      child: Container(
                        width: Get.width,
                        margin: EdgeInsets.only(bottom: 12.h),
                        padding: EdgeInsets.all(12.w),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.red, width: 2),
                          color: Colors.white, // Already white, kept as is
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.1),
                              blurRadius: 5,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Center(
                          child: CustomText(
                            text: "Logout",
                            fontsize: 14.0,
                            color: Colors.red,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
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
