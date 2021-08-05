import 'package:flutter/material.dart';
import 'package:world_time/pages/home.dart';
import 'package:world_time/pages/location.dart';
import 'package:world_time/pages/loading.dart';

void main() => runApp(MyApp);

var MyApp = MaterialApp(
  /* Routes */
  initialRoute: '/', // Overwrite the Routes 1st Item in Map

  routes: {
    '/': (context) => Loading(),
    '/home': (context) => Home(),
    '/location': (context) => ChooseLocation(),
  },
);
