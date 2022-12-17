import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:ticket_app/utils/app_styling.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.bgColor,
      body: ListView(
        padding: EdgeInsets.only(left: 20, top: 40, right: 20, bottom: 20),
        children: [
          SizedBox(
            height: 40,
          ),
          Text('What are\nyou looking for?', style: Styles.headLineStyle),
          SizedBox(height: 10),
          SizedBox(height: 20),
          Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(20)),
            child: Row(
              children: [
                Icon(Icons.date_range_rounded),
                SizedBox(width: 5),
                Text('event date', style: Styles.textStyle)
              ],
            ),
          ),
          SizedBox(height: 8),
          Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child: Row(
                children: [
                  Icon(Icons.event),
                  SizedBox(width: 5),
                  Text('Type of event', style: Styles.textStyle)
                ],
              )),
          SizedBox(
            height: 8,
          ),
          Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child: Row(
                children: [
                  Icon(Icons.location_city),
                  SizedBox(width: 5),
                  Text('event city', style: Styles.textStyle)
                ],
              )),
          SizedBox(height: 20),
          ElevatedButton(
              style: ButtonStyle(),
              onPressed: () {},
              child: Text('Find Tickets'))
        ],
      ),
    );
  }
}
