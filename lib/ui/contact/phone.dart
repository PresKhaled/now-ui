import 'dart:ui';
import 'package:flutter/material.dart';

class Phone extends StatefulWidget {
  @override
  _PhoneState createState() => _PhoneState();
}

class _PhoneState extends State<Phone> {
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
