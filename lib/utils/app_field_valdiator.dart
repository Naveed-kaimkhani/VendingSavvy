


import 'package:vendingsavvy/utils/app_strings.dart' show AppStrings;
import 'package:vendingsavvy/utils/regular_expression.dart';

extension FieldValidator on String {
  //! ============> Email Validator
  get validateEmail {
    if (!RegularExpressions.EMAIL_VALID_REGIX.hasMatch(this) && isNotEmpty) {
      return AppStrings.EMAIL_INVALID_ERROR;
    } else if (isEmpty) {
      return AppStrings.EMAIL_EMPTY_ERROR;
    }
    return null;
  }

  //! ============> UserName Validation Method
  // String? get validateUserName {
  //   if (trim().isEmpty) {
  //     return AppStrings.USERNAME_EMPTY_ERROR_TEXT;
  //   }
  //   else if()
  //   else if (!RegularExpressions.USER_NAME_REGEX.hasMatch(this)) {
  //     return AppStrings.USERNAME_INVALID_ERROR_TEXT;
  //   }
  //   return null;
  // }

  String? get validateUserName {
    if (trim().isEmpty) {
      // return AppStrings.USERNAME_EMPTY_ERROR_TEXT;
      return "Name is required";
    } else if (trim().length < 3) {
      return "Name must be at least 3 characters";
    } else if (!RegularExpressions.USER_NAME_REGEX.hasMatch(this)) {
      return AppStrings.USERNAME_INVALID_ERROR_TEXT;
    }
    return null;
  }

  //! ============>  Empty Validator
  validateEmpty(String message) {
    if (isEmpty) {
      // var msg = "$message ${"field can't be empty."}";
      var msg = "$message ${"is required"}";
      // return tr('$message field can\"t be empty.');
      return msg;
    } else {
      return null;
    }
  }

  // VIN Validation with empty check
  String? validateVin() {
    if (this.isEmpty) {
      return "VIN cannot be empty";
    }
    final vinRegex =
        RegExp(r'^[A-HJ-NPR-Z0-9]{17}$'); // 17 characters, no I, O, Q
    if (!vinRegex.hasMatch(this)) {
      return AppStrings.INVALID_VIN;
    }
    return null;
  }

  // Registration Number Validation with empty check
  String? validateRegistrationNumber() {
    if (this.isEmpty) {
      return "Registration Number cannot be empty";
    }
    final regRegex = RegExp(r'^[A-Z0-9]+$'); // Only uppercase alphanumerics
    if (!regRegex.hasMatch(this)) {
      return AppStrings.INVALID_REGISTRATION;
    }
    return null;
  }

  //------------------ Phone Validator ---------------//
  static String? validatePhone({required String value}) {
    if (value.isEmpty) {
      return "Phone number field can't be empty.";
    } else if (value.length < 10) {
      return "The phone number must be at least 11 characters.";
    }
    return null;
  }

  //! ============> Phone Number Validator
  get validatePhoneNumber {
    final cleanedPhoneNumber = replaceAll(
        RegExp(r'[()-\s]'), ''); // Remove brackets, dashes, and spaces
    print("Number : $cleanedPhoneNumber");
    if (cleanedPhoneNumber.isEmpty) {
      return AppStrings.PHONE_NO_EMPTY_ERROR;
    }
    if (cleanedPhoneNumber.length < 10) {
      print(cleanedPhoneNumber.length.toString());
      return AppStrings.PHONE_NO_INVALID_LENGTH;
    } else {
      print(cleanedPhoneNumber.length.toString());
      return null;
    }
  }

  //! ============> URL Validations
  validateEmptyURLFacebook(String message) {
    String websiteValidationRegex =
        "https?://(?:www.|(?!www))[a-zA-Z0-9][a-zA-Z0-9-]+[a-zA-Z0-9].[^s]{2,}|www.[a-zA-Z0-9][a-zA-Z0-9-]+[a-zA-Z0-9].[^s]{2,}|https?://(?:www.|(?!www))[a-zA-Z0-9]+.[^s]{2,}|www.[a-zA-Z0-9]+.[^s]{2,}";
    RegExp regExp = RegExp(websiteValidationRegex);
    if (isEmpty) {
      return 'Facebook field can\'t be empty.';
    } else if (!regExp.hasMatch(message)) {
      return 'Please enter valid url';
    } else {
      return null;
    }
  }

