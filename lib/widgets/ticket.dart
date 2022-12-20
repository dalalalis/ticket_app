import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:go_router/go_router.dart';

class TicketPage extends StatelessWidget {
  const TicketPage({super.key});

  @override
  Widget build(BuildContext context) {
    return (SizedBox(
      width: 200,
      height: 250,
      child: Container(
        height: 10,
        child: Card(
          child: InkWell(
            onTap: () {
              print('tapped events');
              context.push('');
              //push to the detailed_event_page.
              //send event id to be used in the detailed page.
            },
            child: Column(
              children: [
                Spacer(),
                Image(
                  image: AssetImage('lib/assets/img_1.png'),
                  height: 100,
                  width: 140,
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    '{ticket.event}',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
                Text('{ticket.date}'),
                Text('{ticket.city}, {ticket.city}')
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
