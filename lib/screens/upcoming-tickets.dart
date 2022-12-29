import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Upcoming extends StatelessWidget {
  const Upcoming({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Order1:  '),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Order2:  '),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Order:  '),
          ),
        ],
      ),
    ));
  }
}
