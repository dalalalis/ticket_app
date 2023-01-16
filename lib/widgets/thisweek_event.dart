import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ticket_app/models/event.dart';

class WeekEvent extends StatelessWidget {
  WeekEvent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 215,
      child: Container(
        height: 10,
        child: Card(
          child: InkWell(
            onTap: () {
              context.push('');
              print('tapped events');
            },
            child: Column(
              children: [
                Expanded(
                  child: Image(
                    fit: BoxFit.fill,
                    image: AssetImage('lib/assets/newyear.jpeg'),
                    width: 200,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    "Newyear Party",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
                Text('Marina Hotel'),
                Text('Kuwait'),
                Text('2022-12-31')
              ],
            ),
          ),
        ),
      ),
    );
  }
}
