import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:ticket_app/providers/event_provider.dart';

import '../models/event.dart';

class AddTicket extends StatefulWidget {
  AddTicket({super.key});

  @override
  State<AddTicket> createState() => _AddTicketState();
}

class _AddTicketState extends State<AddTicket> {
  var formKey = GlobalKey<FormState>();

  final ticketController = TextEditingController();

  final priceController = TextEditingController();
  Events? selectedValue;
  @override
  void initState() {
    EventProvider().loadEvents();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Events> events;
    events = context.watch<EventProvider>().events;
    return Scaffold(
        appBar: AppBar(title: Text('Add Ticket For Sale')),
        body: SafeArea(
            child: Form(
                key: formKey,
                child: Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Column(children: [
                      TextFormField(
                        controller: ticketController,
                        decoration: InputDecoration(
                            hintText:
                                "Input ticket details (ex. block, row, seat,  )"),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Field is required";
                          }

                          return null;
                        },
                      ),
                      TextFormField(
                        controller: priceController,
                        decoration: InputDecoration(
                            hintText: "input the selling price"),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Field is required";
                          }

                          return null;
                        },
                      ),
                      DropdownButton<Events>(
                        hint: Text('Choose an Event'),
                        value: selectedValue,
                        icon: Icon(Icons.arrow_drop_down),
                        items: events
                            .map((e) => DropdownMenuItem<Events>(
                                  child: Text(e.title),
                                  value: e,
                                ))
                            .toList(),
                        onChanged: (Events? value) {
                          setState(() {
                            selectedValue = value;
                          });
                        },
                      ),
                      // ---------------get the provider done and add to the ticket type drop down
                      DropdownButton<Events>(
                        hint: Text('Ticket Type and Delivery '),
                        value: selectedValue,
                        icon: Icon(Icons.arrow_drop_down),
                        items: events
                            .map((e) => DropdownMenuItem<Events>(
                                  child: Text(e.title),
                                  value: e,
                                ))
                            .toList(),
                        onChanged: (Events? value) {
                          setState(() {
                            selectedValue = value;
                          });
                        },
                      ),
                      Spacer(),
                      ElevatedButton(
                        onPressed: () {
                          context.pop();
                        },
                        child: Text('Submit'),
                      )
                    ])))));
  }
}
