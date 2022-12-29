import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ticket_app/providers/order_provider.dart';
import 'package:ticket_app/screens/past_tickets.dart';
import 'package:ticket_app/screens/upcoming-tickets.dart';

import '../utils/app_styling.dart';

// just call the funxtions here

class MyTicketView extends StatefulWidget {
  const MyTicketView({super.key});

  @override
  State<MyTicketView> createState() => _MyTicketViewState();
}

class _MyTicketViewState extends State<MyTicketView>
    with TickerProviderStateMixin {
  late TabController _tabController;
  final _selectedColor = const Color(0xff1a73e8);
  final _unselectedColor = const Color(0xff5f6368);
  //static final List<Widget> tabController = <Widget>[Upcoming(), PastTicket()];

  final _iconTabs = [
    // stopped here
    Tab(
      text: ("Upcoming Tickets"),
    ),
    Tab(text: ("Past Tickets")),
  ];

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          body: Column(children: [
        Expanded(
          child: ListView(shrinkWrap: true, children: [
            TabBar(
              controller: _tabController,
              tabs: _iconTabs,
              unselectedLabelColor: Colors.black,
              labelColor: _selectedColor,
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(80.0),
                color: _selectedColor.withOpacity(0.2),
              ),
            ),
          ]),
        ),
        //   ListView.builder(
        //     // itemBuilder:(context, index) =>
        //   // context.watch<OrderProvider>().orders[index])],
        // )
      ])),
    );
  }
}
