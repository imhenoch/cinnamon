import 'package:cinnamon/models/genre.dart';
import 'package:flutter/material.dart';

class GenreTile extends StatefulWidget {
  final LocalGenre localGenre;

  GenreTile(this.localGenre);

  @override
  _GenreTileState createState() => _GenreTileState();
}

class _GenreTileState extends State<GenreTile> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
        "${widget.localGenre.rawGenre.genre} ${widget.localGenre.isFavorite
            ? "true"
            : "false"}");
  }
}
