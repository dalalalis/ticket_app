import 'dart:io';

import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:ticket_app/models/event.dart';
import 'package:ticket_app/models/ticket.dart';
import 'package:ticket_app/providers/authprovider.dart';
import 'package:ticket_app/providers/client.dart';
import 'package:ticket_app/providers/event_provider.dart';
import 'package:ticket_app/providers/ticket_provider.dart';
import 'package:ticket_app/screens/Signin_screen.dart';
import 'package:ticket_app/screens/bottom_bar.dart';
import 'package:ticket_app/screens/cart_page.dart';
import 'package:ticket_app/screens/create_event.dart';
import 'package:ticket_app/screens/create_ticket.dart';
import 'package:ticket_app/screens/ticket_screen.dart';
import 'package:ticket_app/screens/home_screen.dart';
import 'package:ticket_app/screens/signup_screen.dart';
import 'package:ticket_app/screens/viewall_event_page.dart';
import 'package:ticket_app/utils/app_styling.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // if (Platform.isAndroid) {
  //   Client.dio.options.baseUrl = "http://10.0.2.2:8000/";
  // } else if (Platform.isIOS) {
  //   Client.dio.options.baseUrl = "http://localhost:8000/";
  // }

  var authProvider = AuthProvider();
  var authorized = await authProvider.hasToken();
  print("Authorized $authorized");

  runApp(MyApp(
    authProvider: authProvider,
    intitialRoute: authorized ? "/" : "/",
  ));
}

final router = GoRouter(routes: [
  GoRoute(path: '/', builder: ((context, state) => Signin())),
  GoRoute(path: '/signup', builder: ((context, state) => Signup())),
  GoRoute(
      path: '/home',
      builder: ((context, state) => MyHomePage(title: 'ticket'))),
  GoRoute(path: '/eventlist', builder: ((context, state) => EventListView())),
  GoRoute(
      path: '/eventlist/create', builder: ((context, state) => CreateEvent())),
  GoRoute(
      path: '/cart',
      builder: ((context, state) =>
          CheckoutPage(ticket: state.extra as Tickets))),
  GoRoute(
      path: '/eventlist/detailed',
      builder: ((context, state) => TicketPage(event: state.extra as Events))),
  GoRoute(
    path: '/signup',
    builder: (context, state) => Signup(),
  ),
  GoRoute(path: '/signin', builder: ((context, state) => Signin())),
  GoRoute(
    path: '/addticket',
    builder: (context, state) => AddTicket(),
  ),
]);

class MyApp extends StatelessWidget {
  final String intitialRoute;
  final AuthProvider authProvider;

  MyApp({required this.intitialRoute, required this.authProvider});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => authProvider),
        ChangeNotifierProvider(create: (context) => EventProvider()),
        ChangeNotifierProvider(create: (context) => TicketProvider()),
        // add the rest of the providers here
      ],
      child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            primaryColor: primary,
          ),
          routerConfig: router),
    );
  }
}
