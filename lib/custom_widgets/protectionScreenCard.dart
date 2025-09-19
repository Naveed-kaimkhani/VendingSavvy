import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vendingsavvy/constant/appcolors.dart';
import 'package:vendingsavvy/custom_widgets/custom_text.dart';

class ProtectionCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String iconPath;
  final VoidCallback onTap;

  const ProtectionCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.iconPath,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.border),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundColor: const Color(0xFFFBEAEA),
              radius: 24,
              child: Image.asset(iconPath),
            ),

            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: CustomText(
                          text: title,
                          fontsize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 20,
                        color: AppColors.inactive,
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  CustomText(
                    text: subtitle,
                    // color: AppColors.inactive,
                    fontsize: 12,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
