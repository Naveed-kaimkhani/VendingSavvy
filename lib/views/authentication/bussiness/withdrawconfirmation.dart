import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vendingsavvy/constant/route_constants.dart';
import 'package:vendingsavvy/custom_widgets/custom_text.dart';

class Withdrawconfirmation extends StatefulWidget {
  const Withdrawconfirmation({super.key});

  @override
  State<Withdrawconfirmation> createState() => _WithdrawconfirmationState();
}

class _WithdrawconfirmationState extends State<Withdrawconfirmation> {
  String? _selectedCard; // For dropdown selection
  final TextEditingController _amountController = TextEditingController();
  List<Map<String, dynamic>> cardOptions = [
    {
      'image': 'assets/images/Card.png',
      'title': 'Mastercard ****1234',
      'price': '\$52.30',
    },
    {
      'image': 'assets/images/Card.png',
      'title': 'Visa ****5678',
      'price': '\$100.00',
    },
    {
      'image': 'assets/images/Card.png',
      'title': 'American Express ****9012',
      'price': '\$75.50',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Withdrawal Confirmation",
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
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 170.h,
              // margin: const EdgeInsets.all(10),
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
                  CustomText(
                    text: "Exp 11/25",
                    fontsize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.h),
            // Dropdown for Additional Card Selection
            DropdownButton<String>(
              hint: const Text('Select another card'),
              value: _selectedCard,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedCard = newValue;
                });
              },
              items: cardOptions.map<DropdownMenuItem<String>>((card) {
                return DropdownMenuItem<String>(
                  value: card['title'],
                  child: Row(
                    children: [
                      Image.asset(card['image']!, width: 30.w, height: 30.h),
                      SizedBox(width: 10.w),
                      Text(card['title']!),
                    ],
                  ),
                );
              }).toList(),
              isExpanded: true,
              underline: const SizedBox(),
            ),
            SizedBox(height: 3.h),
            CustomText(
              text: "Total amount",
              fontsize: 14,
              fontWeight: FontWeight.w400,
            ),
            SizedBox(height: 8.h),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(12),
                // color: Colors.grey[100],
              ),
              child: Row(
                children: [
                  const Text(
                    '\$',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      // color: Colors.grey,
                    ),
                  ),
                  SizedBox(width: 12.w),

                  Expanded(
                    child: TextField(
                      controller: _amountController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        hintText: '60,200',
                        border: InputBorder.none,
                        hintStyle: TextStyle(color: Colors.black),
                      ),
                      style: TextStyle(fontSize: 18.sp, color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
            // Withdraw Button
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Get.toNamed(RouteConstants.successscreen);
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 50.h),
                  backgroundColor: Colors.blue,
                ),
                child: const Text(
                  'Confirm',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
