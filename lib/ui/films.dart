import 'package:cinnamon/api/cinnema_api.dart';
import 'package:flutter/material.dart';

class Films extends StatefulWidget {
  @override
  _FilmsState createState() => _FilmsState();
}

class _FilmsState extends State<Films> {
  @override
  Widget build(BuildContext context) {
    CinnemaApi.getFilms().then((films) => print(films));
    return Text("FILMS");
  }
}
