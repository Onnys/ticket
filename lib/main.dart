import 'package:flutter/material.dart';
import 'package:ticket/screens/ticket.dart';

main() => (runApp(Ticket()));

class Ticket extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TicketDesign(),
    );
  }
}

