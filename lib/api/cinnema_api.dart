import 'dart:convert';

import 'package:cinnamon/models/genre.dart';
import 'package:cinnamon/models/user.dart';
import 'package:cinnamon/shared/constants.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class CinnemaApi {
  static final baseUrl = "http://192.168.1.66:8080";
  static var _headers = {
    "Accept": "application/json",
    "content-type": "application/json",
  };

  static Future<User> login(String email, String password) async {
    var body = jsonEncode({'email': email, 'password': password});
    final response =
        await http.post('$baseUrl/login', body: body, headers: _headers);

    if (response.statusCode == 200) {
      var user = User.fromJson(json.decode(response.body));
      var preferences = await SharedPreferences.getInstance();
      preferences.setString(Constants.EMAIL_PREFERENCE, user.email);
      preferences.setInt(Constants.ID_PREFERENCE, user.id);
      preferences.setString(Constants.TOKEN_PREFERENCE, user.token);
      _headers["Authorization"] = "Bearer ${user.token}";

      return user;
    } else {
      throw Exception('Failed to login');
    }
  }

  static Future<List<Genre>> getGenres() async {
    final response = await http.get('$baseUrl/genre', headers: _headers);

    if (response.statusCode == 200) {
      return genresFromJson(response.body);
    } else {
      throw Exception('Failed to get genres');
    }
  }

  static void loadToken() async {
    var preferences = await SharedPreferences.getInstance();
    _headers["Authorization"] =
        "Bearer ${preferences.getString(Constants.TOKEN_PREFERENCE)}";
  }

  static Future<User> getUser() async {
    var preferences = await SharedPreferences.getInstance();
    return User(
        id: preferences.getInt(Constants.ID_PREFERENCE),
        email: preferences.getString(Constants.EMAIL_PREFERENCE),
        token: "");
  }
}
