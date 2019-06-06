import 'dart:convert';

import 'package:cinnamon/models/cinema.dart';

List<Function> functionsFromJson(String str) => new List<Function>.from(json.decode(str).map((x) => Function.fromJson(x)));

String functionsToJson(List<Function> data) => json.encode(new List<dynamic>.from(data.map((x) => x.toJson())));

class Function {
  int id;
  Cinema cinema;
  String date;

  Function({
    this.id,
    this.cinema,
    this.date,
  });

  factory Function.fromJson(Map<String, dynamic> json) => new Function(
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
