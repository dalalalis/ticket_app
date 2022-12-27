import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:ticket_app/models/event.dart';
import 'package:go_router/go_router.dart';

class EventsView2 extends StatelessWidget {
  const EventsView2({super.key, required this.event});
  // required this.event;
  final Events event;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 250,
      child: Container(
        height: 10,
        child: Card(
          child: InkWell(
            onTap: () {
              print('tapped events');
              context.push('/eventlist/detailed/', extra: event);
              //push to the detailed_event_page.
              //send event id to be used in the detailed page.
            },
            child: Column(
              children: [
                Spacer(),
                Image(
                  image: NetworkImage("${event.image}"),
                  height: 100,
                  width: 140,
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    '${event.title}',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
                Text('${event.startDate}'),
                Text('${event.endDate}'),
                Text('${event.city}, ${event.country}')
              ],
            ),
          ),
        ),
      ),
    );
  }
}
