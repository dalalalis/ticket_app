import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:ticket_app/models/ticket.dart';
import 'package:ticket_app/widgets/ticket_updateform.dart';

class TicketUpdate extends StatelessWidget {
  const TicketUpdate({super.key, required this.ticket});
  final Tickets ticket;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Update your Ticket"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const Text("Fill those field to update a book"),
            UpdateTicketForm(
              ticket: ticket,
            ),
          ],
        ),
      ),
    );
  }
}
