import 'package:date_picker_plus/date_picker_plus.dart'
    show showRangePickerDialog, PickerType;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vendingsavvy/custom_widgets/custom_text.dart' show CustomText;

class Breakevenreport extends StatefulWidget {
  const Breakevenreport({super.key});

  @override
  State<Breakevenreport> createState() => _BreakevenreportState();
}

class _BreakevenreportState extends State<Breakevenreport> {
  String selectedTab = 'Month';
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
          text: "Break Even Report",
          fontsize: 20.0,
          fontWeight: FontWeight.w600,
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
        padding: EdgeInsets.all(16.0),
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
                            child: CustomText(
                              text: 'Month',
                              fontsize: 14.0,
                              fontWeight: FontWeight.w400,
                              color: selectedTab == 'Month' && !showDateRange
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedTab = 'Quarter';
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
                              color: selectedTab == 'Quarter' && !showDateRange
                                  ? Colors.blue
                                  : Colors.grey[200],
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: CustomText(
                              text: 'Quarter',
                              fontsize: 14.0,
                              fontWeight: FontWeight.w400,
                              color: selectedTab == 'Quarter' && !showDateRange
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
                            child: CustomText(
                              text: 'Year',
                              fontsize: 14.0,
                              fontWeight: FontWeight.w400,
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
                    icon: const Icon(Icons.calendar_today),
                    onPressed: _showCustomDatePicker,
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.0),
            // Net Earning
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  text: "Metric",
                  fontsize: 16.0,
                  fontWeight: FontWeight.w600,
                ),
                CustomText(
                  text: "Value",
                  fontsize: 16.0,
                  fontWeight: FontWeight.w600,
                ),
              ],
            ),
            SizedBox(height: 20.0),

            // Addition in Cash Section
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildCashItem("Selling Price per Unit", "\$800.00"),
                _buildCashItem("Variable Cost per Unit", "\$400.00"),
                _buildCashItem("Contribution Margin per Unit", "77units"),
                _buildCashItem("Fixed Costs (Monthly)", "\$400.00"),
                _buildCashItem("Profit/ (Loss)", "\$200.00"),
              ],
            ),
            SizedBox(height: 20.0),

            // Subtraction from Cash Section
            SizedBox(height: 10.0),
            _buildCashItem("Margin of Safety ", "500 units (33.3%)"),
          ],
        ),
      ),
    );
  }

  Widget _buildCashItem(String title, String amount) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomText(text: title, fontsize: 14.0, fontWeight: FontWeight.w400),
          CustomText(text: amount, fontsize: 14.0, fontWeight: FontWeight.w400),
        ],
      ),
    );
  }
}
