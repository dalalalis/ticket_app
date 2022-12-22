import 'dart:io';

import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:ticket_app/providers/authprovider.dart';
import 'package:ticket_app/providers/client.dart';
import 'package:ticket_app/providers/event_provider.dart';
import 'package:ticket_app/screens/Signin_screen.dart';
import 'package:ticket_app/screens/bottom_bar.dart';
import 'package:ticket_app/screens/cart_page.dart';
import 'package:ticket_app/screens/create_event.dart';
import 'package:ticket_app/screens/event_details.dart';
import 'package:ticket_app/screens/home_screen.dart';
import 'package:ticket_app/screens/signup_screen.dart';
import 'package:ticket_app/screens/viewall_event_page.dart';
import 'package:ticket_app/utils/app_styling.dart';

void main() async {
  //----------> code missing check previous project
  WidgetsFlutterBinding.ensureInitialized();

  if (Platform.isAndroid) {
    Client.dio.options.baseUrl = "http://10.0.2.2:8000/";
  } else if (Platform.isIOS) {
    Client.dio.options.baseUrl = "http://localhost:8000/";
  }

  var authProvider = AuthProvider();
  var authorized = await authProvider.hasToken();
  print("Authorized $authorized");

  runApp(MyApp(
    authProvider: authProvider,
    intitialRoute: authorized ? "/" : "/signup",
  ));
}

final router = GoRouter(routes: [
  GoRoute(
      path: '/', builder: ((context, state) => MyHomePage(title: 'ticket'))),
  GoRoute(path: '/eventlist', builder: ((context, state) => EventListView())),
  GoRoute(
      path: '/eventlist/create', builder: ((context, state) => CreateEvent())),
  GoRoute(path: '/cart', builder: ((context, state) => CheckoutPage())),
  GoRoute(
      path: '/eventlist/detailed',
      builder: ((context, state) => EventDetails())),
  GoRoute(
    path: '/signup',
    builder: (context, state) => Signup(),
  ),
  GoRoute(path: '/signin', builder: ((context, state) => Signin()))
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
        ChangeNotifierProvider(
          create: (context) => EventProvider(),
        ),
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
