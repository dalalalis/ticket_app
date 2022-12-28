import 'dart:convert';

class Order {
  int buyer;
  int ticket;
  String date_created;
  Order({
    required this.buyer,
    required this.ticket,
    required this.date_created,
  });

  Map<String, dynamic> toMap() {
    return {
      'buyer': buyer,
      'ticket': ticket,
      'date_created': date_created,
    };
  }

  factory Order.fromMap(Map<String, dynamic> map) {
    return Order(
        buyer: map['buyer']?.toInt() ?? 0,
        ticket: map['ticket']?.toInt() ?? 0,
        date_created: map['date_created'] ?? "");
  }

  String toJson() => json.encode(toMap());

  factory Order.fromJson(String source) => Order.fromMap(json.decode(source));
}
