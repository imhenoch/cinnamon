import 'dart:convert';

import 'package:cinnamon/models/user.dart';
import 'package:cinnamon/shared/constants.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class CinnemaApi {
  static final baseUrl = "http://192.168.1.66:8080";
  static var _token = "";
  static final headers = {
    "Accept": "application/json",
    "content-type": "application/json",
    "Authorization": "Bearer $_token"
  };

  static Future<User> login(String email, String password) async {
    var body = jsonEncode({'email': email, 'password': password});
    final response =
        await http.post('$baseUrl/login', body: body, headers: headers);

    if (response.statusCode == 200) {
      var user = User.fromJSON(json.decode(response.body));
      var preferences = await SharedPreferences.getInstance();
      preferences.setString(Constants.EMAIL_PREFERENCE, user.email);
      preferences.setInt(Constants.ID_PREFERENCE, user.id);
      preferences.setString(Constants.TOKEN_PREFERENCE, user.token);
      _token = user.token;

      return user;
    } else {
      throw Exception('Failed to login');
    }
  }

  static void loadToken() async {
    var preferences = await SharedPreferences.getInstance();
    _token = preferences.getString(Constants.TOKEN_PREFERENCE);
  }

  static Future<User> getUser() async {
    var preferences = await SharedPreferences.getInstance();
    return User(
        id: preferences.getInt(Constants.ID_PREFERENCE),
        email: preferences.getString(Constants.EMAIL_PREFERENCE),
        token: _token);
  }
}
