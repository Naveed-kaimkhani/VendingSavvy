class RegularExpressions {
  RegularExpressions._();
  static RegExp PASSWORD_VALID_REGIX =
      // RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
      RegExp(
    r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[^A-Za-z0-9]).{8,}$',
  );
  static RegExp EMAIL_VALID_REGIX = RegExp(
      r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?");

  static RegExp USER_NAME_REGEX = RegExp(r'^[a-zA-Z0-9_]{4,16}$');

  static RegExp SPECIAL_CHARACTERS_REGEX =
      RegExp(r'[!@#\$%^&*()_+{}\[\]:;<>,.?~\\|]');

  //Email Regex Expression
  static RegExp EMAIL_REGEX_EXPRESSION = RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');

  //Password Regex Expression
  static RegExp PASSWORD_REGEX_EXPRESSION =
      RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');

  //Phone No Regex Expression
  static RegExp PHONE_NO_REGEX_EXPRESSION = RegExp(r'^[+][0-9]*$');

  //Special Characters Regex Expression
  static RegExp SPECIAL_CHARACTERS_REGEX_EXPRESSION = RegExp(r'[^\d]');

  //Disallow spaces
  static RegExp DISALLOW_SPACES = RegExp(r"\s");

  //Only Allow Characters
  static RegExp ALLOW_CHARACTERS = RegExp(r"[a-zA-Z\s]");

  //Employee ID
  static RegExp EMPLOYEE_ID_REGEX = RegExp(r'^[a-zA-Z0-9]+$');
}
