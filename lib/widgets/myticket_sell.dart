import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:ticket_app/models/ticket.dart';
import 'package:ticket_app/providers/myticket_provider.dart';

class MyTicketsForSale extends StatelessWidget {
  MyTicketsForSale({super.key, required this.ticket});
  final Tickets ticket;

  @override
  Widget build(BuildContext context) {
    return (Container(
      margin: EdgeInsets.all(5.0),
      width: 200,
      height: 150,
      child: Container(
        height: 10,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, top: 12),
            child: Column(
              children: [
                Row(
                  children: [
                    if (ticket.available)
                      Text(
                        'Available',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: Colors.green),
                      )
                    else
                      (Text('Sold',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: Colors.red))),
                    SizedBox(width: 4),
                    Text('${ticket.event}'),
                    Spacer(),
                    IconButton(
                        onPressed: () {
                          context.push('/tickets/update');
                        },
                        icon: Icon(Icons.update)),
                  ],
                ),
                Row(
                  children: [
                    Row(
                      children: [
                        Text(
                          '${ticket.ticketdetails}',
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 20),
                        ),
                        IconButton(
                            onPressed: () {
                              // context.watch<MyTicketProvider>().deleteMyTicket()
                            },
                            icon: Icon(Icons.delete))
                      ],
                    ),
                    // Icon(Icons.verified_outlined),
                  ],
                ),
                Row(
                  children: [
                    // Text(
                    //   'Seller: ${ticket.owner} ',
                    //   style: TextStyle(color: Colors.blueAccent, fontSize: 14),
                    // ),
                    // Spacer(),
                    // if (true)
                    //   Icon(
                    //     Icons.verified_outlined,
                    //     color: Colors.green,
                    //   ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Row(
                    children: [
                      Text('${ticket.price} KD',
                          style: TextStyle(
                              fontWeight: FontWeight.w800, fontSize: 17)),
                      Spacer(),
                      Text('${ticket.delivery} ticket'),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
