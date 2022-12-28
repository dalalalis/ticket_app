import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:ticket_app/utils/app_styling.dart';

import '../providers/authprovider.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: Column(
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.face_rounded, size: 100),
            Text('Profile', style: Styles.headLineStyle)
          ],
        ),
        Expanded(
          child: ListView(
            children: [
              //if (false)
              //----------------------------> add logic for admin
              // if admin then the create button gets displayed

              Row(
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

              Center(
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey[200],
                          foregroundColor: Colors.black),
                      onPressed: () {
                        context.read<AuthProvider>().logout();
                        context.push('/signin/');
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
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey[200],
                          foregroundColor: Colors.black),
                      onPressed: () {
                        context.push('/mytickets/sale');
                      },
                      child: Text('My tickets for Sale'))),
              Center(
                  child: ElevatedButton(
                      onPressed: () {
                        context.push('/contactus/');
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
      ],
    ));

   
  }
}
