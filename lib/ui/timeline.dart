import 'dart:ui';
import 'package:flutter/material.dart';
import '../inc/init.dart';

class Timeline extends StatefulWidget {
  @override
  _TimelineState createState() => _TimelineState();
}

class _TimelineState extends State<Timeline> {
  EdgeInsets _contentPadding = EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        body: Container(
            child: Column(children: <Widget>[
          //Static part, DateTime
          Container(
              width: screenSize(window).width,
              height: 120.0,
              color: appSecColor,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Friday",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2.0)),
                    Padding(
                      padding: EdgeInsets.only(top: 10.0),
                      child: Text("Feb 28, 2020",
                          style: TextStyle(
                              color: Colors.white60,
                              fontSize: 11.0,
                              letterSpacing: .3)),
                    )
                  ])),
          //Activities
          Expanded(
              child: ListView(children: <Widget>[
            //Type: Bookmarked
            ListTile(
                onTap: () {},
                contentPadding: _contentPadding,
                leading: Image.asset(imagesPath + "bookmark.png",
                    width: 25.0, fit: BoxFit.fill, color: Colors.grey[500]),
                title: Container(
                    margin: EdgeInsets.only(top: 12.0, bottom: 10.0),
                    child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text("bookmarked".toUpperCase(),
                              style: TextStyle(
                                  color: appMainColor,
                                  fontSize: 13.0,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: .3)),
                          Row(children: <Widget>[
                            Padding(
                                padding: EdgeInsets.only(top: 2.0, right: 8.0),
                                child: Image.asset(imagesPath + "time.png",
                                    width: 17, color: Colors.grey[700])),
                            Text("2:41am",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 11.0,
                                    letterSpacing: .5))
                          ])
                        ])),
                subtitle: Padding(
                  padding: EdgeInsets.only(top: 5.0),
                  child: Text(
                      "NASA goes to Mars: Astronauts could land on Red Planet by 2039",
                      style: TextStyle(
                          height: 1.8,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          letterSpacing: .1)),
                ),
                isThreeLine: true),
            //Type: Commented
            ListTile(
                onTap: () {},
                contentPadding: _contentPadding,
                leading: Image.asset(imagesPath + "comments.png",
                    width: 25.0, fit: BoxFit.fill, color: Colors.grey[500]),
                title: Container(
                    margin: EdgeInsets.only(top: 12.0, bottom: 10.0),
                    child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text("commented".toUpperCase(),
                              style: TextStyle(
                                  color: appMainColor,
                                  fontSize: 13.0,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: .3)),
                          Row(children: <Widget>[
                            Padding(
                                padding: EdgeInsets.only(top: 2.0, right: 8.0),
                                child: Image.asset(imagesPath + "time.png",
                                    width: 17, color: Colors.grey[700])),
                            Text("10:05am",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 11.0,
                                    letterSpacing: .5))
                          ])
                        ])),
                subtitle: Container(
                  padding: EdgeInsets.only(top: 5.0),
                  child: Column(children: <Widget>[
                    Text(
                        "NASA goes to Mars: Astronauts could land on Red Planet by 2039",
                        style: TextStyle(
                            height: 1.8,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            letterSpacing: .1)),
                    Padding(
                      padding: EdgeInsets.only(top: 10.0),
                      child: Text(
                          "“Journey to Mars and back again is a great challenge and the biggest part is the strategy.”",
                          style: TextStyle(
                              height: 1.8,
                              fontSize: 12.0,
                              color: Colors.black45,
                              letterSpacing: .1)),
                    )
                  ]),
                ),
                isThreeLine: true),
            //Type: Followed
            ListTile(
                onTap: () {},
                contentPadding: _contentPadding,
                leading: Image.asset(imagesPath + "follow.png",
                    width: 30.0,
                    fit: BoxFit.cover,
                    color: Colors.grey[800]), //Bad icon, thin line
                title: Container(
                    margin: EdgeInsets.only(top: 12.0, bottom: 10.0),
                    child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text("followed".toUpperCase(),
                              style: TextStyle(
                                  color: appMainColor,
                                  fontSize: 13.0,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: .3)),
                          Row(children: <Widget>[
                            Padding(
                                padding: EdgeInsets.only(top: 2.0, right: 8.0),
                                child: Image.asset(imagesPath + "time.png",
                                    width: 17, color: Colors.grey[700])),
                            Text("2:51am",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 11.0,
                                    letterSpacing: .5))
                          ])
                        ])),
                subtitle: Padding(
                  padding: EdgeInsets.only(top: 5.0),
                  child: Text('"Travel" channel',
                      style: TextStyle(
                          height: 1.8,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          letterSpacing: .1)),
                ),
                isThreeLine: true),
            //Type: Shared
            ListTile(
                onTap: () {},
                contentPadding: _contentPadding,
                leading: Image.asset(imagesPath + "share.png",
                    width: 25.0, fit: BoxFit.fill, color: Colors.grey[500]),
                title: Container(
                    margin: EdgeInsets.only(top: 12.0, bottom: 10.0),
                    child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text("shared".toUpperCase(),
                              style: TextStyle(
                                  color: appMainColor,
                                  fontSize: 13.0,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: .3)),
                          Row(children: <Widget>[
                            Padding(
                                padding: EdgeInsets.only(top: 2.0, right: 8.0),
                                child: Image.asset(imagesPath + "time.png",
                                    width: 17, color: Colors.grey[700])),
                            Text("2:52am",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 11.0,
                                    letterSpacing: .5))
                          ])
                        ])),
                subtitle: Padding(
                  padding: EdgeInsets.only(top: 5.0),
                  child: Text(
                      "NASA goes to Mars: Astronauts could land on Red Planet by 2039",
                      style: TextStyle(
                          height: 1.8,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          letterSpacing: .1)),
                ),
                isThreeLine: true)
          ]))
        ])));
  }
}
