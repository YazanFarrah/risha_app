class ApiPaths {
  static String baseUrl = "https://event-at.com/api/";

  static const String signup = 'auth/signup';
  static const String login = 'auth/login';
  static const String getUserData = 'auth/';
  static const String doesEmailExist = 'email-existance';

  //events
  static const String fetchPrivacyPolicy = 'policy';
  static const String fetchTermsOfUse = 'terms';

  //categories
  static const String fetchCities = 'cities';
  static const String fetchCategories = 'categories';
}
