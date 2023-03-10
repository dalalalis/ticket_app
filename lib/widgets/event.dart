import 'package:flutter/material.dart';
import 'package:ticket_app/models/event.dart';
import 'package:go_router/go_router.dart';

//>>>>>>>> add beautificaions to image
//========= django date time doesnt loook nice
class EventsView extends StatelessWidget {
  const EventsView({super.key, required this.event});
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
            print('+++++++++');
            print(event.id);
            context.push('/eventlist/detailed/', extra: event);
            //push to the detailed_event_page.
            //send event id to be used in the detailed page.
          },
          child: Column(
            children: [
              SizedBox(
                height: 120,
                child: Image(
                  fit: BoxFit.contain,
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
