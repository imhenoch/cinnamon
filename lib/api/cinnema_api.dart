import 'dart:convert';

import 'package:cinnamon/models/film.dart';
import 'package:cinnamon/models/genre.dart';
import 'package:cinnamon/models/user.dart';
import 'package:cinnamon/shared/constants.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class CinnemaApi {
  static final _baseUrl = "http://192.168.1.67:8080";
  static var _headers = {
    "Accept": "application/json",
    "content-type": "application/json",
  };

  static Future<User> login(
      String email, String password, bool saveLogin) async {
    var body = jsonEncode({'email': email, 'password': password});
    final response =
        await http.post('$_baseUrl/login', body: body, headers: _headers);

    if (response.statusCode == 200) {
      var user = User.fromJson(json.decode(response.body));
      await _saveLogin(user, saveLogin);
      _headers["Authorization"] = "Bearer ${user.token}";

      return user;
    } else {
      throw Exception('Failed to login');
    }
  }

  static Future _saveLogin(User user, bool saveLogin) async {
    var preferences = await SharedPreferences.getInstance();
    preferences.setString(Constants.EMAIL_PREFERENCE, user.email);
    preferences.setInt(Constants.ID_PREFERENCE, user.id);
    if (saveLogin) {
      preferences.setString(Constants.TOKEN_PREFERENCE, user.token);
    }
  }

  static Future removeLogin() async {
    var preferences = await SharedPreferences.getInstance();
    preferences.remove(Constants.EMAIL_PREFERENCE);
    preferences.remove(Constants.TOKEN_PREFERENCE);
    preferences.remove(Constants.ID_PREFERENCE);
  }

  static Future<List<LocalGenre>> getGenres() async {
    final response = await http.get('$_baseUrl/genre', headers: _headers);

    if (response.statusCode == 200) {
      var genres = genresFromJson(response.body);
      var favoriteGenres = [];
      await _getFavoriteGenres()
          .then((genres) => favoriteGenres.addAll(genres))
          .catchError((error) {});
      List<LocalGenre> localGenres = [];
      genres.forEach((genre) {
        localGenres.add(LocalGenre(
            rawGenre: genre, isFavorite: favoriteGenres.contains(genre.genre)));
      });
      return localGenres;
    } else {
      throw Exception('Failed to get genres');
    }
  }

  static Future<List<Film>> getFilms() async {
    final response = await http.get('$_baseUrl/film', headers: _headers);

    if (response.statusCode == 200) {
      return filmsFromJson(response.body);
    } else {
      throw Exception('Failed to get films');
    }
  }

  static Future<List<String>> _getFavoriteGenres() async {
    var preferences = await SharedPreferences.getInstance();
    var favoriteGenres = [];
    if (preferences.containsKey(Constants.FAVORITE_GENRES_PREFERENCE)) {
      favoriteGenres =
          preferences.getStringList(Constants.FAVORITE_GENRES_PREFERENCE);
    }
    return favoriteGenres;
  }

  static void saveFavoriteGenre(Genre genre) async {
    var preferences = await SharedPreferences.getInstance();
    List<String> favoriteGenres = [];
    if (preferences.containsKey(Constants.FAVORITE_GENRES_PREFERENCE)) {
      favoriteGenres =
          preferences.getStringList(Constants.FAVORITE_GENRES_PREFERENCE);
    }
    favoriteGenres.add(genre.genre);
    preferences.setStringList(
        Constants.FAVORITE_GENRES_PREFERENCE, favoriteGenres);
  }

  static void removeFavoriteGenre(Genre genre) async {
    var preferences = await SharedPreferences.getInstance();
    List<String> favoriteGenres =
        preferences.getStringList(Constants.FAVORITE_GENRES_PREFERENCE);
    favoriteGenres.remove(genre.genre);
    preferences.setStringList(
        Constants.FAVORITE_GENRES_PREFERENCE, favoriteGenres);
  }

  static Future<void> loadToken() async {
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

  static Future<bool> isFirstTime() async {
    var preferences = await SharedPreferences.getInstance();
    var isFirstTime = preferences.containsKey(Constants.FIRST_TIME_PREFERENCE);
    if (!isFirstTime)
      preferences.setBool(Constants.FIRST_TIME_PREFERENCE, true);
    return !isFirstTime;
  }
}
