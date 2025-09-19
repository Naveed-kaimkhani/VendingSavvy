import 'package:flutter/material.dart';
// import 'package:flutter_easyloading/flutter_easyloading.dart';

class AppColors {
  static const Color redColor = Color(0xffAC2131);
  static const Color transparentColor = Colors.transparent;
  static const Color redaccent = Colors.redAccent;
  static const Color whiteColor = Colors.white;
  static const Color yellowColor = Colors.yellow;

  static const Color blackColor = Colors.black;
  static const Color greyColor = Color(0xffF7F7FD);

  static const Color greenColor = Color(0xff03773A);
  static const Color lightGreenColor = Color(0xff4BF99D);

  // static const Color blueColor = Color(0xff1BCCF5);
  static const SCAFFOLD_COLOR = Color(0xFFC5EDDC);
  static const BUTTON_COLOR = Color(0XFF48CE93);
  static const LIGHT_GREY_COLOR = Color(0XFFE2E2E2);
  static const APP_GRAY_COLOR = Color(0xff757373);

  //757373
  static const TEXTFIELD_TYPED_TEXT_COLOR = Color(0XFF757373);

  //Shimmer Color
  static const shimmerBaseColor = Color.fromRGBO(64, 64, 64, 0.2);
  static const shimmerHighlightColor = Color.fromRGBO(166, 166, 166, 0.5);
  static const Color primary = Color(0xFFE50914);
  static const Color inactive = Color(0xFF6E7179);
  static const Color background = Colors.white;
  static const Color border = Color(0xFFE6E6E6);
  static const Color green = Color(0xFF2ECC71);
  static const Color red = Color(0xFFDB0020);

  //kPrimaryColor
  static const blueColor = Color(0xff1001a3d);
  static const coincolor = Color(0xff3F51B5);

  static const kSecondaryColor = Color(0xff24D85A);
  static const lightBlueAppColor = Color(0xffcee4f7);
  static const klineargradient1 = Color(0xFFF742A9);
  static const klineargradient2 = Color(0xFFF3C307);
  static MaterialColor kPrimaryColor =
      const MaterialColor(0xff3A396A, <int, Color>{
        50: Color(0xff3A396A),
        100: Color(0xff3A396A),
        200: Color(0xff3A396A),
        300: Color(0xff3A396A),
        400: Color(0xff3A396A),
        500: Color(0xff3A396A),
        600: Color(0xff3A396A),
        700: Color(0xff3A396A),
        800: Color(0xff3A396A),
        900: Color(0xff3A396A),
      });
}

extension HexColor on Color {
  /// String is in the format "aabbcc" or "ffaabbcc" with an optional leading "#".
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  /// Prefixes a hash sign if [leadingHashSign] is set to `true` (default is `true`).
  // String toHex({bool leadingHashSign = true}) =>
  //     '${leadingHashSign ? '#' : ''}'
  // '${alpha.toRadixString(16).padLeft(2, '0')}'
  // '${red.toRadixString(16).padLeft(2, '0')}'
  // '${green.toRadixString(16).padLeft(2, '0')}'
  // '${blue.toRadixString(16).padLeft(2, '0')}';

  // static void configLoading() {
  //   // EasyLoading.instance
  //   // ..loadingStyle = EasyLoadingStyle.light
  //   // ..maskType = EasyLoadingMaskType.custom
  //   // ..backgroundColor = Colors.white.withOpacity(0.9)
  //   // ..maskColor = Colors.transparent.withOpacity(0.3)
  //   // ..fontSize = 10
  //   // ..indicatorColor = Colors.transparent
  //   // ..indicatorWidget = Column(
  //   //   mainAxisSize: MainAxisSize.min,
  //   //   children: [
  //   //     Image.asset(
  //   //       AssetPaths.no_image,
  //   //       width: 50,
  //   //       height: 50,
  //   //     ),
  //   //     const LoadingDots(),
  //   //   ],
  //   // )
  //   // ..textColor = Colors.black87
  //   // ..userInteractions = false
  //   // ..dismissOnTap = false
  //   // ..animationStyle = EasyLoadingAnimationStyle.scale
  //   // ..displayDuration = const Duration(milliseconds: 500);
  //   EasyLoading.instance
  //     ..displayDuration = const Duration(milliseconds: 2000)
  //     ..indicatorType = EasyLoadingIndicatorType.fadingCircle
  //     ..loadingStyle = EasyLoadingStyle.dark
  //     ..indicatorSize = 45.0
  //     ..radius = 10.0
  //     ..progressColor = Colors.yellow
  //     ..backgroundColor = Colors.green
  //     ..indicatorColor = Colors.yellow
  //     ..textColor = Colors.yellow
  //     ..maskColor = Colors.blue.withOpacity(0.5)
  //     ..userInteractions = true
  //     ..dismissOnTap = false;
  // }

  // scam gaurd app colors
}
