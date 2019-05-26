import 'dart:convert';

import 'package:cinnamon/models/user.dart';
import 'package:http/http.dart' as http;

class CinnemaApi {
  static final baseUrl = "http://192.168.1.66:8080";
  static final headers = {
    "Accept": "application/json",
    "content-type": "application/json"
  };

  static Future<User> login(String email, String password) async {
    var body = jsonEncode({'email': email, 'password': password});
    final response =
        await http.post('$baseUrl/login', body: body, headers: headers);

    if (response.statusCode == 200) {
      return User.fromJSON(json.decode(response.body));
    } else {
      throw Exception('Failed to login');
    }
  }
}
