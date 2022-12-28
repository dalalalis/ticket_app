import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class EventProvider extends ChangeNotifier {
  List<Map> weekevents = [
    {
      'title': 'NewYears Party',
      'image': 'lib/assets/newyear.jpeg',
      'venue': 'Marina Hotel',
      'city': "Salmiya",
      'country': 'Kuwait',
      'startDate': '2022-12-31',
    },
    {
      'title': 'NewYears Marathon',
      'image': 'lib/assets/newyear.jpeg',
      'venue': 'GulfRoad',
      'city': "Shaab",
      'country': 'Kuwait',
      'startDate': '2023-01-01',
    }
  ];
}
