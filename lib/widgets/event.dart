import 'package:flutter/material.dart';
import 'package:ticket_app/models/event.dart';
import 'package:go_router/go_router.dart';

//>>>>>>>> add beautificaions to image
//========= django date time doesnt loook nice
class EventsView2 extends StatelessWidget {
  const EventsView2({super.key, required this.event});
  // required this.event;
  final Events event;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(4),
      height: 230,
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
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Image(
                  image: NetworkImage("${event.image}"),
                  height: 100,
                  width: 200,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  '${event.title}',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              Text('${event.startDate}'),
              Text('${event.venue}'),
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Text(
                  '${event.city}, ${event.country}',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
