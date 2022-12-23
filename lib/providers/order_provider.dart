import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:ticket_app/models/order.dart';
import 'package:ticket_app/models/ticket.dart';
import 'client.dart';
import 'package:ticket_app/models/event.dart';

class OrderProvider extends ChangeNotifier {
  List<Order> orders = [];
  OrderProvider() {
    loadOrders();
  }
  Future<void> loadOrders() async {
    try {
      notifyListeners();
      orders.clear();
      var response = await Client.dio.get('');

      var ordersJsonList = response.data as List;
      orders =
          ordersJsonList.map((orderJson) => Order.fromMap(orderJson)).toList();
      notifyListeners();
    } on Exception catch (e) {
      // TODO
      print(e);
    }
  }

  Future<void> addOrder({
    required int ticket,
    required int buyer,
  }) async {
    try {
      var response = await Client.dio.post('',
          data: FormData.fromMap({
            'ticket': ticket,
            'buyer': buyer,
          }));

      loadOrders();
    } on Exception catch (e) {
      // TODO
    }
  }
}
