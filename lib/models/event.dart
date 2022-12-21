// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Events {
  int id;
  String title;
  String image;
  String venue;
  String enddate;
  String city;
  String country;
  String startdate;
  Events({
    required this.id,
    required this.title,
    required this.image,
    required this.venue,
    required this.enddate,
    required this.city,
    required this.country,
    required this.startdate,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'image': image,
      'venue': venue,
      'enddate': enddate,
      'city': city,
      'country': country,
      'startdate': startdate,
    };
  }

  factory Events.fromMap(Map<String, dynamic> map) {
    return Events(
      id: map['id']?.toInt() ?? 0,
      title: map['title'] as String ?? "",
      image: map['image'] as String ?? "",
      venue: map['venue'] as String ?? "",
      enddate: map['enddate'] as String ?? "",
      city: map['city'] as String ?? "",
      country: map['country'] as String ?? "",
      startdate: map['startdate'] as String ?? "",
    );
  }

  String toJson() => json.encode(toMap());

  factory Events.fromJson(String source) => Events.fromMap(json.decode(source));
}
