import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vendingsavvy/constant/route_constants.dart';
import 'package:vendingsavvy/custom_widgets/custom_button.dart';
import 'package:vendingsavvy/custom_widgets/custom_text.dart' show CustomText;
import 'package:date_picker_plus/date_picker_plus.dart';
import 'package:vendingsavvy/utils/app_colors.dart';
import 'package:vendingsavvy/utils/app_fonts.dart';

class Expensemanagment extends StatefulWidget {
  Expensemanagment({super.key});

  @override
  _ExpensemanagmentState createState() => _ExpensemanagmentState();
}

class _ExpensemanagmentState extends State<Expensemanagment>
    with SingleTickerProviderStateMixin {
  String selectedTab = 'Week';
  DateTime? startDate;
  DateTime? endDate;
  bool showDateRange = false;

  final List<Map<String, String>> history = [
    {
      'image': 'assets/images/product.png',
      'name': 'Expense Name',
      'category': 'Category',
      'price': '\$350.00',
    },
    {
      'image': 'assets/images/product.png',
      'name': 'Expense Name',
      'category': 'Category',
      'price': '\$200.00',
    },
    {
      'image': 'assets/images/product.png',
      'name': 'Expense Name',
      'category': 'Category',
      'price': '\$300.00',
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
            height: 350.h,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: RangeDatePicker(
                    minDate: DateTime(2000),
                    maxDate: DateTime(2100),
                    onRangeSelected: (DateTimeRange? range) {
                      selectedRange = range;
                    },
                  ),
                ),
                SizedBox(height: 4.h),
                CustomButton(
                  borderRadius: 30,
                  buttonColor: Colors.blue,
                  onTap: () {
                    Get.toNamed(RouteConstants.balancesheet);
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
      color: Color(0xFF2196F3),
      value: 80.50,
      title: '',
      radius: 80,
    ),
    PieChartSectionData(
      color: Color(0xFF9C27B0),
      value: 150.00,
      title: '',
      radius: 80,
    ),
    PieChartSectionData(
      color: Color(0xFF4CAF50),
      value: 200.00,
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
      duration: Duration(seconds: 2),
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
        title: Text(
          "Expense Management",
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
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
          padding: EdgeInsets.all(16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                      icon: Icon(Icons.calendar_today),
                      onPressed: _showCustomDatePicker,
                    ),
                  ],
                ),
              ),
              Center(
                child: CustomText(
                  text: "Total Spending",
                  fontsize: 14.00,
                  fontWeight: FontWeight.w400,
                  color: AppColors.APP_GRAY_COLOR,
                ),
              ),
              Center(
                child: CustomText(
                  text: "1,549,123",
                  fontsize: 28.00,
                  fontWeight: FontWeight.bold,
                ),
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
                          sectionsSpace: 12,
                          centerSpaceRadius: 40,
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
                    left: -20.w,
                    top: 80.h,
                    child: _buildLabel('Customers: 150', Color(0xFF9C27B0)),
                  ),
                  Positioned(
                    right: -20.w,
                    top: 20.h,
                    child: _buildLabel('Expenses: \$200.00', Color(0xFF4CAF50)),
                  ),
                  Positioned(
                    right: -20.w,
                    bottom: 20.h,
                    child: _buildLabel('Revenue: \$80.50', Color(0xFF2196F3)),
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        child: Container(
                          height: 40.h,
                          width: 140.w,
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
                                text: "Inventory Cost",
                                fontsize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Container(
                        height: 40.h,
                        width: 140.w,
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
                                color: Color(0xffFF8C39),
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                            SizedBox(width: 4.w),
                            CustomText(
                              text: "Utility Cost",
                              fontsize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 20.w),
                  Container(
                    height: 40.h,
                    width: 150.w,
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
                          text: "Maintenance Cost",
                          fontsize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              CustomText(
                text: "Categories",
                fontsize: 18.0,
                fontWeight: FontWeight.bold,
              ),
              SizedBox(height: 10.h),
              SizedBox(
                height: 250.h,
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(RouteConstants.inventorycost);
                      },
                      child: _buildCategoryItem(
                        "assets/images/inventoryss.png",
                        "Inventory Cost",
                        "13 transactions • \$1372.80",
                        "+5.2%",
                        Colors.red,
                      ),
                    ),
                    SizedBox(height: 15.h),
                    _buildCategoryItem(
                      "assets/images/maintainss.png",
                      "Maintenance Cost",
                      "11 transactions • \$1372.80",
                      "+3.8%",
                      Color(0xffFF8C39),
                    ),
                    SizedBox(height: 15.h),
                    _buildCategoryItem(
                      "assets/images/totalrentss.png",
                      "Total Rental Cost",
                      "10 transactions • \$1372.80",
                      "+2.1%",
                      Colors.green,
                    ),
                    SizedBox(height: 15.h),
                    _buildCategoryItem(
                      "assets/images/totatrefundss.png",
                      "Total Refund",
                      "9 transactions • \$1372.80",
                      "-1.5%",
                      Colors.red,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    text: "Recent Expenses",
                    fontsize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.snackbar("View All", "Navigate to all expenses");
                    },
                    child: CustomText(
                      text: "View All >",
                      fontsize: 14.0,
                      color: Colors.blue,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: history.length,
                itemBuilder: (context, index) {
                  final item = history[index];
                  return Padding(
                    padding: EdgeInsets.only(top: 8.h),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey[300]!),
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      padding: EdgeInsets.all(8.w),
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
                                  shape: BoxShape.circle,
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
                                    text: item['name']!,
                                    fontsize: 14.0,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  CustomText(
                                    text: item['category']!,
                                    fontsize: 12.0,
                                    color: AppColors.APP_GRAY_COLOR,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          CustomText(
                            text: item['price']!,
                            fontsize: 14.0,
                            fontWeight: FontWeight.w400,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              SizedBox(height: 10.h),
            ],
          ),
        ),
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

  Widget _buildCategoryItem(
    String imagePath,
    String title,
    String subtitle,
    String percentage,
    Color color,
  ) {
    // Extract numerical value from percentage (e.g., "5.2" from "+5.2%")
    double percentageValue =
        double.tryParse(percentage.replaceAll(RegExp(r'[+%-]'), '')) ?? 0.0;
    // Normalize to a value between 0.0 and 1.0 (assuming max percentage is 10% for scaling)
    double fillValue =
        percentageValue.clamp(0.0, 10.0) /
        10.0; // Scales 0% to 10% to 0.0 to 1.0

    return Container(
      width: 160.w,
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: Colors.grey, width: 1.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                imagePath,
                height: 50.h,
                width: 50.w,
                fit: BoxFit.contain,
              ),
              SizedBox(width: 7.h),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(
                          text: title,
                          fontsize: 14.0,
                          fontWeight: FontWeight.w600,
                          textAlign: TextAlign.left,
                        ),

                        Row(
                          children: [
                            CustomText(
                              text: percentage,
                              fontsize: 12.0,
                              fontWeight: FontWeight.w400,
                              color: percentage.contains('-')
                                  ? Colors.red
                                  : Colors.green,
                            ),
                            SizedBox(width: 6.w),
                            Icon(
                              Icons.arrow_drop_up,
                              color: percentage.contains('-')
                                  ? Colors.red
                                  : Colors.green,
                              size: 18.h,
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 2.h),
                    CustomText(
                      text: subtitle,
                      fontsize: 14.0,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey,
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 6.h),

          SizedBox(height: 4.h),
          // Dynamic fill line using LinearProgressIndicator
          LinearProgressIndicator(
            value: fillValue, // Dynamic fill based on percentage
            backgroundColor: Colors.grey[300],
            valueColor: AlwaysStoppedAnimation<Color>(
              percentage.contains('-')
                  ? Colors.red.withOpacity(0.5)
                  : Colors.green.withOpacity(0.5),
            ),
            minHeight: 6.h, // Adjusted height for visibility
          ),
        ],
      ),
    );
  }
}
