import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:image_picker/image_picker.dart';

import 'package:vendingsavvy/constant/appcolors.dart';
import 'package:vendingsavvy/constant/route_constants.dart';
import 'package:vendingsavvy/custom_widgets/custom_text.dart' show CustomText;
import 'package:vendingsavvy/custom_widgets/customtextfield.dart'
    show CustomTextField;

class Addexpense extends StatefulWidget {
  const Addexpense({super.key});

  @override
  State<Addexpense> createState() => _AddexpenseState();
}

class _AddexpenseState extends State<Addexpense>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

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

  String selectedTab = 'Add Expense';
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

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        dateController.text = "${picked.toLocal()}".split(' ')[0];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isAddNowEnabled =
        selectedTab == 'Add Category' && categoryController.text.isNotEmpty;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Add Expense",
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
                                selectedTab = 'Add Expense';
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 40,
                                vertical: 10,
                              ),
                              decoration: BoxDecoration(
                                color: selectedTab == 'Add Expense'
                                    ? Colors.blue
                                    : Colors.grey[200],
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(
                                'Add Expense',
                                style: TextStyle(
                                  color: selectedTab == 'Add Expense'
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedTab = 'Add Category';
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 40,
                                vertical: 10,
                              ),
                              decoration: BoxDecoration(
                                color: selectedTab == 'Add Category'
                                    ? Colors.blue
                                    : Colors.grey[200],
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(
                                'Add Category',
                                style: TextStyle(
                                  color: selectedTab == 'Add Category'
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
              if (selectedTab == 'Add Expense')
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: "Expense Name",
                      fontsize: 14.0,
                      fontWeight: FontWeight.w600,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 4.h),
                    CustomTextField(
                      textEditingController: expenseNameController,
                      hintText: 'Enter expense name',
                      keyboardType: TextInputType.text,
                    ),
                    SizedBox(height: 15.h),
                    CustomText(
                      text: "Category",
                      fontsize: 14.0,
                      fontWeight: FontWeight.w600,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 4.h),
                    DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        hintText: 'Select type',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.r),
                          borderSide: BorderSide(color: AppColors.greyColor),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.r),
                          borderSide: BorderSide(
                            color: AppColors.kPrimaryColor,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.r),
                          borderSide: BorderSide(color: AppColors.greyColor),
                        ),
                      ),
                      value: selectedCategoryType,
                      items: categoryTypes.map((String type) {
                        return DropdownMenuItem<String>(
                          value: type,
                          child: Text(
                            type,
                            style: TextStyle(fontWeight: FontWeight.w400),
                          ),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedCategoryType = newValue;
                        });
                      },
                    ),
                    SizedBox(height: 15.h),
                    CustomText(
                      text: "Select Date",
                      fontsize: 14.0,
                      fontWeight: FontWeight.w600,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 4.h),
                    CustomTextField(
                      textEditingController: dateController,
                      hintText: 'Select date',
                      suffixIcon: HugeIcon(
                        icon: HugeIcons.strokeRoundedCalendar01,
                        size: 22.h,
                        color: AppColors.blackColor,
                      ),
                      onTap: () => _selectDate(context),
                      readyOnly: true,
                    ),
                    SizedBox(height: 15.h),
                    CustomText(
                      text: "Enter Amount",
                      fontsize: 14.0,
                      fontWeight: FontWeight.w600,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 4.h),
                    CustomTextField(
                      textEditingController: amountController,
                      hintText: 'Enter amount',
                      suffixIcon: HugeIcon(
                        icon: HugeIcons.strokeRoundedDollarCircle,
                        size: 22.h,
                        color: AppColors.blackColor,
                      ),
                      keyboardType: TextInputType.number,
                    ),
                    SizedBox(height: 15.h),
                    CustomText(
                      text: "Description",
                      fontsize: 14.0,
                      fontWeight: FontWeight.w600,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 4.h),
                    CustomTextField(
                      textEditingController: descriptionController,
                      hintText: 'Enter description',
                      maxLines: 3,
                      isMultiLine: true,
                    ),
                    SizedBox(height: 20.h),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Get.toNamed(RouteConstants.categorysuccesfull);
                        },
                    
                        style: ElevatedButton.styleFrom(
                          backgroundColor: isAddNowEnabled
                              ? AppColors.kPrimaryColor
                              : Colors.blue,
                          padding: EdgeInsets.symmetric(vertical: 15.h),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                        ),
                        child: Text(
                          'Add Now',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              else if (selectedTab == 'Add Category')
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: "Category Name",
                      fontsize: 14.0,
                      fontWeight: FontWeight.w600,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 4.h),
                    CustomTextField(
                      textEditingController: categoryController,
                      hintText: 'Enter category name',
                      keyboardType: TextInputType.text,
                    ),
                    SizedBox(height: 15.h),
                    CustomText(
                      text: "Category Image",
                      fontsize: 14.0,
                      fontWeight: FontWeight.w600,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 4.h),
                    GestureDetector(
                      // onTap: _selectImage,
                      child: Container(
                        height: 100.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColors.greyColor),
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        child: categoryImage != null
                            ? Image.file(categoryImage!, fit: BoxFit.cover)
                            : Center(
                                child: Image.asset(
                                  "assets/images/galleryimg.png",
                                ),
                              ),
                      ),
                    ),
                    SizedBox(height: 15.h),
                    CustomText(
                      text: "Text",
                      fontsize: 14.0,
                      fontWeight: FontWeight.w600,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 4.h),
                    CustomText(
                      text: "Max size: 5mb, Format: jpg, png",
                      fontsize: 14.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 20.h),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {},
                       
                        style: ElevatedButton.styleFrom(
                          backgroundColor: isAddNowEnabled
                              ? AppColors.kPrimaryColor
                              : Colors.blue,
                          padding: EdgeInsets.symmetric(vertical: 15.h),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                        ),
                        child: Text(
                          'Add Now',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
