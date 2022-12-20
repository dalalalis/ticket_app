import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'client.dart';
import 'package:ticket_app/models/event.dart';

class EventProvider extends ChangeNotifier {
  List<Events> events = [];
  EventProvider() {
    loadEvents();
  }
  Future<void> loadEvents() async {
    notifyListeners();
    events.clear();
    var response = await Client.dio.get('');

    var eventsJsonList = response.data as List;
    events =
        eventsJsonList.map((eventJson) => Events.fromMap(eventJson)).toList();
    notifyListeners();
  }

  Future<void> addEvent({
    required String name,
    required File image,
    required String venue,
    required DateTime time,
    required String city,
    required String country,
    required DateTime date,
  }) async {
    try {
      var response = await Client.dio.post('',
          data: FormData.fromMap({
            'name': name,
            'image': await MultipartFile.fromFile(image.path),
          }));
      loadEvents();
    } on Exception catch (e) {
      // TODO
    }
  }
}
