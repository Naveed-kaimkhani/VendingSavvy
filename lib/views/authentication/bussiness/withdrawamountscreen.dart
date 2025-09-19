import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vendingsavvy/constant/route_constants.dart';

class Withdrawamountscreen extends StatefulWidget {
  const Withdrawamountscreen({super.key});

  @override
  State<Withdrawamountscreen> createState() => _WithdrawamountscreenState();
}

class _WithdrawamountscreenState extends State<Withdrawamountscreen> {
  final TextEditingController _amountController = TextEditingController();
  String? _selectedCard; // For dropdown selection
  double? _selectedSuggestion; // Track selected suggestion amount
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
  List<double> suggestedAmounts = [
    50.0,
    100.0,
    200.0,
    300.0,
    500.0,
  ]; // Dynamic suggestions

  @override
  void dispose() {
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Withdrawal Amount",
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
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Enter Amount Section (Larger Direct TextField)
            Container(
              padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 15.w),
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
                        hintText: 'Enter Amount',
                        border: InputBorder.none,
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                      style: TextStyle(fontSize: 18.sp, color: Colors.black),
                    ),
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
            SizedBox(height: 20.h),

            // Suggested Amounts Section with Highlighted Selection
            Wrap(
              spacing: 10.w,
              runSpacing: 10.h,
              crossAxisAlignment: WrapCrossAlignment.end,
              children: suggestedAmounts.map((amount) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _amountController.text = amount.toStringAsFixed(2);
                      _selectedSuggestion =
                          amount; // Update selected suggestion
                    });
                  },
                  child: Chip(
                    label: Text(
                      '\$${amount.toStringAsFixed(2)}',
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: _selectedSuggestion == amount
                            ? Colors.white
                            : Colors.black, // Text color changes
                      ),
                    ),
                    backgroundColor: _selectedSuggestion == amount
                        ? Colors.blue
                        : Colors.white, // Background color changes
                  ),
                );
              }).toList(),
            ),
            const Spacer(),

            // Withdraw Button
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Get.toNamed(RouteConstants.withdrawconfirmation);
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 50.h),
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
      ),
    );
  }
}
