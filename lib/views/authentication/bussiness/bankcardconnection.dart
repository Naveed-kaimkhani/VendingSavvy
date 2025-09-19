import 'package:fl_chart/fl_chart.dart'
    show
        PieTouchData,
        FlTouchEvent,
        PieChart,
        PieChartSectionData,
        PieChartData;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vendingsavvy/custom_widgets/custom_button.dart'
    show CustomButton;
import 'package:vendingsavvy/custom_widgets/custom_text.dart' show CustomText;
import 'package:vendingsavvy/utils/app_colors.dart';
import 'package:vendingsavvy/utils/app_fonts.dart';
import '../../../constant/route_constants.dart';

class BankCardConnection extends StatefulWidget {
  const BankCardConnection({super.key});

  @override
  State<BankCardConnection> createState() => _BankCardConnectionState();
}

class _BankCardConnectionState extends State<BankCardConnection>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool _hasAnimated = false;
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
  late String _selectedLocation;
  double getTotalValue() {
    return pieChartSections
        .map((section) => section.value)
        .reduce((a, b) => a + b);
  }

  final RxList<Map<String, dynamic>> locations = RxList<Map<String, dynamic>>([
    {'name': 'Location 1', 'id': 'loc1'},
    {'name': 'Location 2', 'id': 'loc2'},
    {'name': 'Location 3', 'id': 'loc3'},
    {'name': 'Location 4', 'id': 'loc4'},
  ]);

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
          "Bank Card Management",
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Vertical Add Card/Bank Button
                    Container(
                      height: 170.h,
                      margin: const EdgeInsets.all(10),
                      child: RotatedBox(
                        quarterTurns: 1,
                        child: OutlinedButton(
                          onPressed: () {},
                          style: OutlinedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            side: const BorderSide(color: Colors.blue),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: const [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Add Card/Bank",
                                    style: TextStyle(color: Colors.white),
                                  ),

                                  Icon(Icons.add, color: Colors.white),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    // Horizontally Scrollable Card Details
                    Expanded(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            // First Mastercard Card
                            Container(
                              height: 170.h,
                              margin: const EdgeInsets.all(10),
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Color(0xfffd9552),
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Switch(
                                        value: true,
                                        onChanged: (value) {},
                                      ),
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
                                  CustomText(
                                    text: "Exp 11/25",
                                    fontsize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                            ),
                            // Second Mastercard Card
                            Container(
                              height: 170.h,
                              margin: const EdgeInsets.all(10),
                              padding: const EdgeInsets.all(10),
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Switch(
                                        value: true,
                                        onChanged: (value) {},
                                      ),
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
                                  CustomText(
                                    text: "Exp 11/25",
                                    fontsize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            // next section
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20, top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        text: "Total",
                        fontsize: 14,

                        fontWeight: FontWeight.w500,
                        color: AppColors.APP_GRAY_COLOR,
                      ),
                      CustomButton(
                        height: 30.h,
                        borderRadius: 30,

                        buttonColor: AppColors.lightBlueAppColor,
                        onTap: () {
                          Get.toNamed(RouteConstants.widthdrawehistory);
                        },
                        buttonText: "Withdrawal History",
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        textColor: Colors.blue,
                        width: 200.w,
                        fontFamily: AppFonts.interRegular,
                      ),
                    ],
                  ),

                  CustomText(
                    text: "\$1,549.00",
                    fontsize: 30,

                    fontWeight: FontWeight.bold,
                    // color: AppColors.bl,
                  ),
                  SizedBox(height: 12.h),
                  Row(
                    // mainAxisAlignment: M,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Color(0xfff3f4fc),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        height: 30.h,
                        width: 120.w,
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 10.h,
                                width: 10.w,
                                decoration: BoxDecoration(
                                  color: AppColors.BUTTON_COLOR,
                                ),
                              ),
                              SizedBox(width: 4.w),
                              CustomText(
                                text: "Total Income",
                                fontsize: 14,

                                fontWeight: FontWeight.w400,
                                // color: AppColors.bl,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Color(0xfff3f4fc),
                          ),
                          height: 30.h,
                          width: 190.w,
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 10.h,
                                  width: 10.w,
                                  decoration: BoxDecoration(
                                    color: Color(0xffbb38f6),
                                  ),
                                ),
                                SizedBox(width: 4.w),
                                CustomText(
                                  text: "Withdrawable Balance",
                                  fontsize: 14,

                                  fontWeight: FontWeight.w400,
                                  // color: AppColors.bl,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12.h),
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Color(0xfff3f4fc),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        height: 30.h,
                        width: 150.w,
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 10.h,
                                width: 10.w,
                                decoration: BoxDecoration(color: Colors.blue),
                              ),
                              SizedBox(width: 4.w),
                              CustomText(
                                text: "Pending payouts",
                                fontsize: 14,

                                fontWeight: FontWeight.w400,
                                // color: AppColors.bl,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
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
                              sectionsSpace: 15,
                              centerSpaceRadius: 25,
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
                        left: -20.w,
                        top: 80.h,
                        child: _buildLabel(
                          'Withdrawable: 150',
                          Color(0xFF9C27B0),
                        ),
                      ),
                      Positioned(
                        right: -20.w,
                        top: 20.h,
                        child: _buildLabel(
                          'Income: \$200.00',
                          Color(0xFF4CAF50),
                        ),
                      ),
                      Positioned(
                        right: -20.w,
                        bottom: 20.h,
                        child: _buildLabel(
                          'Pending: \$80.50',
                          Color(0xFF2196F3),
                        ),
                      ),
                    ],
                  ),
                  CustomButton(
                    // height: 30.h,
                    borderRadius: 30,

                    buttonColor: Colors.blue,
                    onTap: () {
                      Get.toNamed(RouteConstants.bankconnectionpage);
                    },
                    buttonText: "Withdrawal Amount",
                    fontSize: 12.sp,
                    fontWeight: FontWeight.bold,
                    textColor: Colors.white,
                    width: Get.width,
                    fontFamily: AppFonts.interRegular,
                  ),
                  SizedBox(height: 40.h),
                ],
              ),
            ),
          ],
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
