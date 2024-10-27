class EndPoint {
  static String baseUrl = "https://todo.iraqsapp.com/";
  static String login = "auth/login";
  static String register = "auth/register";
  static String logout = "auth/logout";
  static String profile = "${baseUrl}auth/profile";
  static String addTask = "${baseUrl}todos";
  static String editTask = "${baseUrl}todos/";
  static String refreshToken(token) {
    return "auth/refresh-token?token=$token";
  }

  static String allTasksList = "todos?page=1";
}

class ApiKeys {
  static var id = "_id";
  static var phone = "phone";
  static var accessToken = "access_token";
  static var refreshToken = "refresh_token";
  static var displayName = "displayName";
  static var address = "address";
  static var level = "level";
  static var password = "password";
  static var username = "username";
  static var experienceYears = "experienceYears";
  static var title = "title";
  static var description = "desc";
  static var priority = "priority";
  static var status = "status";
  static var dueDate = "dueDate";
  static var image = "image";
}
