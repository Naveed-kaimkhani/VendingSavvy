import 'package:flutter/material.dart';

class ScreenSize {
  static double widthSize = 0.0;
  static double heightSize = 0.0;
  // static double appBarSize = 0.0;
  // static double statusBarSize = 0.0;

  static void screenSizeMethod({required BuildContext context}) {
    widthSize = MediaQuery.of(context).size.width;
    heightSize = MediaQuery.of(context).size.height;
    // appBarSize =  AppBar().preferredSize.height;
    // statusBarSize = MediaQuery.of(context).viewPadding.top;
  }
}
