// import "package:flutter/material.dart";
// import "package:flutter_screenutil/flutter_screenutil.dart";
// import "package:get/get_rx/src/rx_types/rx_types.dart";
// import "package:vendingsavvy/constant/appcolors.dart";
// import "package:vendingsavvy/utils/app_fonts.dart" show AppFonts;

// /// Custom Button used in App
// class CustomButton extends StatelessWidget {
//   CustomButton({
//     Key? key,
//     required this.buttonColor,
//     required this.onTap,
//     required this.buttonText,
//     this.icon,
//     this.width,
//     this.iconColor,
//     this.padding,
//     this.height,
//     this.containsIcon = false,
//     this.fontFamily,
//     this.fontSize = 14,
//     this.textColor = Colors.white, // Default white text color
//     this.showBorder = false, // Default no border
//     this.borderColor,
//     this.borderRadius = 10,
//     this.borderInsideColor,
//     this.fontWeight = FontWeight.w600,

//     this.child, // Added child parameter
//     RxBool? isLoading,
//   }) : isLoading = isLoading ?? false.obs, // initialize properly
//        super(key: key);

//   final Color buttonColor;
//   final Color textColor;
//   final String buttonText;
//   final Function()? onTap;
//   final bool containsIcon;

//   final Widget? child; // Optional child widget
//   final String? icon;
//   final Color? iconColor;
//   final double fontSize;
//   final double? height;
//   final double? width;
//   final double? padding;
//   final String? fontFamily;
//   final bool? showBorder;
//   final double borderRadius;
//   final Color? borderColor;
//   final Color? borderInsideColor;
//   final FontWeight? fontWeight;
//   final RxBool isLoading;
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         height: height ?? 50.h,
//         width: width ?? 100.w,
//         padding: EdgeInsets.symmetric(horizontal: padding ?? 20).w,
//         decoration: BoxDecoration(
//           color: buttonColor, // Use dynamic buttonColor
//           border: showBorder ?? false
//               ? Border.all(color: borderColor ?? AppColors.kPrimaryColor)
//               : null,
//           borderRadius: BorderRadius.circular(borderRadius),
//         ),
//         child:Center(
//           child:
//               child ??
//               (containsIcon
//                   ? Row(
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Text(
//                           buttonText,
//                           style: TextStyle(
//                             color: textColor,
//                             fontSize: fontSize.sp,
//                             fontFamily: fontFamily ?? AppFonts.interBold,
//                             fontWeight: fontWeight,
//                           ),
//                         ),

//                         Image.asset(
//                           icon ?? "",
//                           scale: 3.5.sp,
//                           color: iconColor ?? AppColors.whiteColor,
//                         ),
//                       ],
//                     )
//                   : Text(
//                       buttonText,
//                       style: TextStyle(
//                         color: showBorder ?? false
//                             ? AppColors.kPrimaryColor
//                             : textColor,
//                         fontSize: fontSize.sp,
//                         fontFamily: fontFamily ?? AppFonts.interBold,
//                         fontWeight: fontWeight,
//                       ),
//                     )),
//         )
//             : Center(
//                 child: isLoading.value
//                     ? SizedBox(
//                         width: 18.w,
//                         height: 18.w,
//                         child: const CircularProgressIndicator.adaptive(
//                           strokeWidth: 2,
//                           backgroundColor: Colors.white,
//                         ),
//                       )
//                     : Text(
//                         buttonText,
//                         style: TextStyle(
//                           color: showBorder ?? false
//                               ? AppColors.kPrimaryColor
//                               : textColor,
//                           fontSize: fontSize.sp,
//                           fontFamily: fontFamily ?? AppFonts.interBold,
//                           fontWeight: fontWeight,
//                         ),
//                       ),
//               ),
//       ),
//     );
//   }
// }



import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:vendingsavvy/constant/appcolors.dart";
import "package:vendingsavvy/utils/app_fonts.dart" show AppFonts;

/// Custom Button used in App
class CustomButton extends StatelessWidget {
  const CustomButton({
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
    this.child, // Added child parameter
  }) : super(key: key);

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
  final Widget? child; // Optional child widget

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
        child: Center(
          child:
              child ??
              (containsIcon
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

                        Image.asset(
                          icon ?? "",
                          scale: 3.5.sp,
                          color: iconColor ?? AppColors.whiteColor,
                        ),
                      ],
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
                    )),
        ),
      ),
    );
  }
}

// Extension for horizontal space
extension on num {
  SizedBox get horizontalSpace => SizedBox(width: toDouble());
}
