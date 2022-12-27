import 'package:flutter/material.dart';
import 'package:ticket_app/models/ticket.dart';

class MyTicketsForSale extends StatelessWidget {
  MyTicketsForSale({super.key, required this.ticket});
  final Tickets ticket;

  @override
  Widget build(BuildContext context) {
    return (Container(
      margin: EdgeInsets.all(5.0),
      width: 200,
      height: 120,
      child: Container(
        height: 10,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, top: 12),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      'number of tickets {ticket.quantity}',
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'not showing${ticket.ticketdetails}',
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                    ),
                    // Icon(Icons.verified_outlined),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'Seller: ${ticket.owner} ',
                      style: TextStyle(color: Colors.blueAccent, fontSize: 14),
                    ),
                    Spacer(),
                    //======== add to django
                    if (true)
                      Icon(
                        Icons.verified_outlined,
                        color: Colors.green,
                      ),
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
                      Text('not showing delivery${ticket.delivery}'),
                      if (ticket.available = true)
                        Text("still Listed")
                      else
                        Text('Ticket Sold'),
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
