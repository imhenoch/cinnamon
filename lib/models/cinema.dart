import 'dart:convert';

Cinema cinemaFromJson(String str) => Cinema.fromJson(json.decode(str));

String cinemaToJson(Cinema data) => json.encode(data.toJson());

class Cinema {
  int id;
  String name;
  int row;
  int column;

  Cinema({
    this.id,
    this.name,
    this.row,
    this.column,
  });

  factory Cinema.fromJson(Map<String, dynamic> json) => new Cinema(
        id: json["id"],
        name: json["name"],
        row: json["row"],
        column: json["column"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "row": row,
        "column": column,
      };
}
