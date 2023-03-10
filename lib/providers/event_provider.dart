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
    try {
      notifyListeners();
      events.clear();
      var response = await Client.dio.get('/events/');

      var eventsJsonList = response.data as List;
      events =
          eventsJsonList.map((eventJson) => Events.fromMap(eventJson)).toList();
      notifyListeners();
    } on Exception catch (e) {
      // TODO
      print(e);
    }
  }

  Future<String?> addEvent({
    required String title,
    required File image,
    required String venue,
    required DateTime startDate,
    required String city,
    required String country,
    required DateTime endDate,
  }) async {
    try {
      var response = await Client.dio.post('/events/add/',
          data: FormData.fromMap({
            'title': title,
            'image': await MultipartFile.fromFile(image.path),
            'venue': venue,
            'startDate': startDate.toString(),
            'endDate': endDate.toString(),
            'city': city,
            'country': country,
          }));
      loadEvents();
      return null;
    } on Exception catch (e) {
      // TODO

      return 'Error';
    }
  }
}
