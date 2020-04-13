import 'dart:ui';
import 'package:flutter/material.dart';
import '../inc/init.dart';

class Overview extends StatefulWidget {
  @override
  _OverviewState createState() => _OverviewState();
}

class _OverviewState extends State<Overview> {
  Widget _getChannelsPercents(
      {String channel = "Unkown", double percent = 0, String percentString}) {
    return Container(
        padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
        child: Column(children: <Widget>[
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(channel,
                    style: TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        letterSpacing: 1.0)),
                Text(percentString + '%',
                    style: TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        letterSpacing: 1.0))
              ]),
          Padding(
              padding: EdgeInsets.only(top: 20.0),
              child: Stack(children: <Widget>[
                Container(height: 1.0, color: Colors.white24),
                Container(
                    //TODO: Add BoxShadow to this Container with appropriate color from web
                    width: screenSize(window).width * percent,
                    height: 1.0,
                    color: Colors.white)
              ]))
        ]));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //Drawer
        drawerScrimColor: Colors.transparent,
        drawer: getDrawer(context),
        //App Bar
        appBar: AppBar(
            leading: Builder(
              builder: (context) => Tooltip(
                message: "Open navigation menu",
                child: GestureDetector(
                    child: Image.asset(imagesPath + "menu.png",
                        semanticLabel: "App Logo", scale: appBarIconScale),
                    onTap: () => Scaffold.of(context).openDrawer()),
              ),
            ), //Menu
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
            elevation: .0,
            backgroundColor: appMainColor),
        body: SingleChildScrollView(
            //There's padding in bottom, idk coming from where, maybe padding, DevTool inspector doesn't help
            child: Container(
                color: Color.fromRGBO(236, 93, 47, 1.0),
                width: screenSize(window).width,
                height: screenSize(window).height - statusBarHeight(context),
                child: Column(children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 40.0, bottom: 10.0),
                    child: Text("OVERVIEW",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 22.0,
                            letterSpacing: 1.0)),
                  ),
                  Text("What you are reading the most",
                      style: TextStyle(color: Colors.white54, fontSize: 12.0)),
                  Expanded(
                      child: Padding(
                          padding: EdgeInsets.all(25.0),
                          //Percents
                          child: ListView(
                              physics: NeverScrollableScrollPhysics(),
                              children: <Widget>[
                                _getChannelsPercents(
                                    channel: "FASHION",
                                    percent: .34,
                                    percentString: "34"),
                                _getChannelsPercents(
                                    channel: "ENVIRONMENT",
                                    percent: .28,
                                    percentString: "28"),
                                _getChannelsPercents(
                                    channel: "TECHNOLOGY",
                                    percent: .12,
                                    percentString: "12"),
                                _getChannelsPercents(
                                    channel: "AUTO",
                                    percent: .10,
                                    percentString: "10"),
                                _getChannelsPercents(
                                    channel: "FINANCES",
                                    percent: .08,
                                    percentString: "8"),
                                _getChannelsPercents(
                                    channel: "SCIENCE",
                                    percent: .05,
                                    percentString: "5"),
                                _getChannelsPercents(
                                    channel: "SPORT",
                                    percent: .03,
                                    percentString: "3")
                              ])))
                ]))));
  }
}
