import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vendingsavvy/constant/route_constants.dart' show RouteConstants;
import 'package:vendingsavvy/custom_widgets/custom_button.dart';
import 'package:vendingsavvy/custom_widgets/custom_text.dart' show CustomText;
import 'package:date_picker_plus/date_picker_plus.dart';
import 'package:vendingsavvy/utils/app_colors.dart';
import 'package:vendingsavvy/utils/app_fonts.dart';

class Profitlossreport extends StatefulWidget {
  const Profitlossreport({super.key});

  @override
  _ProfitlossreportState createState() => _ProfitlossreportState();
}

class _ProfitlossreportState extends State<Profitlossreport>
    with SingleTickerProviderStateMixin {
  String selectedTab = 'Week';
  DateTime? startDate;
  DateTime? endDate;
  bool showDateRange = false;

  final List<Map<String, String>> history = [
    {
      'image': 'assets/images/product.png',
      'title': 'Product Name',
      'subtitle': 'Payment Method',
      'price': '\$350.00',
    },
    {
      'image': 'assets/images/product.png',
      'title': 'Product Name',
      'subtitle': 'Payment Method',
      'price': '\$350.00',
    },
    {
      'image': 'assets/images/product.png',
      'title': 'Product Name',
      'subtitle': 'Payment Method',
      'price': '\$350.00',
    },
    {
      'image': 'assets/images/product.png',
      'title': 'Product Name',
      'subtitle': 'Payment Method',
      'price': '\$350.00',
    },
    {
      'image': 'assets/images/product.png',
      'title': 'Product Name',
      'subtitle': 'Payment Method',
      'price': '\$350.00',
    },
    {
      'image': 'assets/images/product.png',
      'title': 'Product Name',
      'subtitle': 'Payment Method',
      'price': '\$350.00',
    },
  ];
  void _showCustomDatePicker() async {
    showDialog<DateTimeRange>(
      context: context,
      builder: (BuildContext context) {
        DateTimeRange? selectedRange;
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          contentPadding: EdgeInsets.all(16.w),
          content: SizedBox(
            width: 350.w,
            height: 450.h,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Date Range Picker
                Expanded(
                  child: RangeDatePicker(
                    minDate: DateTime(2000),
                    maxDate: DateTime(2100),
                    // initialStartDate: startDate,
                    // initialEndDate: endDate,
                    onRangeSelected: (DateTimeRange? range) {
                      selectedRange = range;
                    },
                  ),
                ),
                SizedBox(height: 16.h),
                // Download Report Button
                CustomButton(
                  borderRadius: 30,
                  buttonColor: Colors.blue,
                  onTap: () {
                    Get.toNamed(RouteConstants.bankconnectionpage);
                  },
                  buttonText: "Donwload Report",

                  fontSize: 14.sp,
                  width: 180.w,
                  fontFamily: AppFonts.interRegular,
                ),
              ],
            ),
          ),
        );
      },
    ).then((picked) {
      if (picked != null) {
        setState(() {
          startDate = picked.start;
          endDate = picked.end;
          showDateRange = true;
        });
      }
    });
  }

  int touchedIndex = -1;

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
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Profit & Loss Report",
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: const Icon(Icons.arrow_back),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Tab Container
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
                                selectedTab = 'Week';
                                startDate = null;
                                endDate = null;
                                showDateRange = false;
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 30,
                                vertical: 10,
                              ),
                              decoration: BoxDecoration(
                                color: selectedTab == 'Week' && !showDateRange
                                    ? Colors.blue
                                    : Colors.grey[200],
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(
                                'Week',
                                style: TextStyle(
                                  color: selectedTab == 'Week' && !showDateRange
                                      ? Colors.white
                                      : Colors.black,
                                ),
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
                              padding: const EdgeInsets.symmetric(
                                horizontal: 30,
                                vertical: 10,
                              ),
                              decoration: BoxDecoration(
                                color: selectedTab == 'Month' && !showDateRange
                                    ? Colors.blue
                                    : Colors.grey[200],
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(
                                'Month',
                                style: TextStyle(
                                  color:
                                      selectedTab == 'Month' && !showDateRange
                                      ? Colors.white
                                      : Colors.black,
                                ),
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
                              padding: const EdgeInsets.symmetric(
                                horizontal: 30,
                                vertical: 10,
                              ),
                              decoration: BoxDecoration(
                                color: selectedTab == 'Year' && !showDateRange
                                    ? Colors.blue
                                    : Colors.grey[200],
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(
                                'Year',
                                style: TextStyle(
                                  color: selectedTab == 'Year' && !showDateRange
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.calendar_today),
                      onPressed: _showCustomDatePicker,
                    ),
                  ],
                ),
              ),
              CustomText(
                text: "Total Profit",
                fontsize: 14.00,
                fontWeight: FontWeight.w400,
                color: AppColors.APP_GRAY_COLOR,
              ),
              CustomText(
                text: "1,549,123",
                fontsize: 28.00,
                fontWeight: FontWeight.bold,
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
                                    if (!event.isInterestedForInteractions ||
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
                      'Loss: \$25.00',
                      const Color(0xFFF44336),
                    ),
                  ),
                  Positioned(
                    right: 6.w,
                    bottom: 20.h,
                    child: _buildLabel(
                      'Profit: \$75.00',
                      const Color(0xFF2196F3),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 40.h,
                    width: 120.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Color(0xffF3F4F6),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 10.h,
                          width: 10.w,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                        SizedBox(width: 4.w),
                        CustomText(
                          text: "Profit",
                          fontsize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 20.w),
                  Container(
                    height: 40.h,
                    width: 120.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Color(0xffF3F4F6),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 10.h,
                          width: 10.w,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                        SizedBox(width: 4.w),
                        CustomText(
                          text: "Loss",
                          fontsize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              // Four Containers
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: (Get.width - 32.w) / 2 - 8.w,
                    padding: EdgeInsets.all(12.w),
                    decoration: BoxDecoration(
                      color: Color(0xFFE3F2FD),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.blue.withOpacity(0.5)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          text: "Total Profit",
                          fontsize: 14,
                          fontWeight: FontWeight.w400,
                          color: AppColors.APP_GRAY_COLOR,
                        ),
                        CustomText(
                          text: "\$200.00",
                          fontsize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: (Get.width - 32.w) / 2 - 8.w,
                    padding: EdgeInsets.all(12.w),
                    decoration: BoxDecoration(
                      color: Color(0xFFFDEDED),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.red.withOpacity(0.5)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          text: "Total Loss",
                          fontsize: 14,
                          fontWeight: FontWeight.w400,
                          color: AppColors.APP_GRAY_COLOR,
                        ),
                        CustomText(
                          text: "\$80.50",
                          fontsize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: (Get.width - 32.w) / 2 - 8.w,
                    padding: EdgeInsets.all(12.w),
                    decoration: BoxDecoration(
                      color: Color(0xFFE8F5E9),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.green.withOpacity(0.5)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          text: "Total Sales",
                          fontsize: 14,
                          fontWeight: FontWeight.w400,
                          color: AppColors.APP_GRAY_COLOR,
                        ),
                        CustomText(
                          text: "\$80.50",
                          fontsize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: (Get.width - 32.w) / 2 - 8.w,
                    padding: EdgeInsets.all(12.w),
                    decoration: BoxDecoration(
                      color: Color(0xFFF3E5F5),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.purple.withOpacity(0.5)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          text: "COGS",
                          fontsize: 14,
                          fontWeight: FontWeight.w400,
                          color: AppColors.APP_GRAY_COLOR,
                        ),
                        CustomText(
                          text: "\$200.00",
                          fontsize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              // History Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    text: "History",
                    fontsize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  GestureDetector(
                    onTap: () {
                      // Navigate to View All screen
                      Get.snackbar("View All", "Navigate to all history");
                    },
                    child: CustomText(
                      text: "View All >",
                      fontsize: 14,
                      color: Colors.blue,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: history.length,
                itemBuilder: (context, index) {
                  final item = history[index];
                  return Padding(
                    padding: EdgeInsets.only(top: 8.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 40.h,
                              width: 40.w,
                              decoration: BoxDecoration(
                                color: Colors.blue[100],
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Image.asset(
                                item['image']!,
                                fit: BoxFit.contain,
                              ),
                            ),
                            SizedBox(width: 12.w),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                  text: item['title']!,
                                  fontsize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                                CustomText(
                                  text: item['subtitle']!,
                                  fontsize: 12,
                                  color: AppColors.APP_GRAY_COLOR,
                                  fontWeight: FontWeight.w400,
                                ),
                              ],
                            ),
                          ],
                        ),
                        CustomText(
                          text: item['price']!,
                          fontsize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
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
