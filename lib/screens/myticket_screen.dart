import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';

import '../utils/app_styling.dart';

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

  final _iconTabs = [
    // stopped here
    Tab(text: ("Upcoming Tickets")),
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
    return Scaffold(
        body: ListView(shrinkWrap: true, children: [
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
    ]));
  }
}
