import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:vendingsavvy/constant/appcolors.dart';

class CustomTextField extends StatefulWidget {
  CustomTextField({
    Key? key,
    required this.hintText,
    this.labelText,
    this.maxLines,
    this.minLines,
    this.validator,
    this.maxLength,
    this.textInputFormattors,
    this.prefixIcon, // Already dynamic (String or Widget)
    this.prefixIconColor,
    this.keyboardType = TextInputType.text,
    this.suffixIcon, // Changed from String? to dynamic
    this.fillColor = AppColors.whiteColor,
    this.isMultiLine = false,
    this.isObsCure = false,
    this.onIconTap,
    this.onCrossIconTap,
    this.readyOnly = false,
    this.textStyle,
    this.fontSize,
    this.hasShadow = true,
    this.textColor,
    this.helpertext,
    this.onTap,
    this.hintTextColor,
    this.onChanged,
    this.isLogin = false,
    this.isSearching = false,
    this.textEditingController,
    this.height,
    this.filled = false,
    this.filledColor,
    this.borderColor,
    this.focusedColor,
    this.enabledBorderColor,
    this.focusNode,
    this.errorMaxLines,
    this.borderRadius,
  }) : super(key: key);

  final String hintText;
  final String? labelText;
  final int? maxLines;
  final int? minLines;
  final int? maxLength;
  String? Function(String?)? validator;
  String? Function(String?)? onSaved;
  final dynamic prefixIcon; // Can be String (asset path) or Widget (icon)
  final Color? prefixIconColor;
  final dynamic suffixIcon; // Changed to dynamic to support String or Widget
  final bool isMultiLine;
  final Color? fillColor;
  final Color? hintTextColor;
  final Color? textColor;
  final List<TextInputFormatter>? textInputFormattors;
  final TextStyle? textStyle;
  final String? helpertext;
  final TextEditingController? textEditingController;
  final bool readyOnly;
  final bool hasShadow;
  final bool isObsCure;
  final bool isLogin;
  final bool isSearching;
  final VoidCallback? onTap;
  final Function()? onIconTap;
  final Function()? onCrossIconTap;
  final double? fontSize;
  final TextInputType keyboardType;
  final Function(String)? onChanged;
  final double? height;
  Color? filledColor;
  bool? filled;
  Color? borderColor;
  Color? focusedColor;
  Color? enabledBorderColor;
  FocusNode? focusNode;
  BorderRadius? borderRadius;
  int? errorMaxLines;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  String? errorText;

  @override
  void initState() {
    super.initState();
    widget.textEditingController?.addListener(_onTextChanged);
    errorText = widget.validator?.call(widget.textEditingController?.text);
  }

  void _onTextChanged() {
    setState(() {});
  }

  @override
  void dispose() {
    widget.textEditingController?.removeListener(_onTextChanged);
    super.dispose();
  }

