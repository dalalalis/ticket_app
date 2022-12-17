import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class EventView extends StatelessWidget {
  const EventView({super.key});

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
              print('tapped events');
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
