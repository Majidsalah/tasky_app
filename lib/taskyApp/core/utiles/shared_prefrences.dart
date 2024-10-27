import 'package:shared_preferences/shared_preferences.dart';

class ShPref {
  static late SharedPreferences sharedPreferences;
  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static saveAccessToken(String accessToken) {
    sharedPreferences.setString("token", accessToken);
  }

  static saveRefreshToken(String refreshToken) {
    sharedPreferences.setString("refreshToken", refreshToken);
  }

  static saveImage(String image) {
    sharedPreferences.setString("image", image);
  }

  static getAccessToken() {
    return sharedPreferences.getString("token");
  }

  static getrefreshToken() {
    return sharedPreferences.getString("refreshToken");
  }

  static getImage() {
    return sharedPreferences.get("image");
  }

  static delete(String key) {
    return sharedPreferences.remove(key);
  }

  static clearAllData() {
    return sharedPreferences.clear();
  }
}
