import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AppConstants {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  static GlobalKey<NavigatorState> drawerKey = GlobalKey<NavigatorState>();

  //! ============> Standard Lengths
  static const EMAIL_MAX_LENGTH = 35;
  static const PASSWORD_MAX_LENGTH = 10;
  static const int firstnamelength = 50;
  static const int lastnamelength = 50;
  static const int usernamelength = 20;
  static const NAME_MAX_LENGTH = 30;
  static const ZIP_CODE_MAX_LENGTH = 7;
  static const DESCRIPTION_MAX_LENGTH = 275;
  static const NO_OF_FOLLOWERS_LENGTH = 9;
  static const NO_OF_GUESTS_LENGTH = 6;

  static String formatTime(int seconds) {
    int minutes = seconds ~/ 60;
    int remainingSeconds = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  static void unFocusKeyboardMethod({required BuildContext context}) {
    FocusScope.of(context).unfocus();
  }

  static const String GOOGLE_API_KEY =
      "AIzaSyDg6Ci3L6yS5YvtKAkWQjnodGUtlNYHw9Y";

  static String formatUtcTimestamp(DateTime? utcTime) {
    if (utcTime == null) return '';
    // Convert from UTC to local
    final localTime = utcTime.toLocal();
    final formatter = DateFormat('dd-MM-yyyy, HH:mm:ss');
    return formatter.format(localTime);
  }

  static String formatToDayMonthYear(DateTime date) {
    return DateFormat('d-MMM-yyyy').format(date.toLocal());
  }
}
