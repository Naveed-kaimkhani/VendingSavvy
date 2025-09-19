import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show LengthLimitingTextInputFormatter;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vendingsavvy/constant/route_constants.dart';
import 'package:vendingsavvy/custom_widgets/custom_text.dart';
import 'package:vendingsavvy/custom_widgets/customtextfield.dart'
    show CustomTextField;

class VendingsavingaddressScreen extends StatefulWidget {
  const VendingsavingaddressScreen({super.key});

  @override
  State<VendingsavingaddressScreen> createState() =>
      _VendingsavingaddressScreenState();
}

class _VendingsavingaddressScreenState
    extends State<VendingsavingaddressScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController customerNumberController =
      TextEditingController();
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailPhoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController salesTaxController = TextEditingController();
  final TextEditingController rentController = TextEditingController();
  final TextEditingController breakcontroller = TextEditingController();

  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController commissionController = TextEditingController();
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;
  String? _passwordError;

  @override
  void dispose() {
    customerNumberController.dispose();
    fullNameController.dispose();
    emailPhoneController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  void _validatePassword(String value) {
    setState(() {
      _passwordError = null;
      if (value.length < 8) {
        _passwordError = "Minimum 8 characters";
      } else if (!RegExp(r'[0-9]').hasMatch(value)) {
        _passwordError = "At least 1 number (1-9)";
      } else if (!RegExp(r'[a-zA-Z]').hasMatch(value)) {
        _passwordError = "At least 1 lowercase or uppercase letter";
      }
    });
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
                  text: "Vending Machines’\nAddresses",
                  fontsize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(height: 16.h),
                CustomText(
                  text: "Cotton Candy Machine 1",
                  fontsize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(height: 16.h),
                CustomText(
                  text: "Location Name",
                  fontsize: 12.0,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(height: 6.h),
                CustomTextField(
                  hintText: "Enter Location Name",
                  fontSize: 14,
                  textEditingController: customerNumberController,
                  filled: true,
                  fillColor: Colors.grey[200],
                  prefixIcon: Icon(Icons.person),
                  borderRadius: BorderRadius.circular(8.0),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter customer number";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 12.h),
                CustomText(
                  text: "Mileage",
                  fontsize: 14.0,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(height: 6.h),
                CustomTextField(
                  hintText: "Enter Mileage",
                  textEditingController: fullNameController,
                  filled: true,
                  fontSize: 14,
                  fillColor: Colors.grey[200],
                  prefixIcon: Icon(Icons.gas_meter),
                  borderRadius: BorderRadius.circular(8.0),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter mileage";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 12.h),
                CustomText(
                  text: "Street",
                  fontsize: 12.0,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(height: 6.h),
                CustomTextField(
                  hintText: "Enter Street",
                  fontSize: 14,
                  textEditingController: fullNameController,
                  filled: true,
                  fillColor: Colors.grey[200],
                  prefixIcon: Icon(Icons.home),
                  borderRadius: BorderRadius.circular(8.0),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter street";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 12.h),
                CustomText(
                  text: "City",
                  fontsize: 12.0,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(height: 6.h),
                CustomTextField(
                  hintText: "Enter City",
                  fontSize: 14,
                  textEditingController: fullNameController,
                  filled: true,
                  fillColor: Colors.grey[200],
                  prefixIcon: Icon(Icons.location_city),
                  borderRadius: BorderRadius.circular(8.0),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter city";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 12.h),
                CustomText(
                  text: "State",
                  fontsize: 12.0,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(height: 6.h),
                CustomTextField(
                  hintText: "Enter State",
                  fontSize: 14,
                  textEditingController: fullNameController,
                  filled: true,
                  fillColor: Colors.grey[200],
                  prefixIcon: Icon(Icons.home_filled),
                  borderRadius: BorderRadius.circular(8.0),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter state";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 12.h),
                CustomText(
                  text: "Zip Code",
                  fontsize: 12.0,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(height: 6.h),
                CustomTextField(
                  hintText: "Enter Zip Code",
                  fontSize: 14,
                  textEditingController: fullNameController,
                  filled: true,
                  fillColor: Colors.grey[200],
                  prefixIcon: Icon(Icons.code),
                  borderRadius: BorderRadius.circular(8.0),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter zip code";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 12.h),
                CustomText(
                  text: "Commission",
                  fontsize: 12.0,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(height: 4.h),
                CustomTextField(
                  hintText: "Total Commission",
                  textEditingController: commissionController,
                  filled: true,
                  fillColor: Colors.grey[200],
                  prefixIcon: null,

                  borderRadius: BorderRadius.circular(8.0),
                  keyboardType: TextInputType.number,
                  textInputFormattors: [
                    LengthLimitingTextInputFormatter(5), // Limit to 5 digits
                  ],
                  suffixIcon: Container(
                    height: 35.h,
                    width: 35.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Color(0xffF3F4F6),
                    ),
                    child: Center(
                      child: Text("%", style: TextStyle(fontSize: 14.sp)),
                    ),
                  ), // % suffix
                  fontSize: 14,
                  hintTextColor: Colors.grey,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter commission";
                    }
                    final numValue = num.tryParse(value);
                    if (numValue == null || numValue < 0 || numValue > 100) {
                      return "Enter a valid percentage (0-100)";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 12.h),
                CustomText(
                  text: "Sales Tax",
                  fontsize: 12.0,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(height: 4.h),
                CustomTextField(
                  hintText: "324",

                  textEditingController: salesTaxController,
                  filled: true,
                  fillColor: Colors.grey[200],
                  prefixIcon: null,
                  borderRadius: BorderRadius.circular(8.0),
                  keyboardType: TextInputType.number,
                  textInputFormattors: [
                    LengthLimitingTextInputFormatter(5), // Limit to 5 digits
                  ],
                  suffixIcon: Container(
                    height: 35.h,
                    width: 35.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Color(0xffF3F4F6),
                    ),
                    child: Center(
                      child: Text("%", style: TextStyle(fontSize: 14.sp)),
                    ),
                  ), // suffix
                  fontSize: 14,
                  hintTextColor: Colors.grey,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter sales tax";
                    }
                    final numValue = num.tryParse(value);
                    if (numValue == null || numValue < 0 || numValue > 100) {
                      return "Enter a valid percentage (0-100)";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 12.h),
                CustomText(
                  text: "Rent",
                  fontsize: 12.0,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(height: 4.h),
                CustomTextField(
                  hintText: "Total Rent",
                  textEditingController: rentController,
                  filled: true,
                  fillColor: Colors.grey[200],
                  borderRadius: BorderRadius.circular(8.0),
                  keyboardType: TextInputType.number,
                  textInputFormattors: [
                    LengthLimitingTextInputFormatter(10), // Limit to 10 digits
                  ],
                  fontSize: 14,
                  suffixIcon: Container(
                    height: 35.h,
                    width: 35.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Color(0xffF3F4F6),
                    ),
                    child: Center(
                      child: Text("\$", style: TextStyle(fontSize: 14.sp)),
                    ),
                  ), // % s
                  hintTextColor: Colors.grey,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter rent";
                    }
                    final numValue = num.tryParse(value);
                    if (numValue == null || numValue < 0) {
                      return "Enter a valid amount";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 12.h),
                CustomText(
                  text: "Breakeven Amount",
                  fontsize: 12.0,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(height: 4.h),
                CustomTextField(
                  hintText: "Breakeven Amount",
                  textEditingController: breakcontroller,
                  filled: true,

                  fillColor: Colors.grey[200],
                  borderRadius: BorderRadius.circular(8.0),
                  keyboardType: TextInputType.number,
                  textInputFormattors: [
                    LengthLimitingTextInputFormatter(10), // Limit to 10 digits
                  ],
                  fontSize: 14,
                  suffixIcon: Container(
                    height: 35.h,
                    width: 35.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Color(0xffF3F4F6),
                    ),
                    child: Center(
                      child: Text("\$", style: TextStyle(fontSize: 14.sp)),
                    ),
                  ), // % s
                  hintTextColor: Colors.grey,

                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter Breakeven Amount";
                    }
                    final numValue = num.tryParse(value);
                    if (numValue == null || numValue < 0) {
                      return "Enter a valid Breakeven Amount";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.h),
                CustomText(
                  text: "Cotton Candy Machine 2",
                  fontsize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(height: 16.h),
                SizedBox(height: 16.h),
                CustomText(
                  text: "Location Name",
                  fontsize: 12.0,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(height: 6.h),
                CustomTextField(
                  hintText: "Enter Location Name",
                  fontSize: 14,
                  textEditingController: customerNumberController,
                  filled: true,
                  fillColor: Colors.grey[200],
                  prefixIcon: Icon(Icons.person),
                  borderRadius: BorderRadius.circular(8.0),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter customer number";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 12.h),
                CustomText(
                  text: "Mileage",
                  fontsize: 14.0,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(height: 6.h),
                CustomTextField(
                  hintText: "Enter Mileage",
                  textEditingController: fullNameController,
                  filled: true,
                  fontSize: 14,
                  fillColor: Colors.grey[200],
                  prefixIcon: Icon(Icons.gas_meter),
                  borderRadius: BorderRadius.circular(8.0),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter mileage";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 12.h),
                CustomText(
                  text: "Street",
                  fontsize: 12.0,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(height: 6.h),
                CustomTextField(
                  hintText: "Enter Street",
                  fontSize: 14,
                  textEditingController: fullNameController,
                  filled: true,
                  fillColor: Colors.grey[200],
                  prefixIcon: Icon(Icons.home),
                  borderRadius: BorderRadius.circular(8.0),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter street";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 12.h),
                CustomText(
                  text: "City",
                  fontsize: 12.0,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(height: 6.h),
                CustomTextField(
                  hintText: "Enter City",
                  fontSize: 14,
                  textEditingController: fullNameController,
                  filled: true,
                  fillColor: Colors.grey[200],
                  prefixIcon: Icon(Icons.location_city),
                  borderRadius: BorderRadius.circular(8.0),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter city";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 12.h),
                CustomText(
                  text: "State",
                  fontsize: 12.0,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(height: 6.h),
                CustomTextField(
                  hintText: "Enter State",
                  fontSize: 14,
                  textEditingController: fullNameController,
                  filled: true,
                  fillColor: Colors.grey[200],
                  prefixIcon: Icon(Icons.home_filled),
                  borderRadius: BorderRadius.circular(8.0),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter state";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 12.h),
                CustomText(
                  text: "Zip Code",
                  fontsize: 12.0,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(height: 6.h),
                CustomTextField(
                  hintText: "Enter Zip Code",
                  fontSize: 14,
                  textEditingController: fullNameController,
                  filled: true,
                  fillColor: Colors.grey[200],
                  prefixIcon: Icon(Icons.code),
                  borderRadius: BorderRadius.circular(8.0),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter zip code";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 12.h),
                CustomText(
                  text: "Commission",
                  fontsize: 12.0,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(height: 4.h),
                CustomTextField(
                  hintText: "Total Commission",
                  textEditingController: commissionController,
                  filled: true,
                  fillColor: Colors.grey[200],
                  prefixIcon: null,
                  borderRadius: BorderRadius.circular(8.0),
                  keyboardType: TextInputType.number,
                  textInputFormattors: [
                    LengthLimitingTextInputFormatter(5), // Limit to 5 digits
                  ],
                  suffixIcon: Container(
                    height: 35.h,
                    width: 35.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Color(0xffF3F4F6),
                    ),
                    child: Center(
                      child: Text("%", style: TextStyle(fontSize: 14.sp)),
                    ),
                  ), // % suffix
                  fontSize: 14,
                  hintTextColor: Colors.grey,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter commission";
                    }
                    final numValue = num.tryParse(value);
                    if (numValue == null || numValue < 0 || numValue > 100) {
                      return "Enter a valid percentage (0-100)";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 12.h),
                CustomText(
                  text: "Sales Tax",
                  fontsize: 12.0,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(height: 4.h),
                CustomTextField(
                  hintText: "324",

                  textEditingController: salesTaxController,
                  filled: true,
                  fillColor: Colors.grey[200],
                  prefixIcon: null,
                  borderRadius: BorderRadius.circular(8.0),
                  keyboardType: TextInputType.number,
                  textInputFormattors: [
                    LengthLimitingTextInputFormatter(5), // Limit to 5 digits
                  ],
                  suffixIcon: Container(
                    height: 35.h,
                    width: 35.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Color(0xffF3F4F6),
                    ),
                    child: Center(
                      child: Text("%", style: TextStyle(fontSize: 14.sp)),
                    ),
                  ), // suffix
                  fontSize: 14,
                  hintTextColor: Colors.grey,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter sales tax";
                    }
                    final numValue = num.tryParse(value);
                    if (numValue == null || numValue < 0 || numValue > 100) {
                      return "Enter a valid percentage (0-100)";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 12.h),
                CustomText(
                  text: "Rent",
                  fontsize: 12.0,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(height: 4.h),
                CustomTextField(
                  hintText: "Total Rent",
                  textEditingController: rentController,
                  filled: true,
                  fillColor: Colors.grey[200],
                  borderRadius: BorderRadius.circular(8.0),
                  keyboardType: TextInputType.number,
                  textInputFormattors: [
                    LengthLimitingTextInputFormatter(10), // Limit to 10 digits
                  ],
                  fontSize: 14,
                  suffixIcon: Container(
                    height: 35.h,
                    width: 35.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Color(0xffF3F4F6),
                    ),
                    child: Center(
                      child: Text("\$", style: TextStyle(fontSize: 14.sp)),
                    ),
                  ), // % s
                  hintTextColor: Colors.grey,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter rent";
                    }
                    final numValue = num.tryParse(value);
                    if (numValue == null || numValue < 0) {
                      return "Enter a valid amount";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 12.h),
                CustomText(
                  text: "Breakeven Amount",
                  fontsize: 12.0,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(height: 4.h),
                CustomTextField(
                  hintText: "Breakeven Amount",
                  textEditingController: breakcontroller,
                  filled: true,

                  fillColor: Colors.grey[200],
                  borderRadius: BorderRadius.circular(8.0),
                  keyboardType: TextInputType.number,
                  textInputFormattors: [
                    LengthLimitingTextInputFormatter(10), // Limit to 10 digits
                  ],
                  fontSize: 14,
                  suffixIcon: Container(
                    height: 35.h,
                    width: 35.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Color(0xffF3F4F6),
                    ),
                    child: Center(
                      child: Text("\$", style: TextStyle(fontSize: 14.sp)),
                    ),
                  ), // % s
                  hintTextColor: Colors.grey,

                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter Breakeven Amount";
                    }
                    final numValue = num.tryParse(value);
                    if (numValue == null || numValue < 0) {
                      return "Enter a valid Breakeven Amount";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.h),
                CustomText(
                  text: "Other Machine 1",
                  fontsize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(height: 16.h),
                SizedBox(height: 16.h),
                CustomText(
                  text: "Location Name",
                  fontsize: 12.0,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(height: 6.h),
                CustomTextField(
                  hintText: "Enter Location Name",
                  fontSize: 14,
                  textEditingController: customerNumberController,
                  filled: true,
                  fillColor: Colors.grey[200],
                  prefixIcon: Icon(Icons.person),
                  borderRadius: BorderRadius.circular(8.0),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter customer number";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 12.h),
                CustomText(
                  text: "Mileage",
                  fontsize: 14.0,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(height: 6.h),
                CustomTextField(
                  hintText: "Enter Mileage",
                  textEditingController: fullNameController,
                  filled: true,
                  fontSize: 14,
                  fillColor: Colors.grey[200],
                  prefixIcon: Icon(Icons.gas_meter),
                  borderRadius: BorderRadius.circular(8.0),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter mileage";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 12.h),
                CustomText(
                  text: "Street",
                  fontsize: 12.0,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(height: 6.h),
                CustomTextField(
                  hintText: "Enter Street",
                  fontSize: 14,
                  textEditingController: fullNameController,
                  filled: true,
                  fillColor: Colors.grey[200],
                  prefixIcon: Icon(Icons.home),
                  borderRadius: BorderRadius.circular(8.0),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter street";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 12.h),
                CustomText(
                  text: "City",
                  fontsize: 12.0,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(height: 6.h),
                CustomTextField(
                  hintText: "Enter City",
                  fontSize: 14,
                  textEditingController: fullNameController,
                  filled: true,
                  fillColor: Colors.grey[200],
                  prefixIcon: Icon(Icons.location_city),
                  borderRadius: BorderRadius.circular(8.0),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter city";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 12.h),
                CustomText(
                  text: "State",
                  fontsize: 12.0,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(height: 6.h),
                CustomTextField(
                  hintText: "Enter State",
                  fontSize: 14,
                  textEditingController: fullNameController,
                  filled: true,
                  fillColor: Colors.grey[200],
                  prefixIcon: Icon(Icons.home_filled),
                  borderRadius: BorderRadius.circular(8.0),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter state";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 12.h),
                CustomText(
                  text: "Commission",
                  fontsize: 12.0,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(height: 4.h),
                CustomTextField(
                  hintText: "Total Commission",
                  textEditingController: commissionController,
                  filled: true,
                  fillColor: Colors.grey[200],
                  prefixIcon: null,
                  borderRadius: BorderRadius.circular(8.0),
                  keyboardType: TextInputType.number,
                  textInputFormattors: [
                    LengthLimitingTextInputFormatter(5), // Limit to 5 digits
                  ],
                  suffixIcon: Container(
                    height: 35.h,
                    width: 35.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Color(0xffF3F4F6),
                    ),
                    child: Center(
                      child: Text("%", style: TextStyle(fontSize: 14.sp)),
                    ),
                  ), // % suffix
                  fontSize: 14,
                  hintTextColor: Colors.grey,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter commission";
                    }
                    final numValue = num.tryParse(value);
                    if (numValue == null || numValue < 0 || numValue > 100) {
                      return "Enter a valid percentage (0-100)";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 12.h),
                CustomText(
                  text: "Sales Tax",
                  fontsize: 12.0,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(height: 4.h),
                CustomTextField(
                  hintText: "324",

                  textEditingController: salesTaxController,
                  filled: true,
                  fillColor: Colors.grey[200],
                  prefixIcon: null,
                  borderRadius: BorderRadius.circular(8.0),
                  keyboardType: TextInputType.number,
                  textInputFormattors: [
                    LengthLimitingTextInputFormatter(5), // Limit to 5 digits
                  ],
                  suffixIcon: Container(
                    height: 35.h,
                    width: 35.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Color(0xffF3F4F6),
                    ),
                    child: Center(
                      child: Text("%", style: TextStyle(fontSize: 14.sp)),
                    ),
                  ), // suffix
                  fontSize: 14,
                  hintTextColor: Colors.grey,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter sales tax";
                    }
                    final numValue = num.tryParse(value);
                    if (numValue == null || numValue < 0 || numValue > 100) {
                      return "Enter a valid percentage (0-100)";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 12.h),
                CustomText(
                  text: "Rent",
                  fontsize: 12.0,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(height: 4.h),
                CustomTextField(
                  hintText: "Total Rent",
                  textEditingController: rentController,
                  filled: true,
                  fillColor: Colors.grey[200],
                  borderRadius: BorderRadius.circular(8.0),
                  keyboardType: TextInputType.number,
                  textInputFormattors: [
                    LengthLimitingTextInputFormatter(10), // Limit to 10 digits
                  ],
                  fontSize: 14,
                  suffixIcon: Container(
                    height: 35.h,
                    width: 35.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Color(0xffF3F4F6),
                    ),
                    child: Center(
                      child: Text("\$", style: TextStyle(fontSize: 14.sp)),
                    ),
                  ), // % s
                  hintTextColor: Colors.grey,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter rent";
                    }
                    final numValue = num.tryParse(value);
                    if (numValue == null || numValue < 0) {
                      return "Enter a valid amount";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 12.h),
                CustomText(
                  text: "Breakeven Amount",
                  fontsize: 12.0,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(height: 4.h),
                CustomTextField(
                  hintText: "Breakeven Amount",
                  textEditingController: breakcontroller,
                  filled: true,

                  fillColor: Colors.grey[200],
                  borderRadius: BorderRadius.circular(8.0),
                  keyboardType: TextInputType.number,
                  textInputFormattors: [
                    LengthLimitingTextInputFormatter(10), // Limit to 10 digits
                  ],
                  fontSize: 14,
                  suffixIcon: Container(
                    height: 35.h,
                    width: 35.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Color(0xffF3F4F6),
                    ),
                    child: Center(
                      child: Text("\$", style: TextStyle(fontSize: 14.sp)),
                    ),
                  ), // % s
                  hintTextColor: Colors.grey,

                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter Breakeven Amount";
                    }
                    final numValue = num.tryParse(value);
                    if (numValue == null || numValue < 0) {
                      return "Enter a valid Breakeven Amount";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 12.h),
                CustomText(
                  text: "Zip Code",
                  fontsize: 12.0,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(height: 6.h),
                CustomTextField(
                  hintText: "Enter Zip Code",
                  fontSize: 14,
                  textEditingController: fullNameController,
                  filled: true,
                  fillColor: Colors.grey[200],
                  prefixIcon: Icon(Icons.code),
                  borderRadius: BorderRadius.circular(8.0),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter zip code";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.h),
                ElevatedButton(
                  onPressed: () {
                    Get.toNamed(RouteConstants.dashboard);
                    // if (_formKey.currentState!.validate()) {
                    // Handle next button action
                    // }
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
