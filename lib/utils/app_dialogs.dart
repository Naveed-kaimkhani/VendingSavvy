import 'dart:io';

import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:gif/gif.dart';
import 'package:toastification/toastification.dart'
    show ToastificationItem, toastification;
import 'package:vendingsavvy/constant/appcolors.dart' show AppColors;
import 'package:vendingsavvy/custom_widgets/custom_button.dart';
import 'package:vendingsavvy/utils/app_assets_path.dart' show AssetPaths;
import 'package:vendingsavvy/utils/app_fonts.dart' show AppFonts;
import 'package:vendingsavvy/utils/app_navigation.dart' show AppNavigation;

class AppDialogs {
  static void showToast({String? message}) {
    Fluttertoast.showToast(
      msg: message ?? "",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
    );
  }

  static void showToastification({
    required BuildContext context,
    required String message,
    Widget? icon,
    Color? color,
  }) {
    toastification.showCustom(
      context: context,
      autoCloseDuration: const Duration(seconds: 1),
      alignment: Alignment.topCenter,
      builder: (BuildContext context, ToastificationItem holder) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: color ?? AppColors.kSecondaryColor),
            color:
                color?.withOpacity(0.2) ??
                AppColors.kSecondaryColor.withOpacity(
                  0.2,
                ), // Custom background color
          ),
          padding: const EdgeInsets.all(16),
          margin: const EdgeInsets.all(8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              icon ?? Container(),
              10.horizontalSpace,
              Expanded(
                child: Text(
                  message,
                  style: TextStyle(
                    color: color ?? AppColors.kSecondaryColor,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.none,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                  softWrap: true,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  static Widget circularProgressWidget({Color? color}) {
    return CircularProgressIndicator(color: color ?? AppColors.kPrimaryColor);
  }

  /// Show waveDots loading animation
  static Widget waveDotsLoader({Color? color, double size = 40}) {
    return LoadingAnimationWidget.stretchedDots(
      color: color ?? AppColors.kPrimaryColor,
      size: size,
    );
  }

  // Show progress with an animated GIF
  static void progressAlertDialog({required BuildContext context}) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        // Return a StatefulWidget to handle the TickerProvider
        return _GifDialog();
      },
    );
  }

  //Receipt Dialog
  static void showReceiptDialog({
    required BuildContext context,
    required String fileImagePath,
  }) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          insetPadding: const EdgeInsets.symmetric(horizontal: 20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          backgroundColor: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Receipt',
                  style: TextStyle(
                    fontSize: 22,
                    // fontWeight: FontWeight.bold,
                    fontFamily: AppFonts.interRegular,
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: const Color(0xFFE6EEFF), // Light blue background
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      color: const Color(0xFFB3D1FF),
                    ), // Soft blue border
                  ),
                  child: Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.file(
                        File(fileImagePath),
                        fit: BoxFit.contain,
                        width: 354.w,
                        height: 516.h,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                CustomButton(
                  buttonColor: AppColors.kPrimaryColor,
                  onTap: () {
                    AppNavigation.navigateCloseDialog(context);
                  },
                  buttonText: "Done",
                  fontSize: 14.sp,
                  fontFamily: AppFonts.interRegular,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _GifDialog extends StatefulWidget {
  @override
  __GifDialogState createState() => __GifDialogState();
}

class __GifDialogState extends State<_GifDialog> with TickerProviderStateMixin {
  late GifController _controller;

  @override
  void initState() {
    super.initState();
    _controller = GifController(vsync: this);
    // Remove manual control of forward and reset, rely on the GifController's built-in play method.
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Center(
        child: Gif(
          image: const AssetImage(AssetPaths.GIF_WAVE), // Your GIF asset path
          height: 80.sp, // Adjust the height as needed
          width: 80.sp, // Adjust the width as needed
          controller: _controller, // GifController
          autostart: Autostart.loop, // Start automatically
          placeholder: (context) =>
              const Text('Loading...'), // Placeholder text
        ),
      ),
    );
  }
}
