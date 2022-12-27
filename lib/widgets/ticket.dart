import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ticket_app/models/ticket.dart';
//>>>>>> flutter logic missing
//====== add number of tickets to django
//>>>>>> add number of tickets to provider

class TicketWidget extends StatelessWidget {
  TicketWidget({super.key, required this.ticket});
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
          child: InkWell(
            onTap: () {
              print('tapped ticket');
              context.push('/cart/', extra: ticket);
              //push to the detailed_event_page.
              //send event id to be used in the detailed page.
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 12),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'number of tickets {ticket.quantity}',
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 16),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'not showing${ticket.ticketDetails}',
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 20),
                      ),
                      // Icon(Icons.verified_outlined),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'Seller: ${ticket.owner} ',
                        style:
                            TextStyle(color: Colors.blueAccent, fontSize: 14),
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
                        Text('not showing delivery${ticket.deliverymethod}'),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    ));
  }
}
