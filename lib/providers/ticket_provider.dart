import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:ticket_app/models/ticket.dart';
import 'client.dart';
import 'package:ticket_app/models/event.dart';

class TicketProvider extends ChangeNotifier {
  List<Tickets> tickets = [];
  TicketProvider() {
    loadTickets();
  }
  Future<void> loadTickets({Events? event}) async {
    try {
      notifyListeners();
      tickets.clear();
      Response response;
      if (event != null) {
        response =
            await Client.dio.get('/tickets/?param_event_id=${event.id}/');
      } else {
        response = await Client.dio.get('/tickets/');
      }

      var ticketsJsonList = response.data as List;
      tickets = ticketsJsonList
          .map((ticketJson) => Tickets.fromMap(ticketJson))
          .toList();
      notifyListeners();
    } on Exception catch (e) {
      // TODO
      print(e);
    }
  }

  Future<void> addTicket({
    required int id,
    required int owner,
    required String ticketDetails,
    required String event,
    required int price,
    required bool available,
    required File image,
  }) async {
    try {
      var response = await Client.dio.post('tickets/add/',
          data: FormData.fromMap({
            'owner': owner,
            'image': await MultipartFile.fromFile(image.path),
            'event': event,
            'ticketDetails': ticketDetails,
            'price': price,
            'available': available,
            'id': id,
          }));
      loadTickets();
    } on Exception catch (e) {
      // TODO
    }
  }
}
