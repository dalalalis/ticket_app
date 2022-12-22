import 'dart:convert';

class Tickets {
  int? id;
  String owner;
  String ticketDetails;
  String event;
  int price;
  bool available;
  String image;

  Tickets({
    required this.id,
    required this.owner,
    required this.ticketDetails,
    required this.event,
    required this.price,
    required this.available,
    required this.image,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'owner': owner,
      'ticketDetails': ticketDetails,
      'event': event,
      'price': price,
      'available': available,
      'image': image,
    };
  }

  factory Tickets.fromMap(Map<String, dynamic> map) {
    return Tickets(
      id: map['id']?.toInt(),
      owner: map['owner'] ?? '',
      ticketDetails: map['ticketDetails'] ?? '',
      event: map['event'] ?? '',
      price: map['price']?.toInt() ?? 0,
      available: map['available'] ?? false,
      image: map['image'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Tickets.fromJson(String source) =>
      Tickets.fromMap(json.decode(source));
}
