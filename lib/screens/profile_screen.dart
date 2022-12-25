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
      appBar: AppBar(
        centerTitle: true,
        title: Text("username"),
      ),
      body: SafeArea(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ElevatedButton(
                  onPressed: () {
                    context.push('/eventlist/create');
                  },
                  child: Text('Create Event')),
              ElevatedButton(
                  onPressed: () {
                    context.push('/addticket');
                  },
                  child: Text('Sell Ticket')),
              ElevatedButton(
                  onPressed: () {
                    context.push('');
                  },
                  child: Text('Terms and Conditons')),
              ElevatedButton(
                  onPressed: () {
                    context.push('');
                  },
                  child: Text('Contact Us')),
              ElevatedButton(
                  onPressed: () {
                    context.push("/signup");
                  },
                  child: Text("Signup")),
              ElevatedButton(
                  onPressed: () {
                    context.push("/signin");
                  },
                  child: Text("Signin")),
              ElevatedButton(
                onPressed: () {
                  context.pop();
                },
                child: Text("Sell Your Ticket"),
              ),
              ElevatedButton(
                onPressed: () {
                  context.read<AuthProvider>().logout();
                },
                child: Text("Signout"),
              ),
            ]),
      ),
    );
  }
}
