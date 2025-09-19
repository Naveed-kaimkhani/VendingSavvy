import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vendingsavvy/constant/appcolors.dart' show AppColors;
import 'package:vendingsavvy/constant/route_constants.dart';
import 'package:vendingsavvy/custom_widgets/custom_text.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool _hasAnimated = false;

  List<DateTime?> _dateRange = [DateTime.now(), DateTime.now()];
  String _selectedMonth = 'July'; // Current month (July 25, 2025)
  String _selectedFilter = 'This Week';
  late String _selectedLocation;

  final RxList<Map<String, dynamic>> locations = RxList<Map<String, dynamic>>([
    {'name': 'Location 1', 'id': 'loc1'},
    {'name': 'Location 2', 'id': 'loc2'},
    {'name': 'Location 3', 'id': 'loc3'},
    {'name': 'Location 4', 'id': 'loc4'},
  ]);

  final Map<String, List<Map<String, dynamic>>> products = {
    'all': [
      {
        'name': 'Product Name',
        'subtitle': 'Payment Method',
        'price': 350.00,
        'image': 'assets/images/product.png',
      },
      {
        'name': 'Product Name 2',
        'subtitle': 'Payment Method',
        'price': 250.00,
        'image': 'assets/images/product.png',
      },
    ],
    'loc1': [
      {
        'name': 'Product A',
        'subtitle': 'Payment Method',
        'price': 400.00,
        'image': 'assets/images/product.png',
      },
      {
        'name': 'Product b',
        'subtitle': 'Payment Method',
        'price': 400.00,
        'image': 'assets/images/product.png',
      },
      {
        'name': 'Product c',
        'subtitle': 'Payment Method',
        'price': 400.00,
        'image': 'assets/images/product.png',
      },
      {
        'name': 'Product d',
        'subtitle': 'Payment Method',
        'price': 400.00,
        'image': 'assets/images/product.png',
      },
    ],
    'loc2': [
      {
        'name': 'Product X',
        'subtitle': 'Payment Method',
        'price': 200.00,
        'image': 'assets/images/product.png',
      },
      {
        'name': 'Product X',
        'subtitle': 'Payment Method',
        'price': 200.00,
        'image': 'assets/images/product.png',
      },
      {
        'name': 'Product X',
        'subtitle': 'Payment Method',
        'price': 200.00,
        'image': 'assets/images/product.png',
      },
    ],
    'loc3': [
      {
        'name': 'Product A',
        'subtitle': 'Payment Method',
        'price': 400.00,
        'image': 'assets/images/product.png',
      },
      {
        'name': 'Product b',
        'subtitle': 'Payment Method',
        'price': 400.00,
        'image': 'assets/images/product.png',
      },
      {
        'name': 'Product c',
        'subtitle': 'Payment Method',
        'price': 400.00,
        'image': 'assets/images/product.png',
      },
      {
        'name': 'Product d',
        'subtitle': 'Payment Method',
        'price': 400.00,
        'image': 'assets/images/product.png',
      },
    ],
  };

  int touchedIndex = -1;

  final List<PieChartSectionData> pieChartSections = [
    PieChartSectionData(
      color: Color(0xFF2196F3), // Bright blue
      value: 80.50,
      title: '',
      radius: 80,
    ),
    PieChartSectionData(
      color: Color(0xFF9C27B0), // Vibrant purple
      value: 150.00,
      title: '',
      radius: 80,
    ),
    PieChartSectionData(
      color: Color(0xFF4CAF50), // Light mint green
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

    _selectedLocation = locations.first['id'];
    _selectedMonth = DateTime.now().month == 7
        ? 'July'
        : DateTime.now().month.toString();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String greeting = DateTime.now().hour < 12
        ? "Good morning,"
        : "Good afternoon,";

    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Padding(
        padding: EdgeInsets.all(15.0),
        child: Column(
          children: [
            SizedBox(height: 20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: greeting,
                      fontsize: 14,
                      color: Colors.black,
                    ),
                    CustomText(
                      text: "John Doe",
                      fontsize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.black, width: 1),
                      ),
                      child: Icon(
                        Icons.notifications,
                        color: Colors.black,
                        size: 26,
                      ),
                    ),
                    SizedBox(width: 10.w),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(RouteConstants.profilepage);
                      },
                      child: Container(
                        padding: EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.black, width: 1),
                        ),
                        child: Icon(
                          Icons.person,
                          color: Colors.black,
                          size: 26,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            text: "Summary",
                            fontsize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                          GestureDetector(
                            onTap: () async {
                              final values = await showCalendarDatePicker2Dialog(
                                context: context,
                                config:
                                    CalendarDatePicker2WithActionButtonsConfig(
                                      calendarType:
                                          CalendarDatePicker2Type.range,
                                      selectedDayHighlightColor: Colors.blue,
                                    ),
                                value: _dateRange,
                                dialogBackgroundColor: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                                dialogSize: const Size(320, 400),
                              );
                              if (values != null) {
                                setState(() {
                                  _dateRange = values;
                                });
                              }
                            },
                            child: Image.asset(
                              height: 30,
                              "assets/images/calendar.png",
                              errorBuilder: (context, error, stackTrace) =>
                                  Icon(Icons.calendar_today, size: 30),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 15.h),
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
                                          ? Color.fromARGB(255, 47, 158, 255)
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
                      SizedBox(height: 15.h),
                      IntrinsicHeight(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap:
                                    () {}, // Move GestureDetector inside Expanded if needed
                                child: summaryTile(
                                  "Revenue",
                                  "\$80.50",
                                  Color(0xFF2196F3),
                                ),
                              ),
                            ),
                            Expanded(
                              child: summaryTile(
                                "Expenses",
                                "\$200.00",
                                Color(0xFF4CAF50),
                              ),
                            ),
                            Expanded(
                              child: summaryTile(
                                "Total\nCustomers",
                                "150",
                                Color(0xFF9C27B0),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 15.h),
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
                                  sections: pieChartSections
                                      .asMap()
                                      .entries
                                      .map((entry) {
                                        final index = entry.key;
                                        final section = entry.value;
                                        return PieChartSectionData(
                                          color: section.color,
                                          value: section.value,
                                          radius: touchedIndex == index
                                              ? 90
                                              : 80,
                                          title: '',
                                        );
                                      })
                                      .toList(),
                                  pieTouchData: PieTouchData(
                                    touchCallback:
                                        (FlTouchEvent event, pieTouchResponse) {
                                          setState(() {
                                            if (!event
                                                    .isInterestedForInteractions ||
                                                pieTouchResponse == null ||
                                                pieTouchResponse
                                                        .touchedSection ==
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
                            child: _buildLabel(
                              'Customers: 150',
                              Color(0xFF9C27B0),
                            ),
                          ),
                          Positioned(
                            right: -20.w,
                            top: 20.h,
                            child: _buildLabel(
                              'Expenses: \$200.00',
                              Color(0xFF4CAF50),
                            ),
                          ),
                          Positioned(
                            right: -20.w,
                            bottom: 20.h,
                            child: _buildLabel(
                              'Revenue: \$80.50',
                              Color(0xFF2196F3),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            text: "Sale History",
                            fontsize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                          DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              value: _selectedFilter,
                              items: ['This Week', 'This Month', 'This Year']
                                  .map((String value) {
                                    bool isSelected = _selectedFilter == value;
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 10.w,
                                          vertical: 4.h,
                                        ),
                                        decoration: BoxDecoration(
                                          color: isSelected
                                              ? Color(0xFFDFF4F1)
                                              : Colors.transparent,
                                          border: isSelected
                                              ? Border.all(
                                                  color: Color(0xFFDFF4F1),
                                                  width: 2,
                                                )
                                              : null,
                                          borderRadius: BorderRadius.circular(
                                            20.r,
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            CustomText(
                                              text: value,
                                              fontsize: 12,
                                              fontWeight: FontWeight.bold,
                                              color: isSelected
                                                  ? Colors.black
                                                  : Colors.black,
                                            ),
                                            if (isSelected)
                                              Icon(
                                                Icons.arrow_drop_down,
                                                color: Colors.black,
                                                size: 20,
                                              ),
                                          ],
                                        ),
                                      ),
                                    );
                                  })
                                  .toList(),
                              onChanged: (String? newValue) {
                                setState(() => _selectedFilter = newValue!);
                              },
                              style: TextStyle(color: Colors.black),
                              dropdownColor: Colors.white,
                              icon: SizedBox(), // Hide the default icon
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.h),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: locations.map((location) {
                            bool isSelected =
                                _selectedLocation == location['id'];
                            return GestureDetector(
                              onTap: () => setState(
                                () => _selectedLocation = location['id'],
                              ),
                              child: Container(
                                margin: EdgeInsets.only(right: 10.w),
                                padding: EdgeInsets.symmetric(
                                  horizontal: 12.w,
                                  vertical: 6.h,
                                ),
                                decoration: BoxDecoration(
                                  color: isSelected
                                      ? Colors.blue
                                      : Colors.white,
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                child: CustomText(
                                  text: location['name'],
                                  fontsize: 14,
                                  color: isSelected
                                      ? Colors.white
                                      : Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                      SizedBox(height: 10.h),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: products[_selectedLocation]?.length ?? 0,
                        itemBuilder: (context, index) {
                          final product = products[_selectedLocation]![index];
                          return Container(
                            margin: EdgeInsets.only(bottom: 10.h),
                            child: Row(
                              children: [
                                Image.asset(
                                  product['image'],
                                  width: 40.w,
                                  height: 40.h,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) =>
                                      Icon(Icons.image_not_supported, size: 40),
                                ),
                                SizedBox(width: 10.w),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomText(
                                      text: product['name'],
                                      fontsize: 14,
                                    ),
                                    CustomText(
                                      text: product['subtitle'],
                                      fontsize: 12,
                                      color: Colors.grey,
                                    ),
                                  ],
                                ),
                                Spacer(),
                                CustomText(
                                  text: '\$${product['price']}',
                                  fontsize: 14,
                                  fontWeight: FontWeight.bold,
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
            ),
          ],
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

  Widget summaryTile(String title, String value, Color color) {
    return Container(
      height: 100.0,
      padding: EdgeInsets.all(10.0),
      margin: EdgeInsets.symmetric(horizontal: 4.0),
      decoration: BoxDecoration(
        border: Border.all(color: color),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: ConstrainedBox(
        constraints: BoxConstraints(minWidth: 100.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomText(text: title, fontsize: 14),
            SizedBox(height: 8.0),
            CustomText(text: value, fontsize: 16, fontWeight: FontWeight.bold),
          ],
        ),
      ),
    );
  }
}
