import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vendingsavvy/custom_widgets/customNavBar.dart'
    show CustomNavBar;
import 'package:vendingsavvy/views/authentication/bussiness/expensemanagement/expensemanagment.dart';
import 'package:vendingsavvy/views/authentication/bussiness/profilepage.dart';
import 'package:vendingsavvy/views/authentication/bussiness/reports/reportsscreen.dart';
import 'package:vendingsavvy/views/authentication/bussiness/salesmanagement/sales.dart';
import 'package:vendingsavvy/views/authentication/homescreen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    Homescreen(),
    Salesmanagement(),
    Expensemanagment(),
    Reportsscreen(),
    ProfilePage(),
    // const HomeScreen(),
    // const ProtectionScreen(),
    // CallBlockingScreen(), // Assuming this represents History
    // ProfileSettingsScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: _screens.isNotEmpty && _selectedIndex < _screens.length
            ? _screens[_selectedIndex]
            : const Center(child: Text('No Screens Available')),
      ),
      bottomNavigationBar: CustomNavBar(
        selectedIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
