import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'dart:convert';

class WorldTime {
  String location; // Location Name for the UI
  String time = ''; // The Time in that Location
  String url; // API URL
  bool isDaytime = false;

  WorldTime({required this.location, required this.url});

  // Async HTTP Get
  Future<void> getTime() async {
    // Code (Status)
    Response response = await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
    Map resMap = jsonDecode(response.body);

    // OK
    if (response.statusCode == 200) {
      // Extract Time Properties
      DateTime datetime = DateTime.parse(resMap['datetime']);
      datetime = datetime.add(Duration(hours: int.parse(resMap['utc_offset'].substring(1, 3))));
      this.time = DateFormat.jm().format(datetime);

      // Daytime
      this.isDaytime = datetime.hour > 6 && datetime.hour < 20 ? true : false;
    }

    // Error
    else {
      this.time = 'N/A';
    }
  }
}
