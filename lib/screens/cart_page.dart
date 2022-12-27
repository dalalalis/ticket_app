import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:go_router/go_router.dart';
import 'package:slide_countdown/slide_countdown.dart';
import 'package:ticket_app/models/ticket.dart';
import 'package:ticket_app/utils/app_styling.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({
    Key? key,
    required this.ticket,
  }) : super(key: key);
  final Tickets ticket;

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  Timer? timer;
  @override
  void initState() {
    super.initState();
    timer = Timer(const Duration(seconds: 10), () {
      context.pop();

      /// Navigate to seconds screen when timer callback in executed
    });
  }

  /// cancel the timer when widget is disposed,
  /// to avoid any active timer that is not executed yet
  @override
  void dispose() {
    super.dispose();

    timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Styles.bgColor,
          title: SlideCountdown(
            duration: Duration(seconds: 10),
          )),
      body: Container(
        child: Column(children: [
          Text(
            'Order summary',
            style: Styles.headLineStyle,
          ),
          Text('{ticket.event.name}', style: Styles.headLineStyle),
          Text('{ticket.description}', style: Styles.headLineStyle2),
          Text('{ticket.deliverymethod}', style: Styles.headLineStyle2),
          Text('{ticket.Event.venue}', style: Styles.headLineStyle3),
          Text('{ticket.Event.startdatetime}', style: Styles.headLineStyle3),
          Text('Terms and Conditions', style: Styles.headLineStyle3),
        ]),
      ),
    );
  }
}
