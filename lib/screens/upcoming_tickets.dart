import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:go_router/go_router.dart';

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
              child: Container(
                margin: EdgeInsets.all(5.0),
                width: 200,
                height: 120,
                child: Container(
                  height: 10,
                  child: Card(
                    child: InkWell(
                      child: Padding(
                        padding:
                            const EdgeInsets.only(left: 10, right: 10, top: 12),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  '3 Tickets Vip Row 10 Seat 14-16',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 20),
                                ),
                                // Icon(Icons.verified_outlined),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  'Seller: athoob',
                                  style: TextStyle(
                                      color: Colors.blueAccent, fontSize: 18),
                                ),
                                Spacer(),
                                //======== add to django
                                if (true)
                                  Icon(
                                    Icons.verified_outlined,
                                    color: Colors.green,
                                  ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: Row(
                                children: [
                                  Text('400 KD',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w800,
                                          fontSize: 17)),
                                  Spacer(),
                                  Text('immediate'),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              )),
        ],
      ),
    ));
  }
}
