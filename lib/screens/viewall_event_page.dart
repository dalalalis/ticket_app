import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:ticket_app/providers/event_provider.dart';
import 'package:ticket_app/utils/app_styling.dart';
import 'package:ticket_app/widgets/event.dart';

class EventListView extends StatelessWidget {
  const EventListView({super.key});

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
        backgroundColor: Styles.bgColor,
        body: SafeArea(
            child: Container(
                child: ListView(children: [EventsView2(), EventsView2()])

                //             .builder(
                //   itemCount: context.watch<EventProvider>().events.length,
                //   itemBuilder: ((context, index) =>
                //       EventsView2(event: context.watch<EventProvider>().events[index])),
                //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                //       crossAxisCount: 2, crossAxisSpacing: 12, mainAxisSpacing: 22),
                // ))))
                )));
  }
}
