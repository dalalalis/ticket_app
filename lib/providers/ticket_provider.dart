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
        response = await Client.dio.get('/tickets/?event_id=${event.id}/');
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

  Future<String?> addTicket({
    // required int id,
    // required int owner,
    required String ticketdetails,
    required int event,
    required int price,
    required bool available,
    required File image,
    required String delivery,
  }) async {
    try {
      var response = await Client.dio.post('tickets/add/',
          data: FormData.fromMap({
            // 'owner': owner,
            'image': await MultipartFile.fromFile(image.path),
            'event': event,
            'ticketdetails': ticketdetails,
            'price': price.toString(),
            'available': available.toString(),
            // 'id': id,
            'delivery': delivery
          }));
      loadTickets();
      return null;
    } on DioError catch (e, st) {
      print(e);
      print(st);
      print(e.response!.data);
    } on Exception catch (e, st) {
      // TODO
      print(e);
      print(st);

      return 'Error';
    }
  }
}
