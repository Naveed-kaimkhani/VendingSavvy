import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart' show GoogleFonts;
import 'package:vendingsavvy/constant/appcolors.dart';

class CustomText extends StatelessWidget {
  String? text;
  final Color? color;
  final FontWeight? fontWeight;
  final double? fontsize;
  AlignmentGeometry? align;
  TextAlign? textAlign;
  List<FontFeature>? fontFeatures;
  final int? maxLines;
  bool isLeftAlign;
  TextDecoration? textDecoration;
  final List<Color>? gradientColors; // Optional gradient colors
  final TextOverflow? overflow; // Added: Optional overflow parameter

  CustomText({
    Key? key,
    this.text,
    this.color,
    this.fontWeight,
    this.textAlign,
    this.fontsize,
    this.fontFeatures,
    this.maxLines,
    this.align,
    this.isLeftAlign = true,
    this.textDecoration,
    this.gradientColors, // Optional gradient
    this.overflow, // Added optional overflow
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textStyle = GoogleFonts.inter(
      fontFeatures: fontFeatures,
      fontSize: fontsize ?? 22.sp,
      color: color ?? AppColors.blackColor, // Default color if no gradient
      decoration: textDecoration,
      fontWeight: fontWeight ?? FontWeight.w200,
    );

    Widget textWidget = Text(
      textAlign: isLeftAlign == false ? TextAlign.center : textAlign,
      maxLines: maxLines,
      overflow:
          overflow ??
          (maxLines != null
              ? TextOverflow.ellipsis
              : TextOverflow
                    .visible), // Default based on maxLines if not provided
      text ?? ' ',
      style: textStyle,
    );

    // Apply gradient if gradientColors is provided
    if (gradientColors != null && gradientColors!.isNotEmpty) {
      textWidget = ShaderMask(
        shaderCallback: (Rect bounds) {
          return LinearGradient(
            colors: gradientColors!,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ).createShader(bounds);
        },
        blendMode: BlendMode.srcIn,
        child: Text(
          text ?? ' ',
          textAlign: isLeftAlign == false ? TextAlign.center : textAlign,
          maxLines: maxLines,
          overflow:
              overflow ??
              (maxLines != null
                  ? TextOverflow.ellipsis
                  : TextOverflow.visible), // Default based on maxLines
          style: textStyle.copyWith(
            color: Colors.white, // White base for gradient
          ),
        ),
      );
    }

    // Only apply alignment if align is provided, otherwise let the parent widget handle it
    return align != null
        ? Align(alignment: align!, child: textWidget)
        : textWidget;
  }
}
