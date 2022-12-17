import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../utils/app_styling.dart';

class MyTicketView extends StatelessWidget {
  const MyTicketView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(children: [
      Container(
          padding: EdgeInsets.only(left: 20, right: 20, top: 20),
          child: Text('My Tickets', style: Styles.headLineStyle)),
      SizedBox(height: 10),
      Container(
        child: FittedBox(
          child: Container(
            padding: EdgeInsets.all(5),
            child: Row(
              children: [
                //upcoming tickets
                Container(
                    padding: EdgeInsets.all(10),
                    width: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white,
                    ),
                    child: Center(child: Text('Upcoming'))),
                //past tickets
                Container(
                    padding: EdgeInsets.all(10),
                    width: 200,
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.horizontal(right: Radius.circular(30)),
                      color: Colors.transparent,
                    ),
                    child: Center(child: Text('Past')))
              ],
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Color(0xFFF4F6FD)),
          ),
        ),
      ),
    ]));
  }
}
