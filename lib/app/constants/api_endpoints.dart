// ignore_for_file: non_constant_identifier_names

class ApiEndpoints {
  static String BASE_URL = "https://book-crud-service-6dmqxfovfq-et.a.run.app";

  static String get REGISTER_ENDPOINT => "$BASE_URL/api/register";
  static String get LOGIN_ENDPOINT => "$BASE_URL/api/login";
  static String get LOGOUT_ENDPOINT => "$BASE_URL/api/user/logout";
  static String get GETUSER_ENDPOINT => "$BASE_URL/api/user";
}
