import 'dart:async';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vendingsavvy/constant/route_constants.dart';
import 'package:vendingsavvy/controllers/auth_controllers.dart';
import 'package:vendingsavvy/models/user_models.dart';

class UserController extends GetxController {
  late SharedPreferences prefs;
  var token = ''.obs;

  Rxn<UserModel> user = Rxn<UserModel>();

  @override
  void onInit() async {
    super.onInit();
    prefs = await SharedPreferences.getInstance();
    getUserFromPrefs(); // Load session on init
  }

  Future<void> saveUserSessionFromResponse(
    UserModel userModel,
    String userToken,
  ) async {
    await prefs.setInt('id', userModel.id ?? 0);
    await prefs.setString('first_name', userModel.name);
    await prefs.setString('email', userModel.email);
    await prefs.setString('avatar_url', userModel.profilePicture ?? "");

    await prefs.setString('token', userToken);
    log(userModel.email);
    log(userModel.name);
    token.value = userToken;
    user.value = userModel;
  }

  Future<void> getUserFromPrefs() async {
    final id = prefs.getInt('id');
    final name = prefs.getString('first_name');
    final email = prefs.getString('email');
    final role = prefs.getString('role');
    token.value = prefs.getString('token') ?? '';

    if (id == null || name == null || email == null ) {
      user.value = null; // Set user to null if any data is missing
      return;
    }

    // Create the UserModel object
    UserModel userModel = UserModel(
      id: id,
      name: name,
      email: email,
      customerNumber: "",
    );
    // Assign the loaded user to the reactive user variable
    user.value = userModel;
  }

  // You can use the user's info throughout the app as follows:
  UserModel? get currentUser => user.value;

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    token.value = '';
    if (Get.isRegistered<AuthController>()) {
      Get.delete<AuthController>();
      log("AuthController instance deleted");
    }
    // user.value = null;
    Get.offAllNamed(RouteConstants.loginscreen);
  }

  // In UserController class
  Future<void> updateUserEmailVerification(bool isVerified) async {
    try {
      // Update the current user model
      if (user != null) {
        final updatedUser = user.value!.copyWith(email_verified: isVerified);
        user.value = updatedUser;

        // Update local storage
        // await saveUserSession(updatedUser);

        log("Email verification status updated: $isVerified");
      }
    } catch (e) {
      log("Error updating email verification: $e");
    }
  }
}
