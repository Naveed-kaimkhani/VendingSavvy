import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:get/get_rx/src/rx_types/rx_types.dart";
import "package:vendingsavvy/constant/appcolors.dart";
import "package:vendingsavvy/utils/app_fonts.dart" show AppFonts;

/// Custom Button used in App
class CustomButton extends StatelessWidget {
  CustomButton({
    Key? key,
    required this.buttonColor,
    required this.onTap,
    required this.buttonText,
    this.icon,
    this.width,
    this.iconColor,
    this.padding,
    this.height,
    this.containsIcon = false,
    this.fontFamily,
    this.fontSize = 14,
    this.textColor = Colors.white, // Default white text color
    this.showBorder = false, // Default no border
    this.borderColor,
    this.borderRadius = 10,
    this.borderInsideColor,
    this.fontWeight = FontWeight.w600,
    RxBool? isLoading,
  }) : isLoading = isLoading ?? false.obs, // initialize properly
       super(key: key);

  final Color buttonColor;
  final Color textColor;
  final String buttonText;
  final Function()? onTap;
  final bool containsIcon;
  final String? icon;
  final Color? iconColor;
  final double fontSize;
  final double? height;
  final double? width;
  final double? padding;
  final String? fontFamily;
  final bool? showBorder;
  final double borderRadius;
  final Color? borderColor;
  final Color? borderInsideColor;
  final FontWeight? fontWeight;
  final RxBool isLoading;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height ?? 50.h,
        width: width ?? 100.w,
        padding: EdgeInsets.symmetric(horizontal: padding ?? 20).w,
        decoration: BoxDecoration(
          color: buttonColor, // Use dynamic buttonColor
          border: showBorder ?? false
              ? Border.all(color: borderColor ?? AppColors.kPrimaryColor)
              : null,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: containsIcon
            ? Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    buttonText,
                    style: TextStyle(
                      color: textColor,
                      fontSize: fontSize.sp,
                      fontFamily: fontFamily ?? AppFonts.interBold,
                      fontWeight: fontWeight,
                    ),
                  ),
                  10.horizontalSpace,
                  Image.asset(
                    icon ?? "",
                    scale: 3.5.sp,
                    color: iconColor ?? AppColors.whiteColor,
                  ),
                ],
              )
            : Center(
                child: isLoading.value
                    ? SizedBox(
                        width: 18.w,
                        height: 18.w,
                        child: const CircularProgressIndicator.adaptive(
                          strokeWidth: 2,
                          backgroundColor: Colors.black,
                        ),
                      )
                    : Text(
                        buttonText,
                        style: TextStyle(
                          color: showBorder ?? false
                              ? AppColors.kPrimaryColor
                              : textColor,
                          fontSize: fontSize.sp,
                          fontFamily: fontFamily ?? AppFonts.interBold,
                          fontWeight: fontWeight,
                        ),
                      ),
              ),
      ),
    );
  }
}