  bool hasError = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          cursorColor: Colors.black,
          showCursor: true,
          cursorOpacityAnimates: true,
          focusNode: widget.focusNode,
          obscureText: widget.isObsCure,
          onTap: widget.onTap,
          readOnly: widget.readyOnly,
          inputFormatters: widget.textInputFormattors,
          validator: (value) {
            String? validationResult = widget.validator?.call(value);
            setState(() {
              hasError = validationResult != null;
              errorText = validationResult;
            });
            return validationResult;
          },
          onChanged: widget.onChanged,
          keyboardType: widget.keyboardType,
          style: GoogleFonts.inter(
            color: widget.textColor ?? AppColors.blackColor,
            fontSize: widget.fontSize ?? 14.sp,
          ),
          maxLines: widget.isMultiLine ? widget.maxLines : 1,
          controller: widget.textEditingController,
          decoration: InputDecoration(
            errorStyle: const TextStyle(height: 0, fontSize: 0),
            filled: widget.filled,
            fillColor: widget.filledColor ?? Colors.white,
            prefixIconConstraints: const BoxConstraints(
              minWidth: 10,
              minHeight: 10,
            ),
            suffixIconConstraints: const BoxConstraints(
              minWidth: 10,
              minHeight: 10,
            ),
            hintText: widget.hintText,
            hintStyle: GoogleFonts.inter(
              color: widget.hintTextColor ?? Colors.grey,
              fontSize: widget.fontSize ?? 14.sp,
            ),
            labelText: widget.labelText,
            prefixIcon: widget.prefixIcon != null
                ? Padding(
                    padding: const EdgeInsets.only(
                      left: 12,
                      right: 12,
                      top: 10,
                      bottom: 12,
                    ),
                    child: widget.prefixIcon is String
                        ? Image.asset(
                            widget.prefixIcon!,
                            height: 18.h,
                            color:
                                widget.prefixIconColor ?? AppColors.blackColor,
                          )
                        : widget.prefixIcon as Widget,
                  )
                : null,
            suffixIcon: widget.suffixIcon != null
                ? Padding(
                    padding: const EdgeInsets.only(right: 12.0),
                    child: widget.suffixIcon is String
                        ? Image.asset(
                            widget.suffixIcon!,
                            height: 22.h,
                            color:
                                widget.prefixIconColor ?? AppColors.blackColor,
                          )
                        : widget.suffixIcon as Widget,
                  )
                : (widget.isLogin || widget.isSearching
                      ? Padding(
                          padding: const EdgeInsets.only(right: 20.0),
                          child: widget.isSearching
                              ? widget.textEditingController != null &&
                                        widget
                                            .textEditingController!
                                            .text
                                            .isNotEmpty
                                    ? Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          GestureDetector(
                                            onTap:
                                                widget.onCrossIconTap ??
                                                () {
                                                  widget.textEditingController
                                                      ?.clear();
                                                },
                                            child: HugeIcon(
                                              icon: HugeIcons
                                                  .strokeRoundedCancel01,
                                              color: Colors.black,
                                              size: 22.h,
                                            ),
                                          ),
                                          SizedBox(width: 4.w),
                                          GestureDetector(
                                            onTap: widget.onIconTap,
                                            child: Image.asset(
                                              'assets/placeholder.png', // Placeholder, replace with actual asset
                                              height: 22.h,
                                              color:
                                                  widget.prefixIconColor ??
                                                  AppColors.blackColor,
                                            ),
                                          ),
                                        ],
                                      )
                                    : widget.isLogin
                                    ? widget.textEditingController != null &&
                                              widget
                                                  .textEditingController!
                                                  .text
                                                  .isNotEmpty
                                          ? Row(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                GestureDetector(
                                                  onTap:
                                                      widget.onCrossIconTap ??
                                                      () {
                                                        widget
                                                            .textEditingController
                                                            ?.clear();
                                                      },
                                                  child: HugeIcon(
                                                    icon: HugeIcons
                                                        .strokeRoundedCancel01,
                                                    color: AppColors.blackColor,
                                                    size: 22.h,
                                                  ),
                                                ),
                                                SizedBox(width: 4.w),
                                                GestureDetector(
                                                  onTap: widget.onIconTap,
                                                  child: HugeIcon(
                                                    icon: widget.isObsCure
                                                        ? HugeIcons
                                                              .strokeRoundedViewOff
                                                        : HugeIcons
                                                              .strokeRoundedView,
                                                    color: AppColors.blackColor,
                                                    size: 22.h,
                                                  ),
                                                ),
                                              ],
                                            )
                                          : GestureDetector(
                                              onTap: widget.onIconTap,
                                              child: HugeIcon(
                                                icon: widget.isObsCure
                                                    ? HugeIcons
                                                          .strokeRoundedViewOff
                                                    : HugeIcons
                                                          .strokeRoundedView,
                                                color: AppColors.blackColor,
                                                size: 22.h,
                                              ),
                                            )
                                    : null
                              : GestureDetector(
                                  onTap: widget.onIconTap,
                                  child: HugeIcon(
                                    icon: widget.isObsCure
                                        ? HugeIcons.strokeRoundedViewOff
                                        : HugeIcons.strokeRoundedView,
                                    color: AppColors.blackColor,
                                    size: 22.h,
                                  ),
                                ),
                        )
                      : widget.textEditingController != null &&
                            widget.textEditingController!.text.isNotEmpty
                      ? Padding(
                          padding: const EdgeInsets.only(right: 20.0),
                          child: GestureDetector(
                            onTap:
                                widget.onCrossIconTap ??
                                () {
                                  widget.textEditingController?.clear();
                                },
                            child: HugeIcon(
                              icon: HugeIcons.strokeRoundedCancel01,
                              color: AppColors.greyColor,
                              size: 22.h,
                            ),
                          ),
                        )
                      : null),
            contentPadding: const EdgeInsets.symmetric(
              vertical: 0,
              horizontal: 16,
            ),
            isDense: false,
            border: OutlineInputBorder(
              borderRadius: widget.borderRadius ?? BorderRadius.circular(10),
              borderSide: BorderSide(
                color: widget.filledColor ?? AppColors.greyColor,
                width: 1.0,
                style: BorderStyle.solid,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: widget.borderRadius ?? BorderRadius.circular(10),
              borderSide: BorderSide(
                color: widget.focusedColor ?? AppColors.kPrimaryColor,
                width: 1.0,
                style: BorderStyle.solid,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: widget.borderRadius ?? BorderRadius.circular(10),
              borderSide: BorderSide(
                color: widget.enabledBorderColor ?? AppColors.greyColor,
                width: 1.0,
                style: BorderStyle.solid,
              ),
            ),
          ),
        ),
        if (hasError && errorText != null)
          Text(
            errorText ?? '',
            style: GoogleFonts.inter(
              color: AppColors.redColor,
              fontSize: 12.sp,
              height: 1.0,
            ),
          ),
      ],
    );
  }
}

// Extension for horizontal space
extension on num {
  SizedBox get horizontalSpace => SizedBox(width: toDouble());
}
