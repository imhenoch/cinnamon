import 'dart:convert';

import 'package:cinnamon/models/genre.dart';
import 'package:cinnamon/models/language.dart';
import 'package:cinnamon/models/rating.dart';

List<Film> filmFromJson(String str) =>
    new List<Film>.from(json.decode(str).map((x) => Film.fromJson(x)));

class Film {
  int id;
  String name;
  int duration;
  Rating rating;
  List<Language> languages;
  List<Genre> genres;

  Film({
    this.id,
    this.name,
    this.duration,
    this.rating,
    this.languages,
    this.genres,
  });

  factory Film.fromJson(Map<String, dynamic> json) => new Film(
        id: json["id"],
        name: json["name"],
        duration: json["duration"],
        rating: Rating.fromJson(json["rating"]),
        languages: new List<Language>.from(
            json["languages"].map((x) => Language.fromJson(x))),
        genres:
            new List<Genre>.from(json["genres"].map((x) => Genre.fromJson(x))),
      );
}
