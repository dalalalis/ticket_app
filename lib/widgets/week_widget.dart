import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ticket_app/models/event.dart';

class WeekEvent1 extends StatelessWidget {
  WeekEvent1({
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
              context.push('');
              print('tapped events');
            },
            child: Column(
              children: [
                SizedBox(
                  height: 99,
                  width: 300,
                  child: Image(
                    fit: BoxFit.cover,
                    image: AssetImage('lib/assets/newyearwalk.jpeg'),
                  ),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    "Jan 1st Marathon",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
                Text('Souq Sharq'),
                Text('Kuwait'),
                Text('2023-01-01')
              ],
            ),
          ),
        ),
      ),
    );
  }
}
