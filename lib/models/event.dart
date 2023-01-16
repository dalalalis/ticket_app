// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Events {
  int? id;
  String title;
  String image;
  String venue;
  DateTime endDate;
  String city;
  String country;
  DateTime startDate;
  Events({
    required this.id,
    required this.title,
    required this.image,
    required this.venue,
    required this.endDate,
    required this.city,
    required this.country,
    required this.startDate,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'image': image,
      'venue': venue,
      'endDate': endDate,
      'city': city,
      'country': country,
      'startDate': startDate,
    };
  }

  factory Events.fromMap(Map<String, dynamic> map) {
    return Events(
      id: map['id'] != null ? map['id'] as int : null,
      title: map['title'] as String,
      image: map['image'] as String,
      venue: map['venue'] as String,
      endDate: DateTime.tryParse(map['endDate']) ?? DateTime.now(),
      city: map['city'] as String,
      country: map['country'] as String,
      startDate: DateTime.tryParse(map['startDate']) ?? DateTime.now(),
    );
  }

  String toJson() => json.encode(toMap());

  factory Events.fromJson(String source) =>
      Events.fromMap(json.decode(source) as Map<String, dynamic>);
}
