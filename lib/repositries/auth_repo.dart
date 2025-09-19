import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vendingsavvy/constant/api_endpoints.dart';
import 'package:vendingsavvy/models/user_models.dart';
import 'package:vendingsavvy/services/api_client.dart';

import '../controllers/user_controller.dart';

class AuthRepository extends GetxController {
  final ApiClient apiClient;
  AuthRepository({required this.apiClient});

  final UserController userController = Get.find<UserController>();

  Future<void> registerUser({
    required UserModel user,
    required VoidCallback onSuccess,
    required Function(String message) onError,
  }) async {
    try {
      final response = await apiClient.signup(
        url: ApiEndpoints.signup,
        body: user.toJson(),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final responseData = jsonDecode(response.body);

        if (responseData['success'] == true) {
          final data = responseData['data'];
          final token = data['access_token'];
          final userData = data['user'];
          // final registeredUser = UserModel.fromJson(userData);

          // await userController.saveUserSessionFromResponse(
          //     registeredUser, token);

          onSuccess();
        } else {
          log(response.body);
          onError(responseData['message'] ?? 'Registration failed');
        }
      } else {
        log(response.body);
        final error = jsonDecode(response.body);
        onError(error['message'] ?? 'Registration failed');
      }
    } catch (e) {
      log(e.toString());
      onError("An error occurred during registration: $e");
    }
  }

  // auth_repository.dart
  Future<void> loginUser({
    required String email,
    required String password,
    required VoidCallback onSuccess,
    required Function(String message) onError,
  }) async {
    try {
      final response = await apiClient
          .login(
            url: ApiEndpoints.login,
            body: {'email': email, 'password': password},
          )
          .timeout(const Duration(seconds: 15));
      // log(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final responseData = jsonDecode(response.body);

        if (responseData['success'] == true) {
          final data = responseData['data'];
          final token = data['access_token'];
          log("token value$token");
          final userData = data['user'];

          final user = UserModel.fromJson(userData);

          await userController.saveUserSessionFromResponse(user, token);

          onSuccess();
        } else {
          onError(responseData['message'] ?? 'Login failed');
        }
      } else {
        final error = jsonDecode(response.body);
        onError(error['message'] ?? 'Login failed');
      }
    } catch (e) {
      log(e.toString());
      onError("An error occurred during login.");
    }
  }

  Future<void> forgotPassword({
    required String email,
    required VoidCallback onSuccess,
    required Function(String message) onError,
  }) async {
    try {
      final response = await apiClient
          .put(url: ApiEndpoints.forgotPassword, body: {"email": email})
          .timeout(const Duration(seconds: 15));

      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = jsonDecode(response.body);
        if (data['success'] == true) {
          onSuccess();
        } else {
          onError(data['message'] ?? "Failed to send OTP");
        }
      } else {
        final error = jsonDecode(response.body);
        onError(error['message'] ?? "Failed to send OTP");
      }
    } catch (e) {
      onError("Something went wrong. Please try again.");
    }
  }

  Future<void> resetPassword({
    required String email,
    required String otp,
    required String newPassword,
    required VoidCallback onSuccess,
    required Function(String message) onError,
  }) async {
    try {
      final response = await apiClient
          .put(
            url: ApiEndpoints.resetPassword,
            body: {"email": email, "otp": otp, "password": newPassword},
          )
          .timeout(const Duration(seconds: 15));
      log(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = jsonDecode(response.body);

        if (data['success'] == true) {
          onSuccess();
        } else {
          onError(data['message'] ?? "Password reset failed");
        }
      } else {
        final error = jsonDecode(response.body);
        onError(error['message'] ?? "Password reset failed");
      }
    } catch (e) {
      onError("Something went wrong. Please try again.");
    }
  }

  // Future<void> submitBusinessInformation({
  //   required String businessName,
  //   required String businessAddress,
  //   required String contactNumber,
  //   required String businessType,
  //   required String country,
  //   required String state,
  //   required String county,
  //   required double stateTax,
  //   required double countyTax,
  //   required VoidCallback onSuccess,
  //   required Function(String message) onError,
  // }) async {
  //   try {
  //     final response = await apiClient
  //         .post(
  //           url: ApiEndpoints.addBusiInfo,
  //           body: jsonEncode({
  //             "business_name": businessName,
  //             "business_address": businessAddress,
  //             "contact_number": contactNumber,
  //             "business_type": businessType,
  //             "country": country,
  //             "state": state,
  //             "county": county,
  //             "state_tax": stateTax,
  //             "county_tax": countyTax,
  //           }),
  //         )
  //         .timeout(const Duration(seconds: 15));

  //     if (response.statusCode == 200 || response.statusCode == 201) {
  //       final data = jsonDecode(response.body);
  //       if (data['success'] == true) {
  //         onSuccess();
  //       } else {
  //         onError(data['message'] ?? "Failed to save business information");
  //       }
  //     } else {
  //       final error = jsonDecode(response.body);
  //       onError(error['message'] ?? "Failed to save business information");
  //     }
  //   } catch (e) {
  //     log(e.toString());
  //     onError("An error occurred while saving business information: $e");
  //   }
  
  // }

  Future<void> submitBusinessInformation({
  required String businessName,
  required String businessAddress,
  required String contactNumber,
  required String businessType,
  String? country,
  String? state,
  String? county,
  double? stateTax,
  double? countyTax,
  double? commission,
  double? salesTax,
  double? rent,
  required VoidCallback onSuccess,
  required Function(String message) onError,
}) async {
  try {
    // Base body (always required)
    final Map<String, dynamic> body = {
      "business_name": businessName,
      "business_address": businessAddress,
      "contact_number": contactNumber,
      "business_type": businessType,
    };

    // Add optional fields only if present
    if (country != null && country.isNotEmpty) body["country"] = country;
    if (state != null && state.isNotEmpty) body["state"] = state;
    if (county != null && county.isNotEmpty) body["county"] = county;

    // Add tax info only if RETAILER
    if (businessType == "RETAILER") {
      if (stateTax != null) body["state_tax"] = stateTax;
      if (countyTax != null) body["county_tax"] = countyTax;
      if (commission != null) body["commission"] = commission;
      if (salesTax != null) body["sales_tax"] = salesTax;
      if (rent != null) body["rent"] = rent;
    }

    final response = await apiClient
        .post(
          url: ApiEndpoints.addBusiInfo,
          body: jsonEncode(body),
        )
        .timeout(const Duration(seconds: 15));

    if (response.statusCode == 200 || response.statusCode == 201) {
      final data = jsonDecode(response.body);
      if (data['success'] == true) {
        onSuccess();
      } else {
        onError(data['message'] ?? "Failed to save business information");
      }
    } else {
      final error = jsonDecode(response.body);
      onError(error['message'] ?? "Failed to save business information");
    }
  } catch (e) {
    log(e.toString());
    onError("An error occurred while saving business information: $e");
  }
}

}
