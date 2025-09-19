import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vendingsavvy/constant/appcolors.dart';
import 'dart:async';
import 'package:vendingsavvy/constant/route_constants.dart' show RouteConstants;
import 'package:vendingsavvy/controllers/auth_controllers.dart';
import 'package:vendingsavvy/controllers/user_controller.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final authController = Get.put(
    AuthController(authRepo: Get.find()),
    permanent: true,
  );
  final UserController userController = Get.put(
    UserController(),
    permanent: true,
  );

  @override
  void initState() {
    super.initState();

    _checkAuthentication();
  }

  void _checkAuthentication() {
    Timer(const Duration(seconds: 3), () async {
      await userController.getUserFromPrefs();

      if (userController.token.value.isNotEmpty) {
        Get.toNamed(RouteConstants.dashboard);
      } else {
        Get.toNamed(RouteConstants.bussinesslogin);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Image.asset("assets/images/logo.png")],
        ),
      ),
    );
  }
}
