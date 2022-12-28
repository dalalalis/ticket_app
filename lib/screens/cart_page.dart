import 'dart:async';
import 'package:flutter/material.dart';
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
  Duration popDuration = Duration(seconds: 20);
  @override
  void initState() {
    super.initState();
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
            duration: popDuration,
          )),
      body: Container(
        child: Column(children: [
          Text(
            'Order summary',
            style: Styles.headLineStyle,
          ),
          Text('${widget.ticket.event}', style: Styles.headLineStyle),
          Text('${widget.ticket.owner}', style: Styles.headLineStyle2),
          Text('${widget.ticket.delivery}', style: Styles.headLineStyle2),
          Text('${widget.ticket.event}', style: Styles.headLineStyle3),
          Text('${widget.ticket.price}', style: Styles.headLineStyle3),
          Text('Terms and Conditions', style: Styles.headLineStyle3),
          ElevatedButton(
            onPressed: () async {
              // await context.read<OrderProvider>().addOrder(ticket: widget.ticket)
            },
            child: Text('data'),
          )
        ]),
      ),
    );
  }
}
