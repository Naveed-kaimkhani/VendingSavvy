import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vendingsavvy/constant/appcolors.dart';

import 'dart:async';

import 'package:vendingsavvy/constant/route_constants.dart' show RouteConstants;
import 'package:vendingsavvy/controllers/auth_controllers.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final authController = Get.put(AuthController(authRepo: Get.find()));
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Get.toNamed(RouteConstants.bussinesslogin);
      // BussinessinformationScreen
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Image.asset("assets/images/logo.png")],
          ),
        ),
      ),
    );
  }
}
