import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'package:ticket_app/models/event.dart';
import 'package:ticket_app/models/ticket.dart';
import 'package:ticket_app/providers/ticket_provider.dart';
import 'package:ticket_app/utils/app_styling.dart';
import 'package:ticket_app/widgets/ticket.dart';

class TicketPage extends StatefulWidget {
  const TicketPage({
    Key? key,
    required this.event,
  }) : super(key: key);

  final Events event;

  @override
  State<TicketPage> createState() => _TicketPageState();
}

class _TicketPageState extends State<TicketPage> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<TicketProvider>().loadTickets(event: widget.event);
    });
  }

  //for statful we need to write widget
  //>>>> why event not ticket widget

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Available Tickets}',
          ),
          foregroundColor: Colors.grey[800],
          backgroundColor: Styles.bgColor,
          // actions: [
          //   // IconButton(
          //   //     onPressed: () {
          //   //       context.push('/cart/');
          //   //     },
          //   //     icon: Icon(Icons.shopping_bag_outlined,
          //   //         size: 40, color: Colors.grey))
          // ],
        ),
        body: Column(
          children: [
            // Container(
            //     height: 100,
            //     child: Column(children: [
            //       Row(
            //         children: [Text('')],
            //       )
            //     ])),
            //>>>>>>>>>>>>>>>>>>>> add if false message (No available tickets we will notify you once they become available)

            if (true)
              Container(
                child: Expanded(
                  child: Scrollbar(
                    isAlwaysShown: true,
                    child: ListView.builder(
                      itemCount: context.watch<TicketProvider>().tickets.length,
                      itemBuilder: ((context, index) => TicketWidget(
                          ticket:
                              context.watch<TicketProvider>().tickets[index])),
                    ),
                  ),
                ),
              ),
          ],
        ));
  }
}
