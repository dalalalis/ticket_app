import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:ticket_app/providers/order_provider.dart';

class Order extends StatelessWidget {
  Order({super.key});
  final orderHistory = "Order History";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Orders History"),
          backgroundColor: Colors.white12,
        ),
        body: SafeArea(
            child: ListView(children: [
          Column(
            children: [Container()],
          ),
        ])));
  }
}
