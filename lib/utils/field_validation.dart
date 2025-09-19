



import 'package:vendingsavvy/utils/app_strings.dart';
import 'package:vendingsavvy/utils/regular_expression.dart';

class Validation {
  // static CreditCardValidator _ccValidator = CreditCardValidator();
  // static var cardNumberValidate, cvcValidate;

  // Phone Validation Method
  static String? phoneValidationMethod(
      {required String value, required String phoneField}) {
    if (value.trim().isEmpty) {
      // return phoneField + AppStrings.FIELD_EMPTY_ERROR_TEXT;
      return "$phoneField is required";
    } else if (value.length < 16) {
      return AppStrings.PHONE_INVALID_ERROR_TEXT;
    }
    return null;
  }

  // Email Validation Method
  static String? emailValidationMethod(
      {required String value, required String emailField}) {
    if (value.trim().isEmpty) {
      // return emailField + AppStrings.FIELD_EMPTY_ERROR_TEXT;
      return "$emailField is required";
    } else if (!RegularExpressions.EMAIL_REGEX_EXPRESSION.hasMatch(value)) {
      return AppStrings.EMAIL_INVALID_ERROR_TEXT;
    }
    return null;
  }

  static String? emailOrPhoneValidator({
    required String value,
    required String fieldLabel,
  }) {
    value = value.trim();

    if (value.isEmpty) {
      return "$fieldLabel is required";
    }

    final isPhone = RegExp(r'^[\d\s()+-]+$').hasMatch(value);

    if (isPhone) {
      if (value.length != 16) {
        return AppStrings.PHONE_INVALID_ERROR_TEXT;
      }
      return null; // Valid phone
    }

    if (!RegularExpressions.EMAIL_REGEX_EXPRESSION.hasMatch(value)) {
      // return AppStrings.EMAIL_INVALID_ERROR_TEXT;
      return "Please enter valid email or mobile number";
    }

    return null;
  }

  static String? employeeIdValidationMethod(
      {required String value, required String fieldName}) {
    if (value.trim().isEmpty) {
      return '$fieldName ${AppStrings.FIELD_EMPTY_ERROR_TEXT}';
    } else if (!RegularExpressions.EMPLOYEE_ID_REGEX.hasMatch(value)) {
      return AppStrings
          .EMAIL_INVALID_ERROR_TEXT; // Replace with a more relevant error like "Invalid Employee ID"
    }
    return null;
  }

  //Password Validation Method
  static String? passwordValidationMethod(
      {required String value, required String passwordField}) {
    if (value.trim().isEmpty) {
      return passwordField + AppStrings.FIELD_EMPTY_ERROR_TEXT;
    } else if (!RegularExpressions.PASSWORD_REGEX_EXPRESSION.hasMatch(value)) {
      return AppStrings.PASSWORD_INVALID_ERROR_TEXT;
    }
    return null;
  }

  //Confirm Password Validation Method
  static String? confirmPasswordValidationMethod(
      {required String value,
      required String passwordText,
      required String passwordField,
      required String confirmPasswordField}) {
    if (value.trim().isEmpty) {
      return confirmPasswordField + AppStrings.FIELD_EMPTY_ERROR_TEXT;
    } else if (passwordText != value) {
      return 'New ' +
          passwordField +
          " and " +
          confirmPasswordField +
          AppStrings.NOT_SAME_ERROR;
    }
    return null;
  }

  static String? confirmEmailValidationMethod(
      {required String value,
      required String emailText,
      required String emailField,
      required String confirmEmailField}) {
    if (value.trim().isEmpty) {
      return confirmEmailField + AppStrings.FIELD_EMPTY_ERROR_TEXT;
    } else if (emailText != value) {
      return "$emailField and $confirmEmailField${AppStrings.NOT_SAME_ERROR}";
    }
    return null;
  }

  //Card Number Validation Method
  // static String? cardNumberValidationMethod({required String value}) {
  //   cardNumberValidate = _ccValidator.validateCCNum(value.replaceAll(" ", ""));
  //   if (value.trim().isEmpty) {
  //     return AppStrings.CARD_NUMBER_EMPTY_ERROR;
  //   } else if (!(cardNumberValidate.isValid)) {
  //     return AppStrings.CARD_NUMBER_ERROR;
  //   }
  //   return null;
  // }

  //CVV  Validation Method
  // static String? cvvValidationMethod({required String value,required String cardNumber}) {
  //   cardNumberValidate = _ccValidator.validateCCNum(cardNumber.replaceAll(" ", ""));
  //   cvcValidate = _ccValidator.validateCVV(value, cardNumberValidate.ccType);

  //   if(value.trim().isEmpty)
  //   {
  //     return AppStrings.CVV_EMPTY_ERROR;
  //   }
  //   else if(!(cvcValidate.isValid))
  //   {

