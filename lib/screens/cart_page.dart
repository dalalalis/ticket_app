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
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: SlideCountdown(
                duration: Duration(seconds: 10),
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Colors.blue),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Event: ${widget.ticket.event}',
                        style: Styles.headLineStyle),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Seller: ${widget.ticket.owner}',
                        style: Styles.headLineStyle2),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Delivery Method: ${widget.ticket.delivery}',
                        style: Styles.headLineStyle2),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Order Number: ${widget.ticket.id}',
                        style: Styles.headLineStyle3),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Total Price:${widget.ticket.price}',
                        style: Styles.headLineStyle3),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                        'Ticket Details: ${widget.ticket.ticketdetails}',
                        style: Styles.headLineStyle3),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                        'By purchasing the ticket you are accepting the Terms and Conditions',
                        style: Styles.headLineStyle3),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: ElevatedButton(
                onPressed: () async {
                  // await context.read<OrderProvider>().addOrder(ticket: widget.ticket)
                },
                child: Text('Purchase Ticket'),
              ),
            ),
            Text('you will redirected to the payment gate way'),
          ],
        ),
      ),
    );
  }
}
