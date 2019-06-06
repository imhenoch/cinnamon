import 'package:cinnamon/api/cinnema_api.dart';
import 'package:cinnamon/models/function.dart';
import 'package:cinnamon/models/film.dart';
import 'package:cinnamon/shared/ui.dart';
import 'package:flutter/material.dart';

class SeatsPage extends StatelessWidget {
  final TheFunction function;
  final Film film;

  SeatsPage(this.function, this.film);

  _seatSelection(int row, int column) {
    CinnemaApi.saveTicket(film.name, row, column, function.date, function.cinema.name).then((result) {
      if (result)
        UIUtils.notifyInfo("Ticket bought");
      else
        UIUtils.notifyError("That seat is ocupied");
    }).catchError((error) => UIUtils.notifyError("Error buying the ticket"));
  }

  List<Widget> _availableSeats() {
    List<Widget> seats = [];
    var rows = function.cinema.row;
    var columns = function.cinema.column;
    for (int i = 1; i <= rows; i++) {
      for (int j = 1; j <= columns; j++) {
        seats.add(FlatButton(
            onPressed: () => _seatSelection(i, j),
            child: Row(
              children: [
                Text("$rows - $columns", style: TextStyle(fontSize: 16))
              ],
            )));
      }
    }

    return seats;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Seats")),
      body: Container(
        padding: EdgeInsets.all(8.0),
        child: Column(children: [
          Card(
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                    child: Wrap(
                        direction: Axis.vertical,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        runAlignment: WrapAlignment.center,
                        children: _availableSeats()),
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
