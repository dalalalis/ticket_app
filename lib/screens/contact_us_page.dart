import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ContactUsPage extends StatelessWidget {
  const ContactUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(""),
          foregroundColor: Colors.grey[800],
          backgroundColor: Colors.white,
        ),
        body: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: Text(
                    'Contact Us',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[800],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 50, right: 50, left: 50),
                child: Column(
                  children: [
                    TextFormField(
                        decoration: InputDecoration(
                            labelText: "Full Name", hintText: "Full Name")),
                    TextFormField(
                        decoration: InputDecoration(
                            labelText: "Order Number",
                            hintText: "Order Number")),
                    TextFormField(
                        decoration: InputDecoration(
                            labelText: "Concern", hintText: "Concern")),
                    TextFormField(
                        decoration: InputDecoration(
                            labelText: "Contact Number +965",
                            hintText: "Contact  ")),
                    TextFormField(
                        decoration: InputDecoration(
                            labelText: "How can we help?",
                            hintText: "How can we help?")),
                  ],
                ),
              ),
              ElevatedButton(onPressed: () {}, child: Text("Submit"))
            ],
          ),
        ));
  }
}
