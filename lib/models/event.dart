import 'dart:convert';

class Events {
  int id;
  String name;
  String image;
  String venue;
  DateTime time;
  String city;
  String country;
  DateTime date;

  Events({
    required this.id,
    required this.name,
    required this.image,
    required this.venue,
    required this.time,
    required this.city,
    required this.country,
    required this.date,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'venue': venue,
      'time': time,
      'city': city,
      'country': country,
      'date': date,
    };
  }

  factory Events.fromMap(Map<String, dynamic> map) {
    return Events(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      image: map['image'] ?? '',
      venue: map['venue'] ?? '',
      time: map['time'] ?? '',
      city: map['city'] ?? '',
      country: map['country'] ?? '',
      date: map['date'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Events.fromJson(String source) => Events.fromMap(json.decode(source));
}
