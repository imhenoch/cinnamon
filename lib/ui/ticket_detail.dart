import 'package:cinnamon/models/ticket.dart';
import 'package:flutter/material.dart';

class TicketTile extends StatelessWidget {
  final Ticket _ticket;

  TicketTile(this._ticket);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0),
        child: Card(
            child: Container(
          padding: EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
          child: Row(
            children: [
              Column(children: [
                Text("${_ticket.row} - ${_ticket.column}",
                    style: TextStyle(fontSize: 18)),
                Text("${_ticket.cinema}", style: TextStyle(fontSize: 18)),
              ]),
              Expanded(
                  child: Column(children: [
                Text("${_ticket.film}", style: TextStyle(fontSize: 18)),
                Text("${_ticket.date}", style: TextStyle(fontSize: 18)),
              ]))
            ],
          ),
        )));
  }
}
