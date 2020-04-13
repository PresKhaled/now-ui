import 'dart:ui';
import 'package:flutter/material.dart';
import '../../inc/init.dart';
import 'channel.dart' show Channel;

class Channels extends StatefulWidget {
  @override
  _ChannelsState createState() => _ChannelsState();
}

class _ChannelsState extends State<Channels>
    with SingleTickerProviderStateMixin {
  TabController _channelsTabBarController;
  final mainNewsHeight = screenSize(window).height / 2.5;
  final double _channelsTabBarHeight = 75.5;

  BorderSide _getActiveTabBorder(int currentActiveTab) {
    return _channelsTabBarController.index == currentActiveTab
        ? BorderSide(color: Colors.white38, width: 1.0)
        : BorderSide(color: Colors.transparent, width: 1.0);
  }

  Widget _getChannel(String image, String name, Function onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
          child: Stack(children: <Widget>[
        Container(
            height: 220.0,
            child: Image.asset(imagesPath + image, fit: BoxFit.cover)),
        Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: <Color>[
          Colors.black38,
          Colors.black12,
          Colors.transparent
        ], stops: [
          .0,
          .3,
          1.0
        ], begin: Alignment.bottomCenter, end: Alignment.topCenter))),
        Container(
            alignment: Alignment.bottomLeft,
            padding: EdgeInsets.only(left: 18.0, bottom: 20.0),
            child: Text(name.toUpperCase(),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 13.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: .5)))
      ])),
    );
  }

  @override
  void initState() {
    super.initState();
    _channelsTabBarController = TabController(length: 3, vsync: this);
    //Swipe change active tab
    _channelsTabBarController.addListener(() {
      setState(() {
        _channelsTabBarController.index = _channelsTabBarController.index;
      });
    });
  }

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
            backgroundColor: appMainColor),
        body: Container(
            width: screenSize(window).width,
            height: screenSize(window).height,
            child: Column(children: <Widget>[
              //Channels TabBar
              Container(
                  height: _channelsTabBarHeight,
                  color: Color.fromRGBO(236, 93, 47, 1.0),
                  padding: EdgeInsets.all(10.0),
                  child: Column(children: <Widget>[
                    //Filter tabs
                    Expanded(
                        child: TabBar(
                            controller: _channelsTabBarController,
                            indicator: BoxDecoration(),
                            labelPadding: EdgeInsets.zero,
                            tabs: <Widget>[
                          //Following
                          Tab(
                              child: FlatButton(
                                  onPressed: () {
                                    setState(() {
                                      _channelsTabBarController.index = 0;
                                    });
                                  },
                                  child: Text("Following",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 12.0)),
                                  shape: RoundedRectangleBorder(
                                      side: _getActiveTabBorder(0),
                                      borderRadius:
                                          BorderRadius.circular(25.0)),
                                  padding: EdgeInsets.fromLTRB(
                                      20.0, 12.0, 20.0, 12.0))),
                          //Popular
                          Tab(
                              child: FlatButton(
                                  onPressed: () {
                                    setState(() {
                                      _channelsTabBarController.index = 1;
                                    });
                                  },
                                  child: Text("Popular",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 12.0)),
                                  shape: RoundedRectangleBorder(
                                      side: _getActiveTabBorder(1),
                                      borderRadius:
                                          BorderRadius.circular(25.0)),
                                  padding: EdgeInsets.fromLTRB(
                                      20.0, 12.0, 20.0, 12.0))),
                          //Explore
                          Tab(
                              child: FlatButton(
                                  onPressed: () {
                                    setState(() {
                                      _channelsTabBarController.index = 2;
                                    });
                                  },
                                  child: Text("Explore",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 12.0)),
                                  shape: RoundedRectangleBorder(
                                      side: _getActiveTabBorder(2),
                                      borderRadius:
                                          BorderRadius.circular(25.0)),
                                  padding: EdgeInsets.fromLTRB(
                                      20.0, 12.0, 20.0, 12.0))),
                        ]))
                  ])),
              //Channels tabs
              Expanded(
                  child: TabBarView(
                      controller: _channelsTabBarController,
                      children: <Tab>[
                    //Following view
                    Tab(
                        child: Container(
                            height: screenSize(window).height -
                                _channelsTabBarHeight,
                            child: Column(children: <Widget>[
                              //TODO: Load more when reach the end
                              Expanded(
                                  child: GridView.count(
                                      crossAxisCount: 2,
                                      children: <Widget>[
                                    //Some Channel
                                    _getChannel(
                                        "story-image.png", "some channel", () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Channel()));
                                    }),
                                    //Science
                                    _getChannel("science.png", "science", () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  Channel("science")));
                                    }),
                                    //Auto
                                    _getChannel("auto.png", "auto", () {}),
                                    //Technology
                                    _getChannel(
                                        "technology.png", "technology", () {}),
                                    //Some Channel
                                    _getChannel("story-image.png",
                                        "some channel", () {}),
                                    //Environment
                                    _getChannel("environment.png",
                                        "environment", () {}),
                                  ]))
                            ]))),
                    //Popluar view
                    Tab(
                        child: Container(
                            height: screenSize(window).height -
                                _channelsTabBarHeight,
                            child: Column(children: <Widget>[
                              //TODO: Load more when reach the end
                              Expanded(
                                  child: GridView.count(
                                      crossAxisCount: 2,
                                      children: <Widget>[
                                    //Science
                                    _getChannel(
                                        "science.png", "science", () {}),
                                    //Auto
                                    _getChannel("auto.png", "auto", () {}),
                                    //Technology
                                    _getChannel(
                                        "technology.png", "technology", () {}),
                                    //Unkown Channel
                                    _getChannel(
                                        "main.jpg", "unkown channel", () {}),
                                    //Environment
                                    _getChannel("environment.png",
                                        "environment", () {}),
                                    //Some Channel
                                    _getChannel("story-image.png",
                                        "some channel", () {}),
                                    //Some Channel
                                    _getChannel("story-image.png",
                                        "some channel", () {}),
                                  ]))
                            ]))),
                    //Explore view
                    Tab(
                        child: Container(
                            height: screenSize(window).height -
                                _channelsTabBarHeight,
                            child: Column(children: <Widget>[
                              //TODO: Load more when reach the end
                              Expanded(
                                  child: GridView
                                      .count(crossAxisCount: 2, children: <
                                          Widget>[
                                //Some Channel
                                _getChannel(
                                    "story-image.png", "some channel", () {}),
                                //Science
                                _getChannel("science.png", "science", () {}),
                                //Auto
                                _getChannel("auto.png", "auto", () {}),
                                //Technology
                                _getChannel(
                                    "technology.png", "technology", () {}),
                                //Some Channel
                                _getChannel(
                                    "story-image.png", "some channel", () {}),
                                //Some Channel
                                _getChannel("story-image.png",
                                    "some channel else", () {}),
                                //Environment
                                _getChannel(
                                    "environment.png", "environment", () {}),
                                //Science
                                _getChannel("science.png", "science", () {}),
                                //Auto
                                _getChannel("auto.png", "auto", () {}),
                                //Technology
                                _getChannel(
                                    "technology.png", "technology", () {}),
                              ]))
                            ])))
                  ]))
            ])));
  }
}
