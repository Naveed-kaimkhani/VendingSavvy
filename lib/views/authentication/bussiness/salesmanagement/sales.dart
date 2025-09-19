import 'dart:io';
import 'package:date_picker_plus/date_picker_plus.dart' show RangeDatePicker;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vendingsavvy/constant/appcolors.dart' show AppColors;

import 'package:vendingsavvy/custom_widgets/custom_button.dart'
    show CustomButton;
import 'package:vendingsavvy/custom_widgets/custom_text.dart';
import 'package:vendingsavvy/utils/app_fonts.dart';

class Salesmanagement extends StatefulWidget {
  const Salesmanagement({super.key});

  @override
  State<Salesmanagement> createState() => _SalesmanagementState();
}

class _SalesmanagementState extends State<Salesmanagement>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  String selectedTab = 'Sales Through Cash'; // Default to Sales Through Cash

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  String selectedTabtop = 'Week';
  DateTime? startDate;
  DateTime? endDate;
  bool showDateRange = false;
  DateTime? selectedDate;
  String? selectedCategoryType;
  final TextEditingController expenseNameController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController amountController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController additionalTextController =
      TextEditingController();
  File? categoryImage;

  final List<String> categoryTypes = [
    'Inventory',
    'Utility',
    'Maintenance',
    'Rental',
  ];

  // Sample product data with image placeholder
  final List<Map<String, dynamic>> cashProducts = [
    {'name': 'Product 1', 'price': 50.00, 'subtitle': 'Payment Method'},
    {'name': 'Product 2', 'price': 30.00, 'subtitle': 'Payment Method'},
    {'name': 'Product 3', 'price': 50.00, 'subtitle': 'Payment Method'},
    {'name': 'Product 4', 'price': 30.00, 'subtitle': 'Payment Method'},
  ];

  final List<Map<String, dynamic>> cardProducts = [
    {'name': 'Product 5', 'price': 5033.00, 'subtitle': 'Payment Method'},
    {'name': 'Product 6', 'price': 350.00, 'subtitle': 'Payment Method'},
    {'name': 'Product 7', 'price': 770.00, 'subtitle': 'Payment Method'},
    {'name': 'Product 8', 'price': 660.00, 'subtitle': 'Payment Method'},
  ];

  @override
  Widget build(BuildContext context) {
    bool isAddNowEnabled =
        selectedTab == 'Add Category' && categoryController.text.isNotEmpty;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Sales Managment",
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
          Padding(
            padding: const EdgeInsets.only(right: 18.0),
            child: Image.asset("assets/images/pluscircle.png"),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top tabs
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
                                selectedTabtop = 'Week';
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
                                color:
                                    selectedTabtop == 'Week' && !showDateRange
                                    ? Colors.blue
                                    : Colors.grey[200],
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(
                                'Week',
                                style: TextStyle(
                                  color:
                                      selectedTabtop == 'Week' && !showDateRange
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedTabtop = 'Month';
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
                                color:
                                    selectedTabtop == 'Month' && !showDateRange
                                    ? Colors.blue
                                    : Colors.grey[200],
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(
                                'Month',
                                style: TextStyle(
                                  color:
                                      selectedTabtop == 'Month' &&
                                          !showDateRange
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedTabtop = 'Year';
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
                                color:
                                    selectedTabtop == 'Year' && !showDateRange
                                    ? Colors.blue
                                    : Colors.grey[200],
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(
                                'Year',
                                style: TextStyle(
                                  color:
                                      selectedTabtop == 'Year' && !showDateRange
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
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        CustomText(
                          text: "Total Sales",
                          fontsize: 14.00,
                          fontWeight: FontWeight.w400,
                          color: AppColors.APP_GRAY_COLOR,
                        ),
                        CustomText(
                          text: "\$1,549.81",
                          fontsize: 28.00,
                          fontWeight: FontWeight.bold,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        CustomText(
                          text: "No of Customers",
                          fontsize: 14.00,
                          fontWeight: FontWeight.w400,
                          color: AppColors.APP_GRAY_COLOR,
                        ),
                        CustomText(
                          text: "850",
                          fontsize: 28.00,
                          fontWeight: FontWeight.bold,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 4.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    text: "History",
                    fontsize: 18.00,
                    fontWeight: FontWeight.bold,
                  ),
                  CustomText(
                    text: "ViewAll",
                    fontsize: 14.00,
                    fontWeight: FontWeight.w400,
                    color: Colors.blue,
                  ),
                ],
              ),
              SizedBox(height: 12.h),
              // Bottom tabs
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
                                selectedTab = 'Sales Through Cash';
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 10,
                              ),
                              decoration: BoxDecoration(
                                color: selectedTab == 'Sales Through Cash'
                                    ? Colors.blue
                                    : Colors.grey[200],
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(
                                'Sales Through Cash',
                                style: TextStyle(
                                  color: selectedTab == 'Sales Through Cash'
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedTab = 'Sales Through Card';
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 10,
                              ),
                              decoration: BoxDecoration(
                                color: selectedTab == 'Sales Through Card'
                                    ? Colors.blue
                                    : Colors.grey[200],
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(
                                'Sales Through Card',
                                style: TextStyle(
                                  color: selectedTab == 'Sales Through Card'
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
              SizedBox(height: 20.h),
              if (selectedTab == 'Sales Through Cash' ||
                  selectedTab == 'Sales Through Card')
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: selectedTab == 'Sales Through Cash'
                          ? cashProducts.length
                          : cardProducts.length,
                      itemBuilder: (context, index) {
                        final product = selectedTab == 'Sales Through Cash'
                            ? cashProducts[index]
                            : cardProducts[index];
                        return Card(
                          color: Colors.white,
                          elevation: 2,
                          margin: EdgeInsets.symmetric(vertical: 4.h),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(8.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // Product Image and Details
                                Row(
                                  children: [
                                    Icon(Icons.image, size: 60),
                                    SizedBox(width: 10.w),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        CustomText(
                                          text: product['name'],
                                          fontsize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black,
                                        ),
                                        Row(
                                          children: [
                                            CustomText(
                                              text: product['subtitle'],
                                              fontsize: 12,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.grey,
                                            ),
                                            SizedBox(width: 6.w),
                                            CustomText(
                                              text: '.',
                                              fontsize: 12,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.grey,
                                            ),
                                            SizedBox(width: 6.w),
                                            CustomText(
                                              text: 'Mileage',
                                              fontsize: 14,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.grey,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                // Price
                                CustomText(
                                  text:
                                      '\$${product['price'].toStringAsFixed(2)}',
                                  fontsize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green,
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }

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
            height: 380.h,
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
                SizedBox(height: 16.h),
                CustomButton(
                  borderRadius: 30,
                  buttonColor: Colors.blue,
                  onTap: () {
                    // Get.toNamed(RouteConstants.bankconnectionpage);
                  },
                  buttonText: "View Sales History",
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
}
