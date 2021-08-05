import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  // Instantiate World Time
  void setupWorldTime(String location, String url) async {
    WorldTime wt = WorldTime(location: location, url: url);
    await wt.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': wt.location,
      'time': wt.time,
      'isDaytime': wt.isDaytime
    });
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime('London', 'Europe/London');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: SpinKitCubeGrid(
              color: Colors.lightBlue[200],
              size: 75.0
            ),
          ),
          Center(
            child: Text(
              'Loading',
              style: TextStyle(
                color: Colors.lightBlue[200],
                fontSize: 25.0
              ),
            )
          )
        ],
      ),
    );
  }
}

