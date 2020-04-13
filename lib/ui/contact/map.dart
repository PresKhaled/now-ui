import 'package:flutter/material.dart';

class Map extends StatefulWidget {
  @override
  _MapState createState() => _MapState();
}

class _MapState extends State<Map> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
            child: Column(children: <Widget>[
      Container(
        padding: EdgeInsets.all(25.0),
        child: Text("Content goes here..",
            style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.bold)),
      )
    ])));
  }
}
