class ApiPaths {
  static String baseUrl = "http://212.56.40.23/api/user/";

  //auth
  static const String signup = 'register';
  static const String login = 'login';
  static const String doesEmailExist = 'email-existance';

  //events
  static const String fetchPrivacyPolicy = 'policy';
  static const String fetchTermsOfUse = 'terms';

  //categories
  static const String fetchCities = 'cities';
  static const String fetchCategories = 'categories';
  static const String allCategoriesAndUserFavoriteCategories = 'all-categories-with-favorite';
  static const String userFavoriteCategories = 'favorite-categories';
  static const String updateFavoriteCategories = 'update-favorite-categories';
  
  
  

  //user
  static const String fetchUserData = 'account';
  static const String updateAccount = 'update-account';
  static const String resetPassword = 'reset-password';

  static const String fetchTrendyQuizzesTypes = 'trendy-quiz-types';
  static const String fetchTrendyQuizzes = 'trendy-quizzes';

  
  
}
