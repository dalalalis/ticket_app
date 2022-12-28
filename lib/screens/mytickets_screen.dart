import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ticket_app/providers/myticket_provider.dart';
import 'package:ticket_app/widgets/myticket_sell.dart';

class MyTickets extends StatefulWidget {
  const MyTickets({super.key});

  @override
  State<MyTickets> createState() => _MyTicketsState();
}

class _MyTicketsState extends State<MyTickets> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<MyTicketProvider>().loadTickets();
    });
  }

  @override
  Widget build(BuildContext context) {
    var myticket = context.watch<MyTicketProvider>().tickets;
    return Scaffold(
        appBar: AppBar(title: Text('My Listed Tickets')),
        body: ListView.builder(
          itemCount: myticket.length,
          itemBuilder: (context, index) =>
              MyTicketsForSale(ticket: myticket[index]),
        ));
  }
}
