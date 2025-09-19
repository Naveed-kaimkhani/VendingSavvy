import 'package:flutter/material.dart';
import 'package:vendingsavvy/constant/appcolors.dart' show AppColors;

class CustomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTap;

  const CustomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: selectedIndex,
      onTap: onTap,
      backgroundColor: AppColors.background,
      selectedItemColor: AppColors.primary,
      unselectedItemColor: AppColors.inactive,
      type: BottomNavigationBarType.fixed, // Ensures all items are visible
      items: [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
            size: 22,
            color: selectedIndex == 0 ? AppColors.primary : AppColors.inactive,
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.point_of_sale,
            size: 22,
            color: selectedIndex == 1 ? AppColors.primary : AppColors.inactive,
          ),
          label: 'Sales',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.attach_money,
            size: 22,
            color: selectedIndex == 2 ? AppColors.primary : AppColors.inactive,
          ),
          label: 'Expenses',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.report,
            size: 22,
            color: selectedIndex == 3 ? AppColors.primary : AppColors.inactive,
          ),
          label: 'Reports',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.settings,
            size: 22,
            color: selectedIndex == 4 ? AppColors.primary : AppColors.inactive,
          ),
          label: 'More',
        ),
      ],
    );
  }
}
