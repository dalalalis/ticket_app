import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:ticket_app/widgets/myticket_sell.dart';

class MyTickets extends StatelessWidget {
  const MyTickets({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('My Listed Tickets')),
      // body:ListView.builder(
      // itemBuilder:(context, index) => MyTicketsForSale(ticket: ticket), )
    );
  }
}
