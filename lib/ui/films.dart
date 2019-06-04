import 'package:cinnamon/api/cinnema_api.dart';
import 'package:cinnamon/models/film.dart';
import 'package:cinnamon/shared/ui.dart';
import 'package:cinnamon/ui/film_file.dart';
import 'package:flutter/material.dart';

class Films extends StatefulWidget {
  @override
  _FilmsState createState() => _FilmsState();
}

class _FilmsState extends State<Films> {
  List<Film> _films = [];

  @override
  void initState() {
    super.initState();
    CinnemaApi.getFilms()
        .then((films) => setState(() => _films = films))
        .catchError((error) => UIUtils.notifyError('Error getting genres'));
  }

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: ListView.builder(
          padding: const EdgeInsets.only(bottom: 50.0),
          itemCount: _films.length,
          itemBuilder: (BuildContext context, int index) {
            final film = _films[index];
            return FilmTile(film);
          })
    );
  }
}
