import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:vendingsavvy/constant/route_constants.dart';
import 'package:vendingsavvy/custom_widgets/custom_text.dart' show CustomText;

class Reportsscreen extends StatelessWidget {
  const Reportsscreen({super.key});

  // Reusable method to create a report item with customizable text and onTap
  Widget _buildReportItem(String title, {required VoidCallback onTap}) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: const Color(0xffF3F4F6)),
          ),
          height: 40.h,
          width: Get.width,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  text: title,
                  fontsize: 14.00,
                  fontWeight: FontWeight.w500,
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                  color: Colors.grey.shade600,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: CustomText(
          text: "Reports",
          fontsize: 20.00,
          fontWeight: FontWeight.bold,
        ),
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: const Icon(Icons.arrow_back),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            _buildReportItem(
              "Profit & Loss Report",
              onTap: () {
                Get.toNamed(RouteConstants.profitlossreport);
              },
            ),
            _buildReportItem(
              "Expense Report",
              onTap: () {
                Get.snackbar(
                  "Sales Summary Report",
                  "Navigating to Sales Summary Report",
                  snackPosition: SnackPosition.BOTTOM,
                );
              },
            ),
            _buildReportItem(
              "Sales Report",
              onTap: () {
                Get.snackbar(
                  "Inventory Status Report",
                  "Navigating to Inventory Status Report",
                  snackPosition: SnackPosition.BOTTOM,
                );
              },
            ),
            _buildReportItem(
              "Tax Report",
              onTap: () {
                Get.snackbar(
                  "Revenue by Product Report",
                  "Navigating to Revenue by Product Report",
                  snackPosition: SnackPosition.BOTTOM,
                );
              },
            ),
            _buildReportItem(
              "Balance Sheet",
              onTap: () {
                Get.snackbar(
                  "Transaction History Report",
                  "Navigating to Transaction History Report",
                  snackPosition: SnackPosition.BOTTOM,
                );
              },
            ),
            _buildReportItem(
              "Break Even Report",
              onTap: () {
                Get.toNamed(RouteConstants.breakevenreport);
              },
            ),
            _buildReportItem(
              "Cash Flow Report",
              onTap: () {
                Get.toNamed(RouteConstants.cashflowreport);
              },
            ),
          ],
        ),
      ),
    );
  }
}
