import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:go_router/go_router.dart';
import 'package:ticket_app/models/order.dart';
import 'package:ticket_app/models/ticket.dart';

class OrderWidget extends StatelessWidget {
  OrderWidget({super.key, required this.order, required this.ticket});
  final Order order;
  final Tickets ticket;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(5.0),
        width: 200,
        height: 120,
        child: Container(
          height: 10,
          child: Card(
            child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 12),
              child: Column(children: [
                Row(
                  children: [
                    Text(
                      '${ticket.ticketdetails}',
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                    ),
                    Text(
                      '${ticket.price}',
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                    ),
                    Text(
                      '${ticket.event}',
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'order number${order.ticket}',
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                    ),
                    // Icon(Icons.verified_outlined),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'Seller: ${order.date_created} ',
                      style: TextStyle(color: Colors.blueAccent, fontSize: 14),
                    ),
                    Spacer(),
                    //======== add to django

                    Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Row(
                        children: [
                          Text('${ticket.price} KD',
                              style: TextStyle(
                                  fontWeight: FontWeight.w800, fontSize: 17)),
                          Spacer(),
                          Text('${ticket.delivery}'),
                        ],
                      ),
                    )
                  ],
                ),
              ]),
            ),
          ),
        ));
  }
}
