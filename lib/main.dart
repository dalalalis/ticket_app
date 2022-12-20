import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ticket_app/screens/bottom_bar.dart';
import 'package:ticket_app/screens/cart_page.dart';
import 'package:ticket_app/screens/create_event.dart';
import 'package:ticket_app/screens/event_details.dart';
import 'package:ticket_app/screens/home_screen.dart';
import 'package:ticket_app/screens/ticket_list.dart';
import 'package:ticket_app/screens/viewall_event_page.dart';
import 'package:ticket_app/utils/app_styling.dart';

void main() {
  //----------> code missing check previous project
  runApp(const MyApp());
}

final router = GoRouter(routes: [
  GoRoute(
      path: '/', builder: ((context, state) => MyHomePage(title: 'ticket'))),
  GoRoute(path: '/eventlist', builder: ((context, state) => EventListView())),
  GoRoute(
      path: '/eventlist/create', builder: ((context, state) => CreateEvent())),
  GoRoute(path: '/cart', builder: ((context, state) => EventDetails()))
]);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primaryColor: primary,
        ),
        routerConfig: router);
  }
}
