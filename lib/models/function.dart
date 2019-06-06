import 'dart:convert';

import 'package:cinnamon/models/cinema.dart';
import 'package:cinnamon/models/film.dart';

List<TheFunction> functionsFromJson(String str) => new List<TheFunction>.from(json.decode(str).map((x) => TheFunction.fromJson(x)));

String functionsToJson(List<TheFunction> data) => json.encode(new List<dynamic>.from(data.map((x) => x.toJson())));

class TheFunction {
  int id;
  Cinema cinema;
  Film film;
  String date;

  TheFunction({
    this.id,
    this.cinema,
    this.film,
    this.date,
  });

  factory TheFunction.fromJson(Map<String, dynamic> json) => new TheFunction(
        id: json["id"],
        cinema: Cinema.fromJson(json["cinema"]),
        date: json["date"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "cinema": cinema.toJson(),
        "date": date,
      };
}
