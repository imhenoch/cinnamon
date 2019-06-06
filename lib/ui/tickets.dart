import 'package:cinnamon/api/cinnema_api.dart';
import 'package:flutter/material.dart';
import 'package:cinnamon/models/ticket.dart';

class Tickets extends StatefulWidget {
  @override
  _TicketsState createState() => _TicketsState();
}

class _TicketsState extends State<Tickets> {
  List<Ticket> _tickets = [];

  @override
  void initState() {
    super.initState();
    CinnemaApi.getTickets()
        .then((tickets) => setState(() => _tickets = tickets))
        .catchError((error) {});
  }

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
        child: ListView.builder(
            padding: const EdgeInsets.only(bottom: 50.0),
            itemCount: _tickets.length,
            itemBuilder: (BuildContext context, int index) {
              final ticket = _tickets[index];
              return Text("${ticket.row} - ${ticket.column} - ${ticket.cinema} - ${ticket.film} - ${ticket.date}");
            })
    );
  }
}
