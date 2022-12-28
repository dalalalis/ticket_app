import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:ticket_app/models/ticket.dart';

import 'client.dart';

class MyTicketProvider extends ChangeNotifier {
  List<Tickets> tickets = [];
  MyTicketProvider() {
    loadTickets();
  }
  Future<void> loadTickets() async {
    try {
      notifyListeners();
      tickets.clear();
      Response response;

      response = await Client.dio.get('/myticket/');

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

  void deleteMyTicket(int ticket) async {
    await Client.dio.delete('/ticket/delete/${ticket}');
    loadTickets();
  }
}
