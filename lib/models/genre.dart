import 'dart:convert';

List<Genre> genresFromJson(String str) =>
    new List<Genre>.from(json.decode(str).map((x) => Genre.fromJson(x)));

class Genre {
  int id;
  String genre;

  Genre({this.id, this.genre});

  factory Genre.fromJson(Map<String, dynamic> json) {
    return Genre(id: json["id"], genre: json["genre"]);
  }
}

class LocalGenre {
  Genre rawGenre;
  bool isFavorite;

  LocalGenre({this.rawGenre, this.isFavorite});
}