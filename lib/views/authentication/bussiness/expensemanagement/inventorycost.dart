import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vendingsavvy/constant/route_constants.dart'
    show RouteConstants, addnewcard;
import 'package:vendingsavvy/custom_widgets/custom_button.dart';
import 'package:vendingsavvy/custom_widgets/custom_text.dart' show CustomText;
import 'package:date_picker_plus/date_picker_plus.dart';
import 'package:vendingsavvy/utils/app_colors.dart';
import 'package:vendingsavvy/utils/app_fonts.dart';

class Inventorycost extends StatefulWidget {
  const Inventorycost({super.key});

  @override
  _InventorycostState createState() => _InventorycostState();
}

class _InventorycostState extends State<Inventorycost>
    with SingleTickerProviderStateMixin {
  String selectedTab = 'Week';
  DateTime? startDate;
  DateTime? endDate;
  bool showDateRange = false;

  final List<Map<String, String>> history = [
    {
      'image': 'assets/images/invimg.png',
      'name': 'Expense Name',
      'category': 'Category',
      'price': '\$350.00',
    },
    {
      'image': 'assets/images/invimg2.png',
      'name': 'Expense Name',
      'category': 'Category',
      'price': '\$200.00',
    },
    {
      'image': 'assets/images/invimg.png',
      'name': 'Expense Name',
      'category': 'Category',
      'price': '\$300.00',
    },
    {
      'image': 'assets/images/invimg2.png',
      'name': 'Expense Name',
      'category': 'Category',
      'price': '\$200.00',
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
                    Get.toNamed(RouteConstants.expensehistory);
                  },
                  buttonText: "View Expense History",

                  fontSize: 14.sp,
                  width: Get.width,
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
          "Inventory Cost",
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: const Icon(Icons.arrow_back),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Get.toNamed(RouteConstants.addexpense); 
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 18.0),
              child: Image.asset("assets/images/pluscircle.png"),
            ),
          ),
        ],
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

              // SizedBox(height: 10.h),
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
                            text: " - ${item['price']!}",
                            fontsize: 14.0,
                            fontWeight: FontWeight.w400,
                            color: Colors.red,
                          ),
                        ],
                      ),
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
