import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vendingsavvy/constant/route_constants.dart';
import 'package:vendingsavvy/custom_widgets/custom_text.dart';

class Vendingsavvyinformation extends StatefulWidget {
  const Vendingsavvyinformation({super.key});

  @override
  State<Vendingsavvyinformation> createState() =>
      _VendingsavvyinformationState();
}

class _VendingsavvyinformationState extends State<Vendingsavvyinformation> {
  final _formKey = GlobalKey<FormState>();
  String? selectedVendingMachines;
  String? selectedCottonCandyMachines;
  String? selectedOtherMachines;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Icon(Icons.arrow_back),
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 22.0, right: 22.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: "Vending Machines",
                  fontsize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(height: 16.h),
                CustomText(
                  text: "Vending Machines",
                  fontsize: 12.0,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(height: 4.h),
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    hintText: "Total Vending Machines",
                    filled: true,
                    fillColor: Colors.white,
                    hintStyle: TextStyle(
                      fontSize: 12,
                      // color: Colors.grey,
                    ), // Set hint text font size to 12
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  value: selectedVendingMachines,
                  items: ['1', '2', '3', '4', '5', 'More'].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedVendingMachines = newValue;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please select total vending machines";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 12.h),
                CustomText(
                  text: "Cotton Candy Machines",
                  fontsize: 12.0,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(height: 4.h),
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    hintText: "Total Vending Machines",
                    filled: true,
                    hintStyle: TextStyle(
                      fontSize: 12,
                      // color: Colors.grey,
                    ),
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  value: selectedCottonCandyMachines,
                  items: ['1', '2', '3', '4', '5', 'More'].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedCottonCandyMachines = newValue;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please select total vending machines";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 12.h),
                CustomText(
                  text: "Other Machines",
                  fontsize: 12.0,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(height: 4.h),
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    hintText: "Total Vending Machines",
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide.none,
                    ),
                    hintStyle: TextStyle(
                      fontSize: 12,
                      // color: Colors.grey,
                    ),
                  ),
                  value: selectedOtherMachines,
                  items: ['1', '2', '3', '4', '5', 'More'].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedOtherMachines = newValue;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please select total vending machines";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.h),
                ElevatedButton(
                  onPressed: () {
                    // if (_formKey.currentState!.validate()) {
                    //   // Handle next button action
                    // }
                    Get.toNamed(RouteConstants.vendingsavingaddress);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    minimumSize: Size(double.infinity, 50.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                  ),
                  child: CustomText(
                    text: "Next",
                    color: Colors.white,
                    fontsize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                      text: "Don’t have a machine? ",
                      fontsize: 14.0,
                      color: Colors.grey,
                    ),
                    SizedBox(width: 4.0),
                    CustomText(
                      text: "Order One",
                      fontsize: 14.0,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
