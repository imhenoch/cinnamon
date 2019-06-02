import 'package:flutter/material.dart';
import 'package:cinnamon/models/film.dart';

class FilmPage extends StatelessWidget {
  final Film _film;

  FilmPage(this._film);

  Widget _rating() {
    return Column(
      children: [
        Text(
            "Rating",
            style: TextStyle(fontSize: 20)
        ),
        Text(
            "${_film.rating.rating}",
            style: TextStyle(fontSize: 16)
        )
      ]
    );
  }
  
  Widget _genres() {
    String genres = "";
    _film.genres.forEach((genre) => genres += "${genre.genre}, ");
    return Column(
        children: [
          Text(
              "Genres",
              style: TextStyle(fontSize: 20)
          ),
          Text(
              "${genres.substring(0, genres.length - 2)}",
              style: TextStyle(fontSize: 16)
          )
        ]
    );
  }

  Widget _languages() {
    String languages = "";
    _film.languages.forEach((language) => languages += "${language.language}, ");
    return Column(
        children: [
          Text(
              "Languages",
              style: TextStyle(fontSize: 20)
          ),
          Text(
              "${languages.substring(0, languages.length - 2)}",
              style: TextStyle(fontSize: 16)
          )
        ]
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Details")
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Card(
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
                      child: Wrap(
                          spacing: 16,
                          direction: Axis.vertical,
                          crossAxisAlignment: WrapCrossAlignment.center,
                          runAlignment: WrapAlignment.center,
                          children: [
                            Text(
                                _film.name,
                                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)
                            ),
                            _rating(),
                            _genres(),
                            _languages()
                          ]
                      ),
                    ),
                  )
                ],
              ),
            )
          ]
        ),
      ),
    );
  }
}