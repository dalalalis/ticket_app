import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ticket_app/models/event.dart';

class WeekEvent extends StatelessWidget {
  const WeekEvent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 200,
      child: Container(
        height: 10,
        child: Card(
          child: InkWell(
            onTap: () {
              context.push('/eventlist/detailed/');
              print('tapped events');
            },
            child: Column(
              children: [
                Spacer(),
                Image(
                  image: AssetImage(''),
                  height: 100,
                  width: 140,
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    "Event Name",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
                Text('venues'),
                Text('location Country')
              ],
            ),
          ),
        ),
      ),
    );
  }
}
