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
        SizedBox(height: 100),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.person, size: 100),
            Text('Profile', style: Styles.headLineStyle)
          ],
        ),
        Expanded(
          child: ListView(
            children: [
              //if (false)
              //----------------------------> add logic for admin
              // if admin then the create button gets displayed

              Center(
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey[200],
                          foregroundColor: Colors.black),
                      onPressed: () {
                        context.push('/eventlist/create');
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(left: 125, right: 125),
                        child: Text(' Create Event '),
                      ))),

              Center(
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey[200],
                          foregroundColor: Colors.black),
                      onPressed: () {
                        context.push('/addticket/');
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(left: 139, right: 139),
                        child: Text('Sell Ticket'),
                      ))),

              Center(
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey[200],
                          foregroundColor: Colors.black),
                      onPressed: () {
                        context.push('/mytickets/sale');
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(left: 110, right: 110),
                        child: Text('My tickets for Sale'),
                      ))),

              Center(
                  child: ElevatedButton(
                      onPressed: () {
                        context.push('/contactus/');
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(left: 140, right: 140),
                        child: Text('contact us'),
                      ),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey[200],
                          foregroundColor: Colors.black))),

              Center(
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey[200],
                          foregroundColor: Colors.black),
                      onPressed: () {},
                      child: Padding(
                        padding: const EdgeInsets.only(left: 120, right: 120),
                        child: Text(
                          'Update Profile',
                        ),
                      ))),
              Center(
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey[200],
                          foregroundColor: Colors.blue),
                      onPressed: () {
                        context.push('');
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(left: 108, right: 108),
                        child: Text('terms and conditons'),
                      ))),
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
            ],
          ),
        ),
      ],
    ));

   
  }
}
