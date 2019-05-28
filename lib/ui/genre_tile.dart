import 'package:cinnamon/models/genre.dart';
import 'package:flutter/material.dart';
import 'package:cinnamon/api/cinnema_api.dart';

class GenreTile extends StatefulWidget {
  final LocalGenre localGenre;

  GenreTile(this.localGenre);

  @override
  _GenreTileState createState() => _GenreTileState();
}

class _GenreTileState extends State<GenreTile> {
  _favorite(LocalGenre genre) {
    if(genre.isFavorite) {
      CinnemaApi.removeFavoriteGenre(genre.rawGenre);
    } else {
      CinnemaApi.saveFavoriteGenre(genre.rawGenre);
    }
    setState(() => widget.localGenre.isFavorite = !genre.isFavorite);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0),
        child: Card(
            child: Row(
              children: [
                Expanded(
                  child: Container(
                      padding: EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
                      child: Text(
                          widget.localGenre.rawGenre.genre,
                          style: TextStyle(fontSize: 18)
                      )
                  ),
                ),
                IconButton(
                  icon: Icon(widget.localGenre.isFavorite
                      ? Icons.favorite
                      : Icons.favorite_border),
                  onPressed: () => _favorite(widget.localGenre),
                )
              ],
            )
        )
    );
  }
}
