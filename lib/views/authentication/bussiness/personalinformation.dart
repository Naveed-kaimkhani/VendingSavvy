import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart' show HugeIcon, HugeIcons;
import 'package:vendingsavvy/constant/route_constants.dart';
import 'package:vendingsavvy/custom_widgets/custom_text.dart';
import 'package:vendingsavvy/custom_widgets/customtextfield.dart'
    show CustomTextField;

class Personalinformation extends StatefulWidget {
  const Personalinformation({super.key});

  @override
  State<Personalinformation> createState() => _PersonalinformationState();
}

class _PersonalinformationState extends State<Personalinformation> {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailPhoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;
  String? _passwordError;

  @override
  void dispose() {
    // customerNumberController.dispose();
    fullNameController.dispose();
    emailPhoneController.dispose();
    passwordController.dispose();
    // confirmPasswordController.dispose();
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
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: CustomText(
          text: "Profile Information",
          fontsize: 20.00,
          fontWeight: FontWeight.bold,
        ),
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Icon(Icons.arrow_back),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 40,
                backgroundImage: AssetImage("assets/images/profilepic.png"),
              ),
            ),
            SizedBox(height: 4.h),
            Center(
              child: CustomText(
                text: "Change Picture",
                fontsize: 14.0,
                color: Colors.blueAccent,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 12.h),
            CustomText(
              text: "Full Name",
              fontsize: 12.0,
              fontWeight: FontWeight.bold,
            ),
            SizedBox(height: 4.h),
            CustomTextField(
              hintText: "Carla Botosh",
              textEditingController: fullNameController,
              filled: true,
              fontSize: 12.sp,
              fillColor: Colors.grey[200],
              prefixIcon: Icon(Icons.person),
              borderRadius: BorderRadius.circular(8.0),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter full name";
                }
                return null;
              },
            ),
            SizedBox(height: 12.h),
            CustomText(
              text: "Email/Phone",
              fontsize: 12.0,
              fontWeight: FontWeight.bold,
            ),
            SizedBox(height: 4.h),
            CustomTextField(
              hintText: "carlabts@email.com",
              fontSize: 12.sp,
              textEditingController: emailPhoneController,
              keyboardType: TextInputType.emailAddress,
              filled: true,
              fillColor: Colors.grey[200],
              prefixIcon: Icon(Icons.email_outlined),
              borderRadius: BorderRadius.circular(8.0),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter email or phone";
                }
                return null;
              },
            ),
            SizedBox(height: 12.h),
            CustomText(
              text: "Password",
              fontsize: 12.0,
              fontWeight: FontWeight.bold,
            ),
            SizedBox(height: 4.h),
            CustomTextField(
              hintText: "••••••••",
              fontSize: 12.sp,
              textEditingController: passwordController,
              isObsCure: !_isPasswordVisible,
              filled: true,
              fillColor: Colors.grey[200],
              prefixIcon: Icon(Icons.lock),
              suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    _isPasswordVisible = !_isPasswordVisible;
                  });
                },
                child: HugeIcon(
                  icon: _isPasswordVisible
                      ? HugeIcons.strokeRoundedView
                      : HugeIcons.strokeRoundedViewOff,
                  color: Colors.black,
                  size: 22.h,
                ),
              ),
              onIconTap: () {
                setState(() {
                  _isPasswordVisible = !_isPasswordVisible;
                });
              },
              onChanged: _validatePassword,
              borderRadius: BorderRadius.circular(8.0),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter password";
                }
                if (_passwordError != null) {
                  return _passwordError;
                }
                return null;
              },
            ),
            SizedBox(height: 12.h),
            CustomText(
              text: "Phone Number",
              fontsize: 12.0,
              fontWeight: FontWeight.bold,
            ),
            SizedBox(height: 4.h),
            CustomTextField(
              hintText: "(+1) 234 567 890",
              textEditingController: fullNameController,
              filled: true,
              fontSize: 12.sp,
              fillColor: Colors.grey[200],
              prefixIcon: Icon(Icons.phone),
              borderRadius: BorderRadius.circular(8.0),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "(+1) 234 567 890";
                }
                return null;
              },
            ),
            SizedBox(height: 18.h),
            ElevatedButton(
              onPressed: () {
                // Get.toNamed(RouteConstants.signupscreen2);
                // if (_formKey.currentState!.validate()) {

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
                text: "Save Changes",
                color: Colors.white,
                fontsize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
