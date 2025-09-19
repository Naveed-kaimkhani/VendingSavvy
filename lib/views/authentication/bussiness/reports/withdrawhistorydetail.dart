import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vendingsavvy/custom_widgets/custom_text.dart' show CustomText;

class Withdrawhistorydetail extends StatelessWidget {
  const Withdrawhistorydetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: CustomText(
          text: "Withdrawal History",
          fontsize: 20.0,
          fontWeight: FontWeight.w600,
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
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Centered Image
              Image.asset(
                'assets/images/img.png', // Replace with your image path
                height: 150,
                width: 150,
              ),
              SizedBox(height: 20),
              // Price
              CustomText(
                text: "\$50.00",
                fontsize: 32.0,
                fontWeight: FontWeight.bold,
              ),
              SizedBox(height: 10),
              // Subtitle
              CustomText(
                text: "Below is your Withdrawal summary",
                fontsize: 14.0,
                fontWeight: FontWeight.w400,
                color: Colors.grey,
              ),
              SizedBox(height: 20),
              // Details List
              _buildDetailItem("Card", "Mastercard"),
              _buildDetailItem("Account Number", "1111 1111 1111 1111"),
              _buildDetailItem(
                "Status",
                "Completed",
                valueColor: Colors.green, // Match the orange status color
              ),
              _buildDetailItem("Date", "Aug 19, 2021"),
              _buildDetailItem("Time", "10:34 PM"),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetailItem(String title, String value, {Color? valueColor}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomText(
            text: title,
            fontsize: 14.0,
            fontWeight: FontWeight.w400,
            color: Colors.grey,
          ),
          CustomText(
            text: value,
            fontsize: 14.0,
            fontWeight: FontWeight.w400,
            color:
                valueColor ?? Colors.black, // Default to black unless specified
          ),
        ],
      ),
    );
  }
}
