import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:ticket_app/utils/app_styling.dart';

import '../providers/authprovider.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: Column(
      children: [
        Container(
          height: 250,
          child: Column(
            children: [
              Icon(Icons.face_rounded, size: 100),
              Text('{User.name}', style: Styles.headLineStyle)
            ],
          ),
        ),
        Container(
          child: Expanded(
            child: ListView(
              children: [
                //if (false)
                //----------------------------> add logic for admin
                // if admin then the create button gets displayed

                Expanded(
                  child: Row(
                    children: [
                      Center(
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.grey[200],
                                  foregroundColor: Colors.black),
                              onPressed: () {
                                context.push('/eventlist/create');
                              },
                              child: Text(' Create Event '))),
                    ],
                  ),
                ),
                Center(
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey[200],
                            foregroundColor: Colors.black),
                        onPressed: () {
                          context.push('');
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 150, right: 150),
                          child: Text(
                            'Logout',
                          ),
                        ))),
                Center(
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey[200],
                            foregroundColor: Colors.black),
                        onPressed: () {
                          context.push('/addticket/');
                        },
                        child: Text('Sell Ticket'))),
                Center(
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey[200],
                            foregroundColor: Colors.blue),
                        onPressed: () {
                          context.push('');
                        },
                        child: Text('terms and conditons'))),
                Center(
                    child: ElevatedButton(
                        onPressed: () {
                          context.push('');
                        },
                        child: Text('contact us'),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey[200],
                            foregroundColor: Colors.black))),
                Center(
                  child: ElevatedButton(
                      onPressed: () {
                        context.push("/signup");
                      },
                      child: Text("Signup")),
                ),
              ],
            ),
          ),
        ),
      ],
    ));

   
  }
}
