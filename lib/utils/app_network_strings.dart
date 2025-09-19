// ignore_for_file: constant_identifier_names

class NetworkStrings {
  //! ============== BASE URL ============== //
  static const String API_BASE_URL = "https://api.theplaynova.com/api/v1/";

  //! ============== STRIPE KEY ============== //
  static const String PUBLISH_KEY =
      "pk_test_51OeR6kLpLuFneqIFX0WJaRxa5AC6wI6AwZcLKq70gSHDJt1NVT5G9MsEEI4CUXLCj1TfHRRBZ4aAXQvLjSJqiuin00x94DWgtv";

  //! ============== SOCKET BASE URL ============== //
  static const String SOCKET_BASE_URL = "https://server1.appsstaging.com:3058/";
  static const String STRIPE_PUBLISH_KEY =
      "pk_test_51Q2Xu4CHsLZSnNQo5FV27D4LKbnvWR083g9qnpFD1S8Gsm2rCoykfBTECVSuMaYkiAX8PzXWNLMkEh2U0XuH58bW00asSx3q5R";

  //! ============== IMAGE BASE URL ============== //
  static const String NETWORK_IMAGE_BASE_URL =
      "https://server1.appsstaging.com/3148/vanvico/public/storage/";

  //! ============== API HEADER TEXT ============== //
  static const String ACCEPT = 'application/json';

  //! ============== API ENDPOINTS ============== //

  //! ============== Auth ============== //
  static const String LOGIN_ENDPOINT = "user/authenticate";
  static const String REGISTER_ENDPOINT = "user/signup";
  static const String FORGOT_PASSWORD_ENDPOINT = "user/forgot";

  //! ============== Core ============== //
  static const String HOME_ENDPOINT = "home";
  static const String VENUE_DETAIL_ENDPOINT = "venue/detail/";
  static const String ALL_GAMES_ENDPOINT = "game/all";
  static const String BOOKING_ENDPOINT = "venue/book";
  static const String GET_BOOKING_ENDPOINT = "user/bookings";
  static const String GET_FAVOURITE_ENDPOINT = "user/favourite-list";
  static const String SET_FAVOURITE_ENDPOINT = "user/set-favourite/";
  static const String GET_FRIENDS_ENDPOINT = "user/friends";
  static const String BOOKING_INVITE_ENDPOINT = "venue/booking-invite";
  static const String GET_IN_APP_NOTIFICATIONS_ENDPOINT = "user/notifications";

  //! ============== SOCKET RESPONSE KEYS ============== //
  static const String GET_MESSAGES_KEY = "get_messages";
  static const String GET_MESSAGE_KEY = "get_message";
  static const String SEND_MESSAGE_KEY = "send_message";

  //! ============== Call Stuff & Keys ============== //
  static const String GET_CALL_TOKEN_ENDPOINT = "rtctoken";
  static const String AGORA_APP_ID = "884023afa78c4b4785208d85556c27e1";
  static const String START_CALL_KEY = "start_call";
  static const String CALL_STARTED_KEY = "call_started";

  //! Socket Keys for Ride
  static const String BOOK_ON_DEMAND_REQUEST_KEY = "book_on_demand_request";
  static const String SEND_LOCATION_KEY = "send_location";
  static const String UPDATE_STATUS_KEY = "update_status";
  static const String GET_LOCATION_KEY = "get_location";
  static const String CHAT_ERROR = "Chat not found.";
  static const String RIDE_POOLING_REQUEST = "ride_pooling_request";

  ////// API STATUS CODE/////////////
  static const int SUCCESS_CODE = 200;
  static const int UNAUTHORIZED_CODE = 401;
  static const int CARD_ERROR_CODE = 402;
  static const int BAD_REQUEST_CODE = 400;
  static const int FORBIDDEN_CODE = 403;

  /////////// API MESSAGES /////////////////
  static const int API_SUCCESS_STATUS = 1;
  static const String EMAIL_UNVERIFIED = "0";
  static const String EMAIL_VERIFIED = "1";
  static const String PROFILE_INCOMPLETED = "0";
  static const String PROFILE_COMPLETED = "1";

  static const String ADMIN_APROVED = "1";
  static const String ADMIN_NOTAPROVED = "0";
  static const int USER_SUBSCRIBED = 1;
  static const int USER_NOTSUBSCRIBED = 0;

  /////////// USER PAYMENT STATUS VALUE /////////////////
  static const int PAID_USER = 1;
  static const int UN_PAID_USER = 0;
  static const int PAID_DATA = 1;
  static const int UN_PAID_DATA = 0;
  static const int GUEST_USER = 1;
  static const String ADMIN_ACTIVITY = 'admins';
  static const String USER_ACTIVITY = 'users';

  /////////// API TOAST MESSAGES //////////////////
  static const String NO_INTERNET_CONNECTION = "No Internet Connection!";
  static const String SOMETHING_WENT_WRONG = "Something Went Wrong";
  static const String STATUS_NOT_FOUND = "No Status Found";
  static const String INVALID_CARD_ERROR = "Invalid Card Details.";
  static const String CARD_TYPE_ERROR = "Wrong card type.";
  static const String INVALID_BANK_ACCOUNT_DETAILS_ERROR =
      "Invalid Bank Account Details.";
  static const String MERCHANT_ACCOUNT_ERROR =
      "Error:Merchant Account can not be created.";

//---------------- API SHOW ERROR MESSAGE -------------------//

  static const String NOTIFICATION_EMPTY_ERROR = "Notification not found";
  static const String CONTENT_EMPTY_ERROR = "Content not found";
  static const String CHAT_EMPTY_ERROR = "Chat not found";
  static const String STATUS_EMPTY_ERROR = "Stories not found";
  static const String MY_STATUS_EMPTY_ERROR = "My Stories not found";
  static const String MEDIA_EMPTY_ERROR = "Media not found";
  static const String CONNECTION_REQUEST_EMPTY_ERROR =
      "Connection Request not found";
  static const String PARTNER_EMPTY_ERROR = "Partners not found";
  static const String PENDING_PARTNER_EMPTY_ERROR =
      "Pending partners not found";
  static const String REQUEST_EMPTY_ERROR = "Requests not found";
}
