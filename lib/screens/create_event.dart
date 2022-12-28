import 'dart:io';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import '../providers/event_provider.dart';

class CreateEvent extends StatefulWidget {
  const CreateEvent({super.key});

  @override
  State<CreateEvent> createState() => _CreateEventState();
}

class _CreateEventState extends State<CreateEvent> {
  final titleController = TextEditingController();
  final venueController = TextEditingController();

  final cityController = TextEditingController();
  final countryController = TextEditingController();

  DateTime? _valueChanged1;
  DateTime? _valueChanged2;
  File? imageFile;
  String? imageError;
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Event')),
      body: SafeArea(
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              children: [
                TextFormField(
                  controller: cityController,
                  decoration: InputDecoration(hintText: "City"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Field is required";
                    }

                    return null;
                  },
                ),
                TextFormField(
                  controller: titleController,
                  decoration: InputDecoration(hintText: "event name"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Field is required";
                    }

                    return null;
                  },
                ),
                TextFormField(
                  controller: venueController,
                  decoration: InputDecoration(hintText: "venue"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Field is required";
                    }

                    return null;
                  },
                ),
                TextFormField(
                  controller: countryController,
                  decoration: InputDecoration(hintText: "country"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Field is required";
                    }

                    return null;
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Event Start Date'),
                ),
                DateTimePicker(
                  type: DateTimePickerType.dateTimeSeparate,
                  dateMask: 'd MMM, yyyy',
                  initialValue: DateTime.now().toString(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2100),
                  icon: Icon(Icons.event),
                  dateLabelText: 'Date',
                  timeLabelText: "Hour",
                  selectableDayPredicate: (date) {
                    // Disable weekend days to select from the calendar
                    if (date.weekday == 6 || date.weekday == 7) {
                      return false;
                    }

                    return true;
                  },
                  onChanged: (val) =>
                      setState(() => _valueChanged1 = DateTime.parse(val)),
                  validator: (val) {
                    print(val);
                    return null;
                  },
                  // onSaved: (val) => setState(() => _valueChanged1 = val!),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Event End Date'),
                ),
                DateTimePicker(
                  type: DateTimePickerType.dateTimeSeparate,
                  dateMask: 'd MMM, yyyy',
                  initialValue: DateTime.now().toString(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2100),
                  icon: Icon(Icons.event),
                  dateLabelText: 'Date',
                  timeLabelText: "Hour",
                  selectableDayPredicate: (date) {
                    // Disable weekend days to select from the calendar
                    if (date.weekday == 6 || date.weekday == 7) {
                      return false;
                    }

                    return true;
                  },
                  onChanged: (val) =>
                      setState(() => _valueChanged2 = DateTime.parse(val)),
                  validator: (val) {
                    print(val);
                    return null;
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
                    formKey.currentState!.save();
                    print("date $_valueChanged1");
                    print("time");

                    if (imageFile == null) {
                      setState(() {
                        imageError = "Required field";
                      });
                    }
                    if (formKey.currentState!.validate() &&
                        imageFile != null &&
                        _valueChanged1 != null &&
                        _valueChanged2 != null) {
                      final result =
                          await context.read<EventProvider>().addEvent(
                                title: titleController.text,
                                image: imageFile!,
                                venue: venueController.text,
                                country: countryController.text,
                                city: cityController.text,
                                startDate: _valueChanged1!,
                                endDate: _valueChanged2!,
                              );
                      if (result == null) {
                        context.pop();
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              "Event created",
                            ),
                            backgroundColor: Colors.green,
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              "cant create event",
                            ),
                            backgroundColor: Colors.red,
                          ),
                        );
                      }
                      //   }
                    }
                  },
                  child: Text("Add Event"),
                )
              ],
            ),
          ),
        ),
      ),
    );
    ;
  }
}
