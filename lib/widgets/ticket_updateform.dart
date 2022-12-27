import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:ticket_app/models/ticket.dart';
import 'package:ticket_app/providers/event_provider.dart';
import 'package:ticket_app/providers/ticket_provider.dart';

import '../models/event.dart';

class UpdateTicketForm extends StatefulWidget {
  final Tickets ticket;
  const UpdateTicketForm({super.key, required this.ticket});

  @override
  State<UpdateTicketForm> createState() => _UpdateTicketFormState();
}

class _UpdateTicketFormState extends State<UpdateTicketForm> {
  final _formKey = GlobalKey<FormState>();
  final ticketController = TextEditingController();

  final priceController = TextEditingController();
  File? imageFile;
  String? imageError;
  Events? selectedEvent;
  String? selectedDelivery;

  @override
  void initState() {
    EventProvider().loadEvents();
    super.initState();
  }

  Widget build(BuildContext context) {
    Tickets ticket = widget.ticket;
    return Scaffold(
        body: SafeArea(
            child: Form(
                key: _formKey,
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
                        value: selectedEvent,
                        icon: Icon(Icons.arrow_drop_down),
                        items: context
                            .read<EventProvider>()
                            .events
                            .map((e) => DropdownMenuItem<Events>(
                                  child: Text(e.title),
                                  value: e,
                                ))
                            .toList(),
                        onChanged: (Events? value) {
                          setState(() {
                            selectedEvent = value;
                          });
                        },
                      ),
                      // ---------------get the provider done and add to the ticket type drop down
                      DropdownButton(
                        hint: Text('Ticket Type and Delivery '),
                        value: selectedDelivery,
                        icon: Icon(Icons.arrow_drop_down),
                        items: [
                          "physical",
                          "immediate",
                          "twenty_Four_Hours",
                          "three_Days",
                          "one_Week"
                        ]
                            .map((e) => DropdownMenuItem(
                                  child: Text(e),
                                  value: e,
                                ))
                            .toList(),
                        //>>> how to list all delivery methods
                        onChanged: (value) {
                          setState(() {
                            selectedDelivery = value;
                          });
                        },
                      ),
                      if (imageFile != null)
                        Image.file(
                          imageFile!,
                          width: 100,
                          height: 100,
                        )
                      else
                        Container(
                          width: 100,
                          height: 100,
                        ),
                      ElevatedButton(
                          onPressed: () async {
                            var file = await ImagePicker()
                                .pickImage(source: ImageSource.gallery);

                            if (file == null) {
                              print("User didnt select a file");
                              return;
                            }

                            setState(() {
                              imageFile = File(file.path);
                              imageError = null;
                            });
                          },
                          child: Text("Add Image")),
                      if (imageError != null)
                        Text(
                          imageError!,
                          style: TextStyle(color: Colors.red),
                        ),
                      Spacer(),
                      ElevatedButton(
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();
                              context.pop();
                              //   ScaffoldMessenger.of(context).showSnackBar(
                              //     SnackBar(
                              //       content: Text(
                              //         "ticket posted",
                              //       ),
                              //       backgroundColor: Colors.green,
                              //     ),
                              //   );
                              // } else {
                              //   ScaffoldMessenger.of(context).showSnackBar(
                              //     SnackBar(
                              //       content: Text(
                              //         "error",
                              //       ),
                              //       backgroundColor: Colors.red,
                              //     ),
                              //   );
                              // }
                            }
                          },
                          child: Text('update ticket'))
                    ])))));
  }
}
