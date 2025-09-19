import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart'; // For date formatting
import 'package:vendingsavvy/constant/route_constants.dart';
import 'package:vendingsavvy/custom_widgets/custom_text.dart';
import 'package:vendingsavvy/custom_widgets/customtextfield.dart'
    show CustomTextField;

class Addnewcard extends StatefulWidget {
  const Addnewcard({super.key});

  @override
  State<Addnewcard> createState() => _AddnewcardState();
}

class _AddnewcardState extends State<Addnewcard> {
  final TextEditingController _cardholderController = TextEditingController();
  final TextEditingController _expiryController = TextEditingController();
  final TextEditingController _cvcController = TextEditingController();
  final TextEditingController _cardNumberController = TextEditingController();

  @override
  void dispose() {
    _cardholderController.dispose();
    _expiryController.dispose();
    _cvcController.dispose();
    _cardNumberController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        _expiryController.text = DateFormat('MM/yy').format(picked);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: "Add New Card",
          fontsize: 20.00,
          fontWeight: FontWeight.w400,
        ),
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: const Icon(Icons.arrow_back),
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Cardholder Name
              CustomText(
                text: "Cardholder Name",
                fontsize: 14.0,
                fontWeight: FontWeight.w400,
              ),
              SizedBox(height: 8.h),
              CustomTextField(
                hintText: "Cardholder Name",
                textEditingController: _cardholderController,
                keyboardType: TextInputType.text,
              ),
              SizedBox(height: 20.h),

              // Expiry Date and CVC in Row
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          text: "Expiry Date",
                          fontsize: 14.0,
                          fontWeight: FontWeight.w400,
                        ),
                        SizedBox(height: 6.h),
                        CustomTextField(
                          hintText: "Expiry Date (MM/YY)",
                          textEditingController: _expiryController,
                          keyboardType: TextInputType.datetime,
                          onTap: () => _selectDate(context),
                          suffixIcon: const Icon(
                            Icons.calendar_today,
                            size: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 16.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          text: "CVC",
                          fontsize: 14.0,
                          fontWeight: FontWeight.w400,
                        ),
                        SizedBox(height: 8.h),
                        CustomTextField(
                          hintText: "CVC",
                          textEditingController: _cvcController,
                          keyboardType: TextInputType.number,
                          textInputFormattors: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(4),
                          ],
                          suffixIcon: const Icon(Icons.lock, size: 18),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              CustomText(
                text: "Card Number",
                fontsize: 14.0,
                fontWeight: FontWeight.w400,
              ),
              SizedBox(height: 8.h),
              // Card Number
              CustomTextField(
                hintText: "Card Number",
                textEditingController: _cardNumberController,
                keyboardType: TextInputType.number,
                textInputFormattors: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(16),
                ],
                suffixIcon: Image.asset("assets/images/cardicon.png"),
              ),
              SizedBox(height: 50.h),
              // Confirm Button
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Get.toNamed(RouteConstants.verifyscreen);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    minimumSize: Size(double.infinity, 50.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                  ),
                  child: CustomText(
                    text: "Confirm",
                    color: Colors.white,
                    fontsize: 16.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
