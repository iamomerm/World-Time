import 'package:flutter/material.dart';
import 'package:world_time/services/text_border.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Route Data
  Map data = {};

  @override
  Widget build(BuildContext context) {
    // Map Route Args
    this.data = data.isNotEmpty ? data : ModalRoute.of(context)!.settings.arguments as Map;

    // Set Background
    String bgImage = data['isDaytime'] ? 'day.jpg' : 'night.jpg';

    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage('assets/$bgImage'), fit: BoxFit.cover),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 120.0, 0, 0),
            child: Column(
              children: [
                FlatButton.icon(
                  onPressed: () async {
                    dynamic result = await Navigator.pushNamed(context, '/location');
                    setState(() {
                      this.data = {
                        'location': result['location'],
                        'isDaytime': result['isDaytime'],
                        'time': result['time']
                      };
                    });
                  }, // Push to Location Route
                  icon: Icon(Icons.edit_location, color: Colors.grey[300]),
                  label: Text(
                    'Edit Location',
                    style: TextStyle(color: Colors.grey[300]),
                  ),
                ),
                SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      this.data['location'],
                      style: TextStyle(
                        fontSize: 28.0,
                        letterSpacing: 2.0,
                        color: Color(0xffffffff),
                        shadows: border(0xff123456, 1.25),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.0),
                Text(
                  this.data['time'],
                  style: TextStyle(
                    fontSize: 66.0,
                    color: Color(0xffffffff),
                    shadows: border(0xff123456, 1.25),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
