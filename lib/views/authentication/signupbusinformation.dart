import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vendingsavvy/constant/route_constants.dart';
import 'package:vendingsavvy/controllers/auth_controllers.dart';
import 'package:vendingsavvy/custom_widgets/custom_text.dart';
import 'package:vendingsavvy/custom_widgets/customtextfield.dart'
    show CustomTextField;
import 'package:hugeicons/hugeicons.dart';
import 'package:vendingsavvy/models/user_models.dart';
import 'package:vendingsavvy/repositries/auth_repo.dart'; // Ensure this is imported

class Signupbusinformation extends StatefulWidget {
  const Signupbusinformation({super.key});

  @override
  State<Signupbusinformation> createState() => _SignupbusinformationState();
}

class _SignupbusinformationState extends State<Signupbusinformation> {
  final _formKey = GlobalKey<FormState>();
  final authController = Get.put(
    AuthController(authRepo: Get.put(AuthRepository(apiClient: Get.find()))),
  );
  // final authController = Get.put(AuthController(authRepo:AuthRepository(apiClient: Get.find())));
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;
  String? _passwordError;

  @override
  void dispose() {
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
                  text: "Basic Information",
                  fontsize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(height: 16.h),
                CustomText(
                  text: "Customer Number",
                  fontsize: 12.0,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(height: 4.h),
                CustomTextField(
                  hintText: "R123-123-123",
                  textEditingController: authController.customerNumbeController,
                  filled: true,
                  fontSize: 12.sp,
                  fillColor: Colors.grey[200],
                  prefixIcon: Icon(Icons.person_outline),
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
                  text: "Full Name",
                  fontsize: 12.0,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(height: 4.h),
                CustomTextField(
                  hintText: "Carla Botosh",
                  textEditingController: authController.nameController,
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
                  text: "Address",
                  fontsize: 12.0,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(height: 4.h),
                CustomTextField(
                  hintText: "Address",
                  textEditingController: authController.addressController,
                  filled: true,
                  fontSize: 12.sp,
                  fillColor: Colors.grey[200],
                  prefixIcon: Icon(Icons.map_outlined),
                  borderRadius: BorderRadius.circular(8.0),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter address";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 12.h),
                CustomText(
                  text: "Email",
                  fontsize: 12.0,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(height: 4.h),
                CustomTextField(
                  hintText: "carlabts@email.com",
                  fontSize: 12.sp,
                  textEditingController: authController.emailController,
                  keyboardType: TextInputType.emailAddress,
                  filled: true,
                  fillColor: Colors.grey[200],
                  prefixIcon: Icon(Icons.email_outlined),
                  borderRadius: BorderRadius.circular(8.0),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter email";
                    }

                    // Basic email format validation
                    final emailRegex = RegExp(
                      r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                    );
                    if (!emailRegex.hasMatch(value)) {
                      return "Please enter a valid email address";
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
                  textEditingController: authController.passwordController,
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
                if (_passwordError != null)
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0, top: 4.0),
                    child: CustomText(
                      text: _passwordError!,
                      fontsize: 12.0,
                      color: Colors.red,
                    ),
                  ),
                SizedBox(height: 12.h),
                CustomText(
                  text: "Confirm Password",
                  fontsize: 12.0,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(height: 4.h),
                CustomTextField(
                  hintText: "••••••••",
                  fontSize: 12.sp,
                  textEditingController:
                      authController.confirmPasswordController,
                  isObsCure: !_isConfirmPasswordVisible,
                  filled: true,
                  fillColor: Colors.grey[200],
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
                      });
                    },
                    child: HugeIcon(
                      icon: _isConfirmPasswordVisible
                          ? HugeIcons.strokeRoundedView
                          : HugeIcons.strokeRoundedViewOff,
                      color: Colors.black,
                      size: 22.h,
                    ),
                  ),
                  onIconTap: () {
                    setState(() {
                      _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
                    });
                  },
                  borderRadius: BorderRadius.circular(8.0),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please confirm password";
                    }
                    if (value != authController.passwordController.text) {
                      return "Passwords do not match";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.h),
                Obx(() {
                  return ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        authController.registerUser(
                          user: UserModel(
                            name: authController.nameController.text.trim(),
                            email: authController.emailController.text.trim(),
                            password: authController.passwordController.text
                                .trim(),
                            address: authController.addressController.text
                                .trim(),
                            customerNumber: authController
                                .customerNumbeController
                                .text
                                .trim(),
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      minimumSize: Size(double.infinity, 50.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                    ),
                    child: authController.isLoading.value
                        ? CircularProgressIndicator.adaptive(
                            backgroundColor: Colors.white,
                          )
                        : CustomText(
                            text: "Next",
                            color: Colors.white,
                            fontsize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                  );
                }),
                SizedBox(height: 16.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                      text: "Have an account?",
                      fontsize: 14.0,
                      color: Colors.grey,
                    ),
                    SizedBox(width: 4.0),
                    CustomText(
                      text: "Login",
                      fontsize: 14.0,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                      text: "Tax Calcuator",
                      fontsize: 14.0,
                      color: Colors.grey,
                    ),
                    SizedBox(width: 4.0),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(RouteConstants.taxcalulator);
                      },
                      child: CustomText(
                        text: "view",
                        fontsize: 14.0,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
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
