import 'dart:convert';

class Order {
  int buyer;
  int ticket;
  Order({
    required this.buyer,
    required this.ticket,
  });

  Map<String, dynamic> toMap() {
    return {
      'buyer': buyer,
      'ticket': ticket,
    };
  }

  factory Order.fromMap(Map<String, dynamic> map) {
    return Order(
      buyer: map['buyer']?.toInt() ?? 0,
      ticket: map['ticket']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Order.fromJson(String source) => Order.fromMap(json.decode(source));
}
