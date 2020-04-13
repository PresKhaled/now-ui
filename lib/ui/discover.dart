/*
  - Created Via Khaled Mohsen
  - Last Edit: 04/02/2020 2:50 AM
  - Home Screen
*/

import 'package:flutter/material.dart';
import 'dart:ui';

import '../inc/init.dart';
import '../ui/story/story.dart' show Story;
import 'channels/channel.dart' show Channel;

class Discover extends StatefulWidget {
  @override
  _DiscoverState createState() => _DiscoverState();
}

class _DiscoverState extends State<Discover> {
  final Color newsUiIconsColor = Colors.grey[700];
  final double newsSpansSize = 11.0;
  final double sourceIconSize = 12.0;
  final double timeIconSize = 16.0;

  final mainNewsHeight = screenSize(window).height / 2;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        //Drawer
        drawerScrimColor: Colors.transparent,
        drawer: getDrawer(context),
        //App Bar
        appBar: AppBar(
            elevation: .0,
            leading: Builder(
                builder: (context) => Tooltip(
                    message: "Open navigation menu",
                    child: GestureDetector(
                        child: Image.asset(imagesPath + "menu.png",
                            semanticLabel: "Aside (navigation) menu",
                            scale: appBarIconScale),
                        onTap: () =>
                            Scaffold.of(context).openDrawer()))), //Menu
            title: Image.asset(imagesPath + "logo.png",
                scale: appBarIconScale), //Logo
            centerTitle: true,
            actions: <Widget>[
              Tooltip(
                  message: "Search",
                  child: GestureDetector(
                      onTap: () {},
                      child: Container(
                          child: Image.asset(imagesPath + "search.png",
                              scale: appBarIconScale))))
            ],
            backgroundColor: appMainColor),
        body: SingleChildScrollView(
            child: Container(
                child: Column(children: <Widget>[
          //Main News
          Stack(children: <Widget>[
            Container(
                height: mainNewsHeight,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(imagesPath + "main.jpg"),
                      fit: BoxFit.cover),
                )),
            Container(
                //Main News Gradient
                height: mainNewsHeight,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [Color.fromRGBO(0, 0, 0, .7), Colors.transparent],
                      stops: [.0, .3]),
                )),
            InkWell(
                onTap: () => Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Story())),
                child: Container(
                    height: mainNewsHeight,
                    padding: EdgeInsets.all(20.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.end,
                        //TODO: Should USE ListView not containers..
                        children: <Widget>[
                          Container(
                              margin: EdgeInsets.only(bottom: 20.0),
                              child: Text(
                                  "Astronauts could land on Red Planet by 2039",
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white))),
                          Row(
                              //mainAxisAlignment: MainAxisAlignment.spaceAround,
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(right: 20.0),
                                  child: Row(children: <Widget>[
                                    Image.asset(
                                      imagesPath + "source.png",
                                      width: sourceIconSize,
                                      color: Colors.white,
                                    ),
                                    Text("  SPACE.com",
                                        style: TextStyle(
                                            fontSize: newsSpansSize,
                                            color: Colors.white)),
                                  ]),
                                ),
                                Row(children: <Widget>[
                                  Image.asset(imagesPath + "time.png",
                                      width: timeIconSize, color: Colors.white),
                                  Text("  20m ago",
                                      style: TextStyle(
                                          fontSize: newsSpansSize,
                                          color: Colors.white)),
                                ]),
                                Expanded(
                                    child: Align(
                                        alignment: Alignment.centerRight,
                                        child: GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        Channel("science")));
                                          },
                                          child: Container(
                                            // alignment: Alignment.centerRight,
                                            padding:
                                                EdgeInsets.only(bottom: 5.0),
                                            decoration: BoxDecoration(
                                              border: Border(
                                                  bottom: BorderSide(
                                                      color: Color.fromRGBO(
                                                          140, 140, 140, 1),
                                                      width: 1.0)),
                                            ),
                                            child: Text("SCIENCE",
                                                textAlign: TextAlign.right,
                                                style: TextStyle(
                                                    fontSize: newsSpansSize,
                                                    color: Colors.white)),
                                          ),
                                        )))
                              ])
                        ])))
          ]),

          //Rest News
          InkWell(
            onTap: () => Navigator.push(
                context, MaterialPageRoute(builder: (context) => Story(1))),
            child: Container(
                margin: EdgeInsets.only(bottom: 35.0),
                child: Column(children: <Widget>[
                  Container(
                      padding: EdgeInsets.all(20.0),
                      child: Text(
                          "Arctic sea ice extent hits record low for winter maximum",
                          style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black))),
                  Padding(
                    padding: const EdgeInsets.only(right: 20.0, left: 20.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(right: 20.0),
                            child: Row(children: <Widget>[
                              Image.asset(imagesPath + "source.png",
                                  width: sourceIconSize,
                                  color: newsUiIconsColor),
                              Text("  CNN",
                                  style: TextStyle(
                                      fontSize: newsSpansSize,
                                      color: Colors.black)),
                            ]),
                          ),
                          Row(children: <Widget>[
                            Image.asset(imagesPath + "time.png",
                                width: timeIconSize, color: newsUiIconsColor),
                            Text("  1h ago",
                                style: TextStyle(
                                    fontSize: newsSpansSize,
                                    color: Colors.black)),
                          ]),
                          Expanded(
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Channel()));
                                },
                                child: Container(
                                  // alignment: Alignment.centerRight,
                                  padding: EdgeInsets.only(bottom: 5.0),
                                  decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            color: Color.fromRGBO(
                                                140, 140, 140, 1),
                                            width: 1.0)),
                                  ),
                                  child: Text("ENVIRONMENT",
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                          fontSize: newsSpansSize,
                                          color: Colors.black)),
                                ),
                              ),
                            ),
                          ),
                        ]),
                  )
                ])),
          ),
          InkWell(
            onTap: () => Navigator.push(
                context, MaterialPageRoute(builder: (context) => Story())),
            child: Container(
                margin: EdgeInsets.only(bottom: 35.0),
                child: Column(children: <Widget>[
                  Container(
                      padding: EdgeInsets.all(20.0),
                      child: Text(
                          "New battery for smartphones can be charged in a minute",
                          style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black))),
                  Padding(
                    padding: const EdgeInsets.only(right: 20.0, left: 20.0),
                    child: Row(
                        //mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(right: 20.0),
                            child: Row(children: <Widget>[
                              Image.asset(imagesPath + "source.png",
                                  width: sourceIconSize,
                                  color: newsUiIconsColor),
                              Text("  Reuters",
                                  style: TextStyle(
                                      fontSize: newsSpansSize,
                                      color: Colors.black)),
                            ]),
                          ),
                          Row(children: <Widget>[
                            Image.asset(imagesPath + "time.png",
                                width: timeIconSize, color: newsUiIconsColor),
                            Text("  6h ago",
                                style: TextStyle(
                                    fontSize: newsSpansSize,
                                    color: Colors.black)),
                          ]),
                          Expanded(
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Channel()));
                                },
                                child: Container(
                                  // alignment: Alignment.centerRight,
                                  padding: EdgeInsets.only(bottom: 5.0),
                                  decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            color: Color.fromRGBO(
                                                140, 140, 140, 1),
                                            width: 1.0)),
                                  ),
                                  child: Text("TECHNOLOGY",
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                          fontSize: newsSpansSize,
                                          color: Colors.black)),
                                ),
                              ),
                            ),
                          ),
                        ]),
                  )
                ])),
          ),
          InkWell(
              onTap: () => Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Story())),
              child: Container(
                  margin: EdgeInsets.only(bottom: 35.0),
                  child: Column(children: <Widget>[
                    Container(
                        padding: EdgeInsets.all(20.0),
                        child: Text(
                            "YouTube shines but Google ads continue to slow",
                            style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.black))),
                    Padding(
                        padding: const EdgeInsets.only(right: 20.0, left: 20.0),
                        child: Row(
                            //mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Container(
                                  width: screenSize(window).width / 2,
                                  child: Row(children: <Widget>[
                                    Padding(
                                        padding:
                                            const EdgeInsets.only(right: 20.0),
                                        child: Row(children: <Widget>[
                                          Image.asset(imagesPath + "source.png",
                                              width: sourceIconSize,
                                              color: newsUiIconsColor),
                                          Text("  BBC",
                                              style: TextStyle(
                                                  fontSize: newsSpansSize,
                                                  color: Colors.black)),
                                        ])),
                                    Row(children: <Widget>[
                                      Image.asset(imagesPath + "time.png",
                                          width: timeIconSize,
                                          color: newsUiIconsColor),
                                      Text("  10h ago",
                                          style: TextStyle(
                                              fontSize: newsSpansSize,
                                              color: Colors.black))
                                    ])
                                  ])),
                              Expanded(
                                  child: Align(
                                      alignment: Alignment.centerRight,
                                      child: GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        Channel()));
                                          },
                                          child: Container(
                                              //alignment: Alignment.centerRight,
                                              padding:
                                                  EdgeInsets.only(bottom: 5.0),
                                              decoration: BoxDecoration(
                                                  border: Border(
                                                      bottom: BorderSide(
                                                          color: Color.fromRGBO(
                                                              140, 140, 140, 1),
                                                          width: 1.0))),
                                              child: Text("TECHNOLOGY",
                                                  textAlign: TextAlign.right,
                                                  style: TextStyle(
                                                      fontSize: newsSpansSize,
                                                      color: Colors.black))))))
                            ]))
                  ])))
        ]))));
  }
}
