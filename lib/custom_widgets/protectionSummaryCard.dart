import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vendingsavvy/constant/appcolors.dart';


class ProtectionSummaryCard extends StatelessWidget {
  final String iconPath;
  final String title;
  final String value;

  const ProtectionSummaryCard({
    required this.iconPath,
    required this.title,
    required this.value,

    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: Colors.red.shade50,
            child: SvgPicture.asset(iconPath, height: 16),
          ),
          const SizedBox(height: 6),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                value,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              Text(
                title,
                style: const TextStyle(fontSize: 14, color: AppColors.inactive),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
