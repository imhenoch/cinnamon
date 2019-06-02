import 'package:cinnamon/models/film.dart';
import 'package:cinnamon/ui/film_details.dart';
import 'package:flutter/material.dart';

class FilmTile extends StatefulWidget {
  final Film film;

  FilmTile(this.film);

  @override
  _FilmTileState createState() => _FilmTileState();
}

class _FilmTileState extends State<FilmTile> {
  _tapFilm() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (BuildContext ctx) => FilmPage(widget.film)));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
          padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0),
          child: Card(
              child: Container(
            padding: EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
            child: Text(widget.film.name, style: TextStyle(fontSize: 18)),
          ))),
      onTap: _tapFilm,
    );
  }
}
