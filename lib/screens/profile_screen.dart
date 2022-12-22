import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../providers/authprovider.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
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
                child: Text('Sell Ticket'))),
        Center(
            child: ElevatedButton(
                onPressed: () {
                  context.push('');
                },
                child: Text('Terms and Conditons'))),
        Center(
            child: ElevatedButton(
                onPressed: () {
                  context.push('');
                },
                child: Text('Contact Us'))),
        Center(
          child: ElevatedButton(
              onPressed: () {
                context.push("/signup");
              },
              child: Text("Signup")),
        ),
        Center(
          child: ElevatedButton(
              onPressed: () {
                context.push("/signin");
              },
              child: Text("Signin")),
        ),
        Center(
            child: ElevatedButton(
          onPressed: () {
            context.pop();
          },
          child: Text("Sell Your Ticket"),
        )),
        Center(
          child: ElevatedButton(
            onPressed: () {
              context.read<AuthProvider>().logout();
            },
            child: Text("Signout"),
          ),
        ),
      ]),
    );
  }
}
