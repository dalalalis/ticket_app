import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
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
  final nameController = TextEditingController();
  final venueController = TextEditingController();
  final dateController = TextEditingController();
  final cityController = TextEditingController();

  File? imageFile;
  String? imageError;
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: TextFormField(
                    controller: cityController,
                    decoration: InputDecoration(hintText: "City"),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Field is required";
                      }

                      return null;
                    },
                  ),
                ),
                TextFormField(
                  controller: nameController,
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
                  controller: dateController,
                  decoration: InputDecoration(hintText: "date"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Field is required";
                    }

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
                      // form

                      if (imageFile == null) {
                        setState(() {
                          imageError = "Required field";
                        });
                      }

                      //   if (formKey.currentState!.validate() && imageFile != null) {
                      //     await context.read<EventProvider>().addEvent(
                      //         name: nameController.text,
                      //         image: imageFile!,
                      //         venue: venueController.text,
                      //         date: dateController.selection,
                      //         city: cityController.text,
                      //         );
                      context.pop();
                      //   }
                    },
                    child: Text("Add Event"))
              ],
            ),
          ),
        ),
      ),
    );
    ;
  }
}
