
import 'package:flutter/material.dart';
import 'package:vendingsavvy/constant/appcolors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback? onLeadingPressed;
  final Widget? leadingIcon;
  final Color backgroundColor;

  const CustomAppBar({
    Key? key,
    required this.title,
    this.onLeadingPressed,
    this.leadingIcon,
    this.backgroundColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: AppColors.kPrimaryColor),
          ),
          child: IconButton(
            color: Colors.black,
            icon: leadingIcon ?? const Icon(Icons.arrow_back),
            onPressed: onLeadingPressed ?? () => Navigator.pop(context),
          ),
        ),
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 20,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: backgroundColor,
      elevation: 0, // Removes shadow for a cleaner look
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
