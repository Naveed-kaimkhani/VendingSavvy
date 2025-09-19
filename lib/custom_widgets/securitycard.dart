import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vendingsavvy/constant/appcolors.dart' show AppColors;

class DetectionSummaryCard extends StatelessWidget {
  final String iconPath;
  final String title;
  final String value;
  final Color? valueColor;

  const DetectionSummaryCard({
    required this.iconPath,
    required this.title,
    required this.value,

    this.valueColor,
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
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            radius: 25,
            backgroundColor: Colors.red.shade50,
            child: SvgPicture.asset(
              iconPath,
              height: 20,
              color: AppColors.primary,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    color: AppColors.inactive,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: valueColor ?? Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
