import 'package:date_picker_plus/date_picker_plus.dart'
    show showRangePickerDialog, PickerType;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vendingsavvy/custom_widgets/custom_text.dart' show CustomText;

class Balancesheet extends StatefulWidget {
  Balancesheet({super.key});

  @override
  State<Balancesheet> createState() => _BalancesheetState();
}

class _BalancesheetState extends State<Balancesheet> {
  String selectedTab = 'Week';
  DateTime? startDate;
  DateTime? endDate;
  bool showDateRange = false;

  void _showCustomDatePicker() async {
    final DateTimeRange? picked = await showRangePickerDialog(
      context: context,
      minDate: DateTime(2000),
      maxDate: DateTime(2100),
      initialDate: DateTime.now(),
      height: 400,
      width: 350,
      initialPickerType: PickerType.days,
    );

    if (picked != null) {
      setState(() {
        startDate = picked.start;
        endDate = picked.end;
        showDateRange = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: CustomText(
          text: "Balance Sheet",
          fontsize: 20.0,
          fontWeight: FontWeight.w600,
        ),
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Icon(Icons.arrow_back),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Tab Container
              Container(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedTab = 'Week';
                                startDate = null;
                                endDate = null;
                                showDateRange = false;
                              });
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 30,
                                vertical: 10,
                              ),
                              decoration: BoxDecoration(
                                color: selectedTab == 'Week' && !showDateRange
                                    ? Colors.blue
                                    : Colors.grey[200],
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: CustomText(
                                text: 'Week',
                                fontsize: 16.0,
                                fontWeight: FontWeight.w600,
                                color: selectedTab == 'Week' && !showDateRange
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedTab = 'Month';
                                startDate = null;
                                endDate = null;
                                showDateRange = false;
                              });
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 30,
                                vertical: 10,
                              ),
                              decoration: BoxDecoration(
                                color: selectedTab == 'Month' && !showDateRange
                                    ? Colors.blue
                                    : Colors.grey[200],
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: CustomText(
                                text: 'Month',
                                fontsize: 16.0,
                                fontWeight: FontWeight.w600,
                                color: selectedTab == 'Month' && !showDateRange
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedTab = 'Year';
                                startDate = null;
                                endDate = null;
                                showDateRange = false;
                              });
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 30,
                                vertical: 10,
                              ),
                              decoration: BoxDecoration(
                                color: selectedTab == 'Year' && !showDateRange
                                    ? Colors.blue
                                    : Colors.grey[200],
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: CustomText(
                                text: 'Year',
                                fontsize: 16.0,
                                fontWeight: FontWeight.w600,
                                color: selectedTab == 'Year' && !showDateRange
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.calendar_today),
                      onPressed: _showCustomDatePicker,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              // Three Colored Boxes
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.green[100],
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: Colors.green.withOpacity(0.5),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            text: "Assets",
                            fontsize: 14.0,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey,
                          ),
                          CustomText(
                            text: "\$50,700.00",
                            fontsize: 18.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.orange[100],
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: Colors.orange.withOpacity(0.5),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            text: "Liabilities",
                            fontsize: 14.0,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey,
                          ),
                          CustomText(
                            text: "\$50,700.00",
                            fontsize: 18.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.purple[100],
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: Colors.purple.withOpacity(0.5),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            text: "Owner's Equity",
                            fontsize: 14.0,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey,
                          ),
                          CustomText(
                            text: "\$80.50",
                            fontsize: 18.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              // Assets Section
              CustomText(
                text: "Assets",
                fontsize: 18.0,
                fontWeight: FontWeight.w600,
              ),
              SizedBox(height: 8),
              _buildSectionItem("Cash Sales", "\$50,700.00"),
              _buildSectionItem("Credit Sales", "\$50,700.00"),
              _buildSectionItem("Inventory", "\$50,700.00"),
              _buildSectionItem("Prepaid Insurance", "\$50,700.00"),
              _buildSectionItem("Prepaid Rent", "\$50,700.00"),
              SizedBox(height: 6.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    text: "Total Assets",
                    fontsize: 16.0,
                    fontWeight: FontWeight.w600,
                  ),
                  CustomText(
                    text: "\$50,700.00",
                    fontsize: 16.0,
                    fontWeight: FontWeight.w600,
                  ),
                ],
              ),
              Divider(),
              SizedBox(height: 20),
              // Liabilities Section
              CustomText(
                text: "Liabilities",
                fontsize: 18.0,
                fontWeight: FontWeight.w600,
              ),
              SizedBox(height: 8),
              _buildSectionItem("Notes Payable", "\$50,700.00"),
              _buildSectionItem("A/P", "\$50,700.00"),
              _buildSectionItem("Wages Payable", "\$50,700.00"),
              _buildSectionItem("Unearned Revenue", "\$50,700.00"),
              SizedBox(height: 6.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    text: "Total Liabilities",
                    fontsize: 16.0,
                    fontWeight: FontWeight.w600,
                  ),
                  CustomText(
                    text: "\$50,700.00",
                    fontsize: 16.0,
                    fontWeight: FontWeight.w600,
                  ),
                ],
              ),
              Divider(),
              SizedBox(height: 20),
              // Owner's Equity Section
              CustomText(
                text: "Owner's Equity",
                fontsize: 18.0,
                fontWeight: FontWeight.w600,
              ),
              SizedBox(height: 8),
              _buildSectionItem("Retained", "\$50,700.00"),
              _buildSectionItem("Profile", "\$50,700.00"),
              SizedBox(height: 6.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    text: "Total Owner's Equity",
                    fontsize: 16.0,
                    fontWeight: FontWeight.w600,
                  ),
                  CustomText(
                    text: "\$50,700.00",
                    fontsize: 16.0,
                    fontWeight: FontWeight.w600,
                  ),
                ],
              ),
              Divider(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionItem(String title, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomText(
            text: title,
            fontsize: 14.0,
            fontWeight: FontWeight.w400,
            color: Colors.grey,
          ),
          CustomText(text: value, fontsize: 14.0, fontWeight: FontWeight.w400),
        ],
      ),
    );
  }
}
