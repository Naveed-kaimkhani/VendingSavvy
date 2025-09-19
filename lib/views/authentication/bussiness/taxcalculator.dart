import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vendingsavvy/constant/appcolors.dart';
import 'package:vendingsavvy/custom_widgets/custom_text.dart';

class Taxcalculator extends StatefulWidget {
  const Taxcalculator({super.key});

  @override
  State<Taxcalculator> createState() => _TaxcalculatorState();
}

class _TaxcalculatorState extends State<Taxcalculator>
    with SingleTickerProviderStateMixin {
  int touchedIndex = -1;
  String _selectedMonth =
      'July'; // Default month (current month as of Aug 04, 2025)
  final List<PieChartSectionData> pieChartSections = [
    PieChartSectionData(
      color: const Color(0xFF2196F3),
      value: 75.0,
      title: '',
      radius: 80,
    ),
    PieChartSectionData(
      color: const Color(0xFFF44336),
      value: 25.0,
      title: '',
      radius: 80,
    ),
  ];
  String selectedTab = 'Monthly';
  double getTotalValue() {
    return pieChartSections
        .map((section) => section.value)
        .reduce((a, b) => a + b);
  }

  bool _hasAnimated = false;
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
    if (!_hasAnimated) {
      _controller.forward();
      _hasAnimated = true;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
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
                  text: "Tax Calculator",
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
                    Container(
                      height: 190.h,
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: Color(0xffbb38f6),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Switch(value: true, onChanged: (value) {}),
                              SizedBox(width: 4.w),
                              CustomText(
                                text: "Mastercard",
                                fontsize: 14,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ],
                          ),
                          SizedBox(height: 24.h),
                          CustomText(
                            text: "5229-9012-3245-6789",
                            fontsize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                          const SizedBox(height: 8),
                          CustomText(
                            text: "Carla Botosh",
                            fontsize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          const SizedBox(height: 12),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomText(
                                text: "Exp 11/25",
                                fontsize: 14,
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                              ),
                              CustomText(
                                text: "\$123,321",
                                fontsize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10.h),
                    CustomText(
                      text: "Tax Calculator",
                      fontsize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        ScaleTransition(
                          scale: _animation,
                          child: Container(
                            height: 220.h,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 10,
                                  offset: Offset(0, 5),
                                ),
                              ],
                            ),
                            child: PieChart(
                              PieChartData(
                                sectionsSpace: 10,
                                centerSpaceRadius: 30,
                                sections: pieChartSections.asMap().entries.map((
                                  entry,
                                ) {
                                  final index = entry.key;
                                  final section = entry.value;
                                  return PieChartSectionData(
                                    color: section.color,
                                    value: section.value,
                                    radius: touchedIndex == index ? 90 : 80,
                                    title: '',
                                  );
                                }).toList(),
                                pieTouchData: PieTouchData(
                                  touchCallback:
                                      (FlTouchEvent event, pieTouchResponse) {
                                        setState(() {
                                          if (!event
                                                  .isInterestedForInteractions ||
                                              pieTouchResponse == null ||
                                              pieTouchResponse.touchedSection ==
                                                  null) {
                                            touchedIndex = -1;
                                            return;
                                          }
                                          touchedIndex = pieTouchResponse
                                              .touchedSection!
                                              .touchedSectionIndex;
                                        });
                                      },
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          right: 6.w,
                          top: 20.h,
                          child: _buildLabel(
                            'Income: \$25.00',
                            const Color(0xFFF44336),
                          ),
                        ),
                        Positioned(
                          right: 6.w,
                          bottom: 20.h,
                          child: _buildLabel(
                            'Tax: \$75.00',
                            const Color(0xFF2196F3),
                          ),
                        ),
                      ],
                    ),
                    CustomText(
                      text: "Tax Breakdown",
                      fontsize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    SizedBox(height: 4.h),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 10),
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
                                      selectedTab = 'Monthly';
                                    });
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 60,
                                      vertical: 10,
                                    ),
                                    decoration: BoxDecoration(
                                      color: selectedTab == 'Monthly'
                                          ? Colors.blue
                                          : Colors.grey[200],
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Text(
                                      'Monthly',
                                      style: TextStyle(
                                        color: selectedTab == 'Monthly'
                                            ? Colors.white
                                            : Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      selectedTab = 'Yearly';
                                    });
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 60,
                                      vertical: 10,
                                    ),
                                    decoration: BoxDecoration(
                                      color: selectedTab == 'Yearly'
                                          ? Colors.blue
                                          : Colors.grey[200],
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Text(
                                      'Yearly',
                                      style: TextStyle(
                                        color: selectedTab == 'Yearly'
                                            ? Colors.white
                                            : Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 12.h),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children:
                            [
                              'January',
                              'February',
                              'March',
                              'April',
                              'May',
                              'June',
                              'July',
                              'August',
                              'September',
                              'October',
                              'November',
                              'December',
                            ].map((month) {
                              bool isSelected = _selectedMonth == month;
                              return GestureDetector(
                                onTap: () =>
                                    setState(() => _selectedMonth = month),
                                child: Container(
                                  margin: EdgeInsets.only(right: 10.w),
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 10.w,
                                    vertical: 4.h,
                                  ),
                                  decoration: BoxDecoration(
                                    color: isSelected
                                        ? AppColors.BUTTON_COLOR
                                        : Colors.transparent,
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  child: CustomText(
                                    text: month,
                                    fontsize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: isSelected
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                                ),
                              );
                            }).toList(),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    // New Tax Breakdown Data Section
                    Container(
                      padding: EdgeInsets.all(16.w),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            text: "Tax Breakdown for $_selectedMonth",
                            fontsize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          SizedBox(height: 10.h),
                          _buildBreakdownRow(
                            'Income Inc Tax',
                            '\$25.00',
                            Colors.black,
                          ),
                          _buildBreakdownRow(
                            'Mileage',
                            '\$15.2.0',
                            Colors.black,
                          ),

                          _buildBreakdownRow(
                            'Tax Deduction',
                            '- \$75.00',
                            Colors.red,
                          ),
                          _buildBreakdownRow(
                            'Income After Tax',
                            '\$100.00',
                            Colors.green,
                          ),
                        ],
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

  Widget _buildLabel(String text, Color color) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: color.withOpacity(0.9),
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(color: Colors.black26, blurRadius: 6, offset: Offset(2, 2)),
        ],
      ),
      child: CustomText(
        text: text,
        fontsize: 12,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildBreakdownRow(String title, String value, Color color) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomText(
            text: title,
            fontsize: 14,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
          CustomText(
            text: value,
            fontsize: 14,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ],
      ),
    );
  }
}
