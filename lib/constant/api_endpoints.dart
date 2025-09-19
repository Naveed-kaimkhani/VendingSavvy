class ApiEndpoints {
  // static const baseApiURL = 'https://apistreetspot.myftp.org/v1/api';

  static const baseApiURL = 'http://31.220.31.37:3001/v1/api';

  static const signup = '$baseApiURL/auth/sign-up';
  static const login = '$baseApiURL/auth/sign-in';
  static const addBusiInfo = '$baseApiURL/business';

  static const forgotPassword = '$baseApiURL/auth/forgot-password';

  static const resetPassword = '$baseApiURL/auth/reset-password';

  static const truckInformation = '$baseApiURL/truck-information/handler';

  static const dashboard = '$baseApiURL/truck-information/dashboard';
}
