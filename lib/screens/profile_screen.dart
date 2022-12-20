import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:go_router/go_router.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
            child: ElevatedButton(
                onPressed: () {
                  context.push('/eventlist/create');
                },
                child: Text('Create Event'))),
        Center(
            child: ElevatedButton(
                onPressed: () {
                  context.push('');
                },
                child: Text('Logout'))),
        Center(
            child: ElevatedButton(
                onPressed: () {
                  context.push('');
                },
                child: Text('Sell Ticket'))),
        Center(
            child: ElevatedButton(
                onPressed: () {
                  context.push('');
                },
                child: Text('terms and conditons'))),
        Center(
            child: ElevatedButton(
                onPressed: () {
                  context.push('');
                },
                child: Text('contact us')))
      ],
    ));
  }
}
