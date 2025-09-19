import 'package:flutter/material.dart';
import 'package:flutter/services.dart'
    show LengthLimitingTextInputFormatter, FilteringTextInputFormatter;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:vendingsavvy/constant/appcolors.dart';
import 'package:vendingsavvy/constant/appconstants.dart' show AppConstants;
import 'package:vendingsavvy/constant/route_constants.dart';
import 'package:vendingsavvy/custom_widgets/custom_button.dart';
import 'package:vendingsavvy/custom_widgets/custom_text.dart';
import 'package:vendingsavvy/custom_widgets/customtextfield.dart';
import 'package:vendingsavvy/utils/app_fonts.dart';
import 'package:vendingsavvy/utils/app_strings.dart';
import 'package:vendingsavvy/utils/field_validation.dart';
import 'package:vendingsavvy/utils/regular_expression.dart';

class Businesslogin extends StatefulWidget {
  const Businesslogin({super.key});

  @override
  State<Businesslogin> createState() => _BusinessloginState();
}

class _BusinessloginState extends State<Businesslogin> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController usernameController =
      TextEditingController(); // Added for sign-up
  final TextEditingController confirmPasswordController =
      TextEditingController(); // Added for sign-up
  GlobalKey<FormState> authForm = GlobalKey<FormState>();
  bool isPasswordObsure = true;
  bool isLoginActive = true; // State to track active tab

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    usernameController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  final phoneMaskFormatter = MaskTextInputFormatter(
    mask: '(+1)###-###-####',
    filter: {"#": RegExp(r'[0-9]')},
  );

  bool isPhoneInput = false;
  final _formKey = GlobalKey<FormState>();
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Icon(Icons.arrow_back),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 6.h),
                CustomText(
                  text: "Welcome Back!",
                  fontsize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(height: 6.h),
                CustomText(
                  text: "Sign In to your account",
                  fontsize: 12.0,
                  fontWeight: FontWeight.w500,
                  color: AppColors.APP_GRAY_COLOR,
                ),
                SizedBox(height: 20.h),
                CustomText(
                  text: "Email/Phone",
                  fontsize: 12.0,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(height: 8.h),
                CustomTextField(
                  hintText: AppStrings.EMAIL_ADDRESS,
                  filled: true,
                  prefixIconColor: AppColors.kPrimaryColor,
                  textInputFormattors: isPhoneInput
                      ? [phoneMaskFormatter]
                      : [
                          LengthLimitingTextInputFormatter(50),
                          FilteringTextInputFormatter.deny(
                            RegularExpressions.DISALLOW_SPACES,
                          ),
                        ],
                  keyboardType: TextInputType.emailAddress,
                  textEditingController: emailController,
                  validator: (val) => Validation.emailOrPhoneValidator(
                    fieldLabel: "Email or mobile number",
                    value: val ?? '',
                  ),
                  onChanged: (val) {
                    final isPhone = RegExp(r'^[\d(]').hasMatch(val);
                    if (isPhone != isPhoneInput) {
                      setState(() {
                        isPhoneInput = isPhone;
                        emailController.clear();
                      });
                    }
                  },
                  onCrossIconTap: () {
                    setState(() {
                      emailController.clear();
                      isPhoneInput = false;
                    });
                  },
                ),
                SizedBox(height: 10.h),
                CustomText(
                  text: "Password",
                  fontsize: 12.0,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(height: 8.h),
                CustomTextField(
                  hintText: AppStrings.PASSWORD,
                  filled: true,
                  prefixIconColor: AppColors.blackColor,
                  isLogin: true,
                  isObsCure: isPasswordObsure,
                  errorMaxLines: 10,
                  textEditingController: passwordController,
                  textInputFormattors: [
                    LengthLimitingTextInputFormatter(
                      AppConstants.PASSWORD_MAX_LENGTH,
                    ),
                  ],
                  onIconTap: () {
                    setState(() {
                      isPasswordObsure = !isPasswordObsure;
                    });
                  },
                  validator: (value) {
                    if (value!.trim().isEmpty) {
                      return "${AppStrings.PASSWORD}${" is required"}";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 12.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: CustomText(
                        text: "Forgot Password?",
                        fontsize: 12,
                        fontWeight: FontWeight.normal,
                        color: AppColors.kPrimaryColor,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 40.h),
                CustomButton(
                  borderRadius: 30,
                  buttonColor: AppColors.kPrimaryColor,
                  onTap: () {
                    Get.toNamed(RouteConstants.bussinesnextflow);
                  },
                  buttonText: "Login",
                  fontSize: 14.sp,
                  width: Get.width,
                  fontFamily: AppFonts.interRegular,
                ),
                SizedBox(height: 20.0), // Space between Login and Google button
                // Google Login Button
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      // Add Google login logic here
                    },
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(700, 50),
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black87,
                      side: BorderSide(color: Colors.grey.shade300),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      // padding: EdgeInsets.symmetric(
                      //   horizontal: 16.0,
                      //   vertical: 15.0,
                      // ),
                    ),

                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          'assets/images/googleicon.png', // Replace with your Google logo path
                          height: 24.0,
                          width: 24.0,
                        ),
                        SizedBox(width: 8.0),
                        CustomText(
                          text: "Login with Google",
                          color: Colors.black87,
                          fontsize: 16.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 12.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                      text: "Don't have an account?",
                      fontsize: 14,

                      fontWeight: FontWeight.normal,
                      color: AppColors.APP_GRAY_COLOR,
                    ),
                    SizedBox(width: 4.w),
                    GestureDetector(
                      onTap: () {
                        Get.offNamed(RouteConstants.signupscreen);
                      },
                      child: CustomText(
                        text: "Sign Up",
                        fontsize: 14,
                        color: AppColors.kPrimaryColor,
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
