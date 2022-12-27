import 'dart:convert';

class Tickets {
  int? id;
  String owner;
  String ticketdetails;
  String event;
  int price;
  bool available;
  String delivery;
  // String image;

  Tickets({
    required this.id,
    required this.owner,
    required this.ticketdetails,
    required this.event,
    required this.price,
    required this.available,
    required this.delivery,
    // required this.image,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'owner': owner,
      'ticketdetails': ticketdetails,
      'event': event,
      'price': price,
      'available': available,
      'delivery': delivery,
      // 'image': image,
    };
  }

  factory Tickets.fromMap(Map<String, dynamic> map) {
    return Tickets(
      id: map['id']?.toInt(),
      owner: map['owner'] ?? '',
      ticketdetails: map['ticketdetails'] ?? '',
      event: map['event'] ?? '',
      price: map['price']?.toInt() ?? 0,
      available: map['available'] ?? false,
      delivery: map['delivery'] ?? '',
      // image: map['image'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Tickets.fromJson(String source) =>
      Tickets.fromMap(json.decode(source));
}
