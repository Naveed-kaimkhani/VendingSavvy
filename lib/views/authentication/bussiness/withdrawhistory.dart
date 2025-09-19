import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart'; // Added for DateFormat
import 'package:vendingsavvy/constant/route_constants.dart';
import 'package:vendingsavvy/custom_widgets/custom_text.dart' show CustomText;
import 'package:date_picker_plus/date_picker_plus.dart'; // Added date_picker_plus

class Withdrawhistory extends StatefulWidget {
  const Withdrawhistory({super.key});

  @override
  _WithdrawhistoryState createState() => _WithdrawhistoryState();
}

class _WithdrawhistoryState extends State<Withdrawhistory> {
  String selectedTab = 'Week'; // Default tab
  DateTime? startDate;
  DateTime? endDate;
  bool showDateRange = false; // Flag to toggle date range visibility

  // Mock data for withdrawal history
  final List<Map<String, String>> history = [
    {
      'image': 'assets/images/Card.png',
      'title': 'Mastercard',
      'subtitle': 'Date . Time',
      'price': '\$52.30',
      'status': 'Completed',
    },
    {
      'image': 'assets/images/Card.png',
      'title': 'Mastercard',
      'subtitle': 'Date . Time',
      'price': '\$52.30',
      'status': 'Completed',
    },
    {
      'image': 'assets/images/Card.png',
      'title': 'Mastercard',
      'subtitle': 'Date . Time',
      'price': '\$52.30',
      'status': 'Completed',
    },
    {
      'image': 'assets/images/Card.png',
      'title': 'Mastercard',
      'subtitle': 'Date . Time',
      'price': '\$52.30',
      'status': 'Completed',
    },
    {
      'image': 'assets/images/Card.png',
      'title': 'Mastercard',
      'subtitle': 'Date . Time',
      'price': '\$52.30',
      'status': 'Completed',
    },
    {
      'image': 'assets/images/Card.png',
      'title': 'Mastercard',
      'subtitle': 'Date . Time',
      'price': '\$52.30',
      'status': 'Completed',
    },
    {
      'image': 'assets/images/Card.png',
      'title': 'Mastercard',
      'subtitle': 'Date . Time',
      'price': '\$52.30',
      'status': 'Completed',
    },
    {
      'image': 'assets/images/Card.png',
      'title': 'Mastercard',
      'subtitle': 'Date . Time',
      'price': '\$52.30',
      'status': 'Completed',
    },
    {
      'image': 'assets/images/Card.png',
      'title': 'Mastercard',
      'subtitle': 'Date . Time',
      'price': '\$52.30',
      'status': 'Completed',
    },
    {
      'image': 'assets/images/Card.png',
      'title': 'Mastercard',
      'subtitle': 'Date . Time',
      'price': '\$52.30',
      'status': 'Completed',
    },
  ];

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
        title: const Text(
          "Withdrawal History",
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
      body: Column(
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
                              color: selectedTab == 'Month' && !showDateRange
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
          // Withdrawal History List with Date Range Header
          Expanded(
            child: ListView(
              // padding: EdgeInsets.zero,
              children: [
                if (showDateRange && startDate != null && endDate != null)
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Center(
                      child: CustomText(
                        text:
                            '${startDate!.day} ${DateFormat('MMM').format(startDate!)}, ${startDate!.year} – ${endDate!.day} ${DateFormat('MMM').format(endDate!)}, ${endDate!.year}',
                        fontWeight: FontWeight.w400,
                        fontsize: 16,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ListView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: history.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.toNamed(RouteConstants.withdrawdetails);
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(
                              vertical: 8,
                              horizontal: 14,
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset(
                                  history[index]['image']!,
                                  width: 40,
                                  height: 40,
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CustomText(
                                        text: history[index]['title']!,
                                        fontWeight: FontWeight.w400,
                                        fontsize: 14,
                                      ),
                                      SizedBox(height: 2.h),
                                      CustomText(
                                        text: history[index]['subtitle']!,
                                        fontWeight: FontWeight.w400,
                                        fontsize: 12,
                                        color: Colors.grey,
                                      ),
                                    ],
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    CustomText(
                                      text: history[index]['price']!,
                                      fontWeight: FontWeight.w400,
                                      fontsize: 14,
                                    ),
                                    SizedBox(height: 2.h),
                                    CustomText(
                                      text: history[index]['status']!,
                                      fontWeight: FontWeight.w400,
                                      fontsize: 12,
                                      color: Colors.green,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 14.0,
                            right: 14.0,
                          ),
                          child: Divider(
                            color: Colors.grey[300],
                            thickness: 1,
                            height: 1,
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
          // Sticky Withdraw Amount Button
          Container(
            padding: const EdgeInsets.all(10),
            color: Colors.white,
            child: ElevatedButton(
              onPressed: () {
                Get.toNamed(RouteConstants.withdrawamount);
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
                backgroundColor: Colors.blue,
              ),
              child: const Text(
                'Withdraw Amount',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