  //! ============> Instagram
  validateEmptyURLInsta(String message) {
    String websiteValidationRegex =
        "https?://(?:www.|(?!www))[a-zA-Z0-9][a-zA-Z0-9-]+[a-zA-Z0-9].[^s]{2,}|www.[a-zA-Z0-9][a-zA-Z0-9-]+[a-zA-Z0-9].[^s]{2,}|https?://(?:www.|(?!www))[a-zA-Z0-9]+.[^s]{2,}|www.[a-zA-Z0-9]+.[^s]{2,}";
    RegExp regExp = RegExp(websiteValidationRegex);
    if (isEmpty) {
      return 'Instagram field can\'t be empty.';
    } else if (!regExp.hasMatch(message)) {
      return 'Please enter valid url';
    } else {
      return null;
    }
  }

  //! ============> Twitter
  validateEmptyURLTwitter(String message) {
    String websiteValidationRegex =
        "https?://(?:www.|(?!www))[a-zA-Z0-9][a-zA-Z0-9-]+[a-zA-Z0-9].[^s]{2,}|www.[a-zA-Z0-9][a-zA-Z0-9-]+[a-zA-Z0-9].[^s]{2,}|https?://(?:www.|(?!www))[a-zA-Z0-9]+.[^s]{2,}|www.[a-zA-Z0-9]+.[^s]{2,}";
    RegExp regExp = RegExp(websiteValidationRegex);
    if (isEmpty) {
      return 'Twitter field can\'t be empty.';
    } else if (!regExp.hasMatch(message)) {
      return 'Please enter valid url';
    } else {
      return null;
    }
  }

  //! ============> Feedback
  validateEmptyURLFeedback(String message) {
    String websiteValidationRegex =
        "https?://(?:www.|(?!www))[a-zA-Z0-9][a-zA-Z0-9-]+[a-zA-Z0-9].[^s]{2,}|www.[a-zA-Z0-9][a-zA-Z0-9-]+[a-zA-Z0-9].[^s]{2,}|https?://(?:www.|(?!www))[a-zA-Z0-9]+.[^s]{2,}|www.[a-zA-Z0-9]+.[^s]{2,}";
    RegExp regExp = RegExp(websiteValidationRegex);
    if (isEmpty) {
      return 'Feedback field can\'t be empty.';
    } else if (!regExp.hasMatch(message)) {
      return 'Please enter valid url';
    } else {
      return null;
    }
  }

  //! ============> Description
  String? get validateDescription {
    if (isEmpty) {
      return AppStrings.DESCRIPTION_EMPTY_ERROR;
    } else {
      return null;
    }
  }

  //! ============> OTP Validator
  String? validateOtp(String value) {
    if (value.length < 6) {
      return "Password must be of 6 characters";
    }
    return null;
  }

  static String? validateCardNo({required String value, String? label}) {
    if (value.trim().isEmpty) {
      return "$label field can't be empty.";
    } else if (value.length <= 15) {
      return "$label must be atleast 16 digits.";
    }
    return null;
  }

  //---------------- CVC Validator -----------------//
  static String? validateCVC({required String value, String? label}) {
    if (value.trim().isEmpty) {
      return "$label field can't be empty.";
    } else if (value.length <= 2) {
      return "$label must be atleast 3 digits.";
    }
    return null;
  }

  // ---------------- Routing Number Validator ----------------- //
  static String? validateRoutingNumber({required String value, String? label}) {
    // Ensure the label is meaningful or defaults to "Routing Number"
    label ??= "Routing Number";

    // Check for empty input
    if (value.trim().isEmpty) {
      return "$label field can't be empty.";
    }

    // Check if the routing number is exactly 9 digits
    final routingNumberRegex = RegExp(r'^\d{9}$');
    if (!routingNumberRegex.hasMatch(value)) {
      return "$label must be exactly 9 digits.";
    }

    return null; // Validation passed
  }
}
