import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:go_router/go_router.dart';
import 'package:ticket_app/utils/app_styling.dart';

class EventDetails extends StatefulWidget {
  const EventDetails({super.key});

  @override
  State<EventDetails> createState() => _EventDetailsState();
}

class _EventDetailsState extends State<EventDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Styles.bgColor,
          actions: [
            IconButton(
                onPressed: () {
                  context.push('/cart/');
                },
                icon: Icon(Icons.shopping_bag_outlined,
                    size: 40, color: Colors.grey))
          ],
        ),
        body: Scrollbar(
          isAlwaysShown: true,
          child: ListView.builder(
            itemCount: 50,
            itemBuilder: ((context, index) =>
                Text('Hello', style: Styles.headLineStyle2)),
          ),
        ));
  }
}
