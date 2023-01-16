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
    //String manipulation
    // String datestring = "2023-01-20T07:19:39Z";

    // var tokens = datestring.split("T");

    // var dateString = tokens[0]; //2023-01-20
    // var dateTokens = dateString.split('-');
    // var year = dateTokens[0];
    // var month = dateTokens[1];
    // var day = dateTokens[2];

    // var timeString = tokens[1].substring(0, tokens[1].length - 1); //"07:19:39"

    // var timeTokens = timeString.split(":");
    // var hours = timeTokens[0];
    // var monites = timeTokens[1];
    // var seconds = timeTokens[2];

    return Container(
      margin: EdgeInsets.all(4),
      width: 210,
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: () {
            print('+++++++++');
            print(event.id);
            context.push('/eventlist/detailed/', extra: event);
            //push to the detailed_event_page.
            //send event id to be used in the detailed page.
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Image(
                  fit: BoxFit.cover,
                  image: NetworkImage("${event.image}"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  '${event.title}',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
              Text(
                '${event.startDate.year}-${event.startDate.month}-${event.startDate.day} ${event.startDate.hour}:${event.startDate.minute}',
                textAlign: TextAlign.center,
              ),
              Text(
                '${event.venue}',
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Text(
                  '${event.city}, ${event.country}',
                  textAlign: TextAlign.center,
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
