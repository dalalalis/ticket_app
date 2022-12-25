import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:go_router/go_router.dart';
import 'package:slide_countdown/slide_countdown.dart';
import 'package:ticket_app/utils/app_styling.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  Timer? timer;
  @override
  void initState() {
    super.initState();
    Duration popDuration = Duration(seconds: 10);
    timer = Timer(popDuration, () {
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
          Text('{Event.name}', style: Styles.headLineStyle2),
          Text('{Event.venue}', style: Styles.headLineStyle3),
          Text('{Event.datetime}', style: Styles.headLineStyle3),
          Text('Terms and Conditions', style: Styles.headLineStyle2),
        ]),
      ),
    );
  }
}
