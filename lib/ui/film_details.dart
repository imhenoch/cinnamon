import 'package:cinnamon/api/cinnema_api.dart';
import 'package:cinnamon/models/film.dart';
import 'package:flutter/material.dart';

class FilmPage extends StatefulWidget {
  final Film _film;

  FilmPage(this._film);

  @override
  _FilmPageState createState() => _FilmPageState();
}

class _FilmPageState extends State<FilmPage> {
  @override
  void initState() {
    super.initState();
    CinnemaApi.getFunctions(widget._film).then((functions) => print(functions));
  }

  Widget _rating() {
    return Column(children: [
      Text("Rating", style: TextStyle(fontSize: 20)),
      Text("${widget._film.rating.rating}", style: TextStyle(fontSize: 16))
    ]);
  }

  Widget _genres() {
    String genres = "";
    widget._film.genres.forEach((genre) => genres += "${genre.genre}, ");
    return Column(children: [
      Text("Genres", style: TextStyle(fontSize: 20)),
      Text("${genres.substring(0, genres.length - 2)}",
          style: TextStyle(fontSize: 16))
    ]);
  }

  Widget _languages() {
    String languages = "";
    widget._film.languages
        .forEach((language) => languages += "${language.language}, ");
    return Column(children: [
      Text("Languages", style: TextStyle(fontSize: 20)),
      Text("${languages.substring(0, languages.length - 2)}",
          style: TextStyle(fontSize: 16))
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Details")),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(children: [
          Card(
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
                    child: Wrap(
                        spacing: 16,
                        direction: Axis.vertical,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        runAlignment: WrapAlignment.center,
                        children: [
                          Text(widget._film.name,
                              style: TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.bold)),
                          _rating(),
                          _genres(),
                          _languages()
                        ]),
                  ),
                )
              ],
            ),
          )
        ]),
      ),
    );
  }
}
