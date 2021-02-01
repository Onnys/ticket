import 'package:flutter/material.dart';
import 'package:ticket/widgets/TicketShape.dart';
class TicketDesign extends StatefulWidget {
  @override
  _TicketDesignState createState() => _TicketDesignState();
}

class _TicketDesignState extends State<TicketDesign> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: TickedShape(
              image: 'assets/party.jpg',
              title: 'Sunset',
            ),
          ),
        ),
      ),
    );
  }
}

