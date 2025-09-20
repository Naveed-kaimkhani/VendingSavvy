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

  final nameController = TextEditingController();
  final addressController = TextEditingController();
  final customerNumbeController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  RxBool isLoading = false.obs;
  final isPasswordHidden = true.obs;
  var selectedRole = "CUSTOMER".obs;

  RxString selectedBusinessType = "RETAILER".obs;
  final businessNameController = TextEditingController();
  final fullNameController = TextEditingController();
  final businessAddressController = TextEditingController();
  final contactNumberController = TextEditingController();
  final businessTypeController = TextEditingController(text: "Retail");
  final countryController = TextEditingController();
  final stateController = TextEditingController();
  final countyController = TextEditingController();
  final stateTaxController = TextEditingController();
  final countyTaxController = TextEditingController();

  var otp = "".obs;

  final otpController = TextEditingController();

  RxString selectedVendingMachines = "1".obs;
  RxString selectedCottonCandyMachines = "1".obs;
  RxString selectedOtherMachines = "1".obs;

  @override
  void onClose() {
    // Clean up controllers
    nameController.dispose();
    addressController.dispose();
    customerNumbeController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    businessNameController.dispose();
    fullNameController.dispose();
    businessAddressController.dispose();
    contactNumberController.dispose();
    businessTypeController.dispose();
    countryController.dispose();
    stateController.dispose();
    countyController.dispose();
    stateTaxController.dispose();
    countyTaxController.dispose();
    otpController.dispose();
    super.onClose();
  }

  final UserController userController = Get.find<UserController>();

  // set user role
  void setRole(String role) {
    selectedRole.value = role;
  }

  // register User
  void registerUser({required UserModel user}) {
    isLoading.value = true;

    authRepo.registerUser(
      user: user,
      onSuccess: () {
        isLoading.value = false;
        // AppSnackbar.success("Registered successfully");
        Get.toNamed(RouteConstants.bussinessinformation);
      },
      onError: (message) {
        isLoading.value = false;
        AppSnackbar.error(message);
      },
    );
  }

  // ✅ verify email OTP
  void verifyEmail({required String otp}) {
    isLoading.value = true;

    authRepo.verifyEmail(
      otp: otp,
      onSuccess: () {
        isLoading.value = false;
        AppSnackbar.success("Email verified successfully");

        final arguments = Get.arguments;
        if (arguments != null && arguments['isFromForgotPassword'] == true) {
        } else {
          // From registration - go to dashboard
          Get.toNamed(RouteConstants.dashboard);
        }
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
        businessType == "RETAILER"
            ? Get.toNamed(RouteConstants.dashboard)
            : Get.toNamed(RouteConstants.vendinginformationscreen);
      },
      onError: (message) {
        isLoading.value = false;
        AppSnackbar.error(message);
      },
    );
  }

  // submit vending machine information
  void submitVendingMachineInformation(List<Map<String, dynamic>> machineData) {
    isLoading.value = true;
    authRepo.submitVendingMachineInformation(
      machineData: machineData,
      onSuccess: () {
        isLoading.value = false;
        AppSnackbar.success("Vending machine information saved successfully");
        Get.toNamed(RouteConstants.dashboard);
      },
      onError: (message) {
        isLoading.value = false;
        AppSnackbar.error(message);
      },
    );
  }
}
