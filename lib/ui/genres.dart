import 'package:cinnamon/api/cinnema_api.dart';
import 'package:cinnamon/models/genre.dart';
import 'package:cinnamon/shared/ui.dart';
import 'package:flutter/material.dart';
import 'package:cinnamon/ui/genre_tile.dart';

class Genres extends StatefulWidget {
  @override
  _GenresState createState() => _GenresState();
}

class _GenresState extends State<Genres> {
  List<Genre> _genres = [];

  @override
  void initState() {
    super.initState();
    CinnemaApi.getGenres()
        .then((genres) => setState(() => _genres = genres))
        .catchError((error) => UIUtils.error(error));
  }

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: ListView.builder(
        padding: const EdgeInsets.only(bottom: 50.0),
        itemCount: _genres.length,
        itemBuilder: (BuildContext context, int index) {
          final genre = _genres[index];
          return GenreTile(genre);
        },
      ),
    );
  }
}
