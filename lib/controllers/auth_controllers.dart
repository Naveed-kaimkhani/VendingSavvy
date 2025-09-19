import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vendingsavvy/constant/route_constants.dart';
import 'package:vendingsavvy/controllers/user_controller.dart';
import 'package:vendingsavvy/models/user_models.dart';
import 'package:vendingsavvy/repositries/auth_repo.dart';
import 'package:vendingsavvy/utils/app_snackbar.dart';

class AuthController extends GetxController {
  final AuthRepository authRepo;

  AuthController({required this.authRepo});

  final nameController = TextEditingController(text: "Default Name");
  final addressController = TextEditingController(text: "Default Address");
  final customerNumbeController = TextEditingController(text: "12345");
  final emailController = TextEditingController(text: "user@example.com");
  final passwordController = TextEditingController(text: "Password123");
  final confirmPasswordController = TextEditingController(text: "Password123");
  RxBool isLoading = false.obs;
  final isPasswordHidden = true.obs;
  var selectedRole = "CUSTOMER".obs;

  RxString selectedBusinessType="RETAILER".obs;
  final businessNameController = TextEditingController(text: "Vending Savvy");
  final fullNameController = TextEditingController(text: "John Doe");
  final businessAddressController = TextEditingController(
    text: "123 Business St",
  );
  final contactNumberController = TextEditingController(
    text: "(+1) 234 567 890",
  );
  final businessTypeController = TextEditingController(text: "Retail");
  final countryController = TextEditingController(text: "USA");
  final stateController = TextEditingController(text: "California");
  final countyController = TextEditingController(text: "Los Angeles");
  final stateTaxController = TextEditingController();
  final countyTaxController = TextEditingController();

  var otp = "".obs;
  final UserController userController = Get.find<UserController>();

  // set user role
  void setRole(String role) {
    selectedRole.value = role;
  }

  // register User
  void registerUser({required UserModel user}) {
    isLoading.value = true;
    log("in register user");
    authRepo.registerUser(
      user: user,
      onSuccess: () {
        isLoading.value = false;
        AppSnackbar.success("Registered successfully");
        Get.toNamed(RouteConstants.bussinessinformation);
      },
      onError: (message) {
        isLoading.value = false;
        AppSnackbar.error(message);
      },
    );
  }

  // login User
  void loginUser({required String email, required String password}) {
    isLoading.value = true;
    authRepo.loginUser(
      email: email,
      password: password,
      onSuccess: () {
        isLoading.value = false;
        AppSnackbar.success("Login successful");
        Get.toNamed(RouteConstants.dashboard);
      },
      onError: (message) {
        isLoading.value = false;
        AppSnackbar.error(message);
      },
    );
  }

  // forgot password
  void forgotPassword({required String email}) {
    isLoading.value = true;
    authRepo.forgotPassword(
      email: email,
      onSuccess: () {
        isLoading.value = false;
        otp.value = "";
        AppSnackbar.success("OTP sent to your email");
        log("coming from forget");
        Get.toNamed(
          RouteConstants.bussinessinformation,
          arguments: {"isFromForgotPassword": true, "email": email},
        );
      },
      onError: (message) {
        isLoading.value = false;
        AppSnackbar.error(message);
      },
    );
  }

  // reset password
  void resetPassword({
    required String email,
    required String otp,
    required String newPassword,
  }) {
    isLoading.value = true;
    authRepo.resetPassword(
      email: email,
      otp: otp,
      newPassword: newPassword,
      onSuccess: () {
        isLoading.value = false;
        AppSnackbar.success("Password reset successfully");
        Get.offAllNamed(RouteConstants.loginscreen);
      },
      onError: (message) {
        isLoading.value = false;
        AppSnackbar.error(message);
      },
    );
  }

  // submit business information
  void submitBusinessInformation({
    required String businessName,
    required String businessAddress,
    required String contactNumber,
    required String businessType,
    required String country,
    required String state,
    required String county,
    required double stateTax,
    required double countyTax,
  }) {
    isLoading.value = true;
    authRepo.submitBusinessInformation(
      businessName: businessName,
      businessAddress: businessAddress,
      contactNumber: contactNumber,
      businessType: businessType,
      country: country,
      state: state,
      county: county,
      stateTax: stateTax,
      countyTax: countyTax,
      onSuccess: () {
        isLoading.value = false;
        AppSnackbar.success("Business information saved successfully");
        Get.toNamed(RouteConstants.dashboard);
      },
      onError: (message) {
        isLoading.value = false;
        AppSnackbar.error(message);
      },
    );
  }
}