  //     return AppStrings.CVV_ERROR;
  //   }
  //   return null;
  // }

  //UserName Validation Method
  // static String? userNameValidationMethod({required String value}) {
  //   if (value.trim().isEmpty) {
  //     return AppStrings.USERNAME_EMPTY_ERROR_TEXT;
  //   } else if (!Constants.USER_NAME_REGEX_EXPRESSION.hasMatch(value)) {
  //     return AppStrings.USERNAME_INVALID_ERROR_TEXT;
  //   }else if(value.contains(" "))
  //   {
  //     return AppStrings.USERNAME_SPACE_ERROR_TEXT;
  //   }
  //   return null;
  // }

  //Phone No Validation Method
  // static String? phoneNoValidationMethod({
  //   required String value,
  // }) {
  //   if (value.trim().isEmpty) {
  //     return AppStrings.PHONE_NUMBER_EMPTY_ERROR_TEXT;
  //   } else if (!(value.length == 14)) {
  //     return AppStrings.PHONE_NUMBER_LENGTH_ERROR_TEXT;
  //   }
  //   return null;
  // }

  // static String? otpValidationMethod({required String value}) {
  //   if (value.trim().isEmpty) {
  //     return AppStrings.OTP_EMPTY_ERROR_TEXT;
  //   } else if (value.length != 6) {
  //     return AppStrings.OTP_LENGTH_ERROR_TEXT;
  //   }
  //   return null;
  // }

  //Gender Validation Method
  // static Map<String, dynamic> dropDownValidationMethod(
  //     {String? value, required String field}) {
  //   if (value == null) {
  //     return _commonErrorMethod(
  //         errorMessage: field + AppStrings.FIELD_EMPTY_ERROR,
  //         errorStatus: true);
  //   } else {
  //     return _commonErrorMethod(errorMessage: null, errorStatus: false);
  //   }
  // }

  //Card Number Validation Method
  // static Map<String, dynamic> cardNumberValidationMethod(
  //     {required String value}) {
  //   cardNumberValidate = _ccValidator.validateCCNum(value.replaceAll(" ", ""));
  //   if (value.trim().isEmpty) {
  //     return _commonErrorMethod(
  //         errorMessage: AppStrings.CARD_NUMBER_EMPTY_ERROR, errorStatus: true);
  //   } else if (!(cardNumberValidate.isValid)) {
  //     return _commonErrorMethod(
  //         errorMessage: AppStrings.CARD_NUMBER_ERROR, errorStatus: true);
  //   } else {
  //     return _commonErrorMethod(errorMessage: null, errorStatus: false);
  //   }
  // }

  //CVV Validation Method
  // static Map<String, dynamic> cvvValidationMethod(
  //     {required String value, required String cardNumber}) {
  //   cardNumberValidate =
  //       _ccValidator.validateCCNum(cardNumber.replaceAll(" ", ""));
  //   cvcValidate = _ccValidator.validateCVV(value, cardNumberValidate.ccType);
  //
  //   if (value.trim().isEmpty) {
  //     return _commonErrorMethod(
  //         errorMessage: AppStrings.CVV_EMPTY_ERROR, errorStatus: true);
  //   } else if (!(cvcValidate.isValid)) {
  //     return _commonErrorMethod(
  //         errorMessage: AppStrings.CVV_ERROR, errorStatus: true);
  //   } else {
  //     return _commonErrorMethod(errorMessage: null, errorStatus: false);
  //   }
  // }

  // //Field Validation Method
  // static String? fieldValidationMethod(
  //     {required String value, required String field}) {
  //   if (value.trim().isEmpty) {
  //     return field + AppStrings.FIELD_EMPTY_ERROR_TEXT;
  //   }
  //   return null;
  // }

  // //List Validation Method
  // static String? listValidationMethod(
  //     {List? itemList, required String field}) {
  //   if ((itemList?.length ?? 0) <= 0) {
  //     return field + AppStrings.FIELD_EMPTY_ERROR_TEXT;
  //   }
  //   return null;
  // }

  //Month Validation Method
  // static String? monthValidationMethod(
  //     {required String value, required String year}) {
  //   if (value.trim().isEmpty) {
  //     return AppStrings.EXPIRATION_MONTH_EMPTY_ERROR;
  //   }
  //   else if(year == DateTime.now().year.toString())
  //     {
  //       if(int.parse(value) < DateTime.now().month)
  //         {
  //           return AppStrings.EXPIRATION_DATE_GREATER_ERROR;
  //         }
  //     }
  //   return null;
  // }

// static Map<String, dynamic> _commonErrorMethod(
//     {String? errorMessage, bool? errorStatus}) {
//   return {"errorMessage": errorMessage, "errorStatus": errorStatus};
// }
}
