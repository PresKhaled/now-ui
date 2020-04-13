import 'dart:ui';
import 'package:flutter/material.dart';

import '../../inc/init.dart';
import '../story/story.dart' show Story;

class Channel extends StatefulWidget {
  final String _channel; //TODO: Change channel name to channel id
  Channel([this._channel]);
  @override
  _ChannelState createState() => _ChannelState(_channel);
}

class _ChannelState extends State<Channel> {
  String _channel;
  _ChannelState([this._channel]);
  int _timedown = 5;
  bool _channelStatus = false;
  final double newsSpansSize = 11.0;
  final double sourceIconSize = 12.0;
  final double timeIconSize = 16.0;

  //TODO: Fix dispose issue
  /*void _checkExistWithTimer() {
    if (_channel == null) {
      Future.delayed(Duration(seconds: 5), () {
        Navigator.pop(context);
      });
      if (_timedown != 1) {
        Timer.periodic(Duration(seconds: 1), (t) {
          setState(() {
            _timedown = _timedown - 1;
          });
        });
      }
    }
  }*/

  Widget _getChannelArticles(
      {String title, String source, String datetime, Function onTap}) {
    return ListTile(
      onTap: onTap,
      contentPadding: EdgeInsets.all(20.0),
      title: Container(
          margin: EdgeInsets.only(bottom: 20.0),
          child: Text(title,
              style: TextStyle(
                  fontSize: 20.0, fontWeight: FontWeight.bold, height: 1.4))),
      subtitle: //Source, DateTime
          Container(
              child: Row(mainAxisSize: MainAxisSize.max, children: <Widget>[
        //Source
        Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Row(children: <Widget>[
              Image.asset(imagesPath + "source.png",
                  width: sourceIconSize, color: Colors.grey[800]),
              Text("  $source",
                  style:
                      TextStyle(color: Colors.black, fontSize: newsSpansSize))
            ])),
        //DateTime
        Row(children: <Widget>[
          Image.asset(imagesPath + "time.png",
              width: timeIconSize, color: Colors.grey[800]),
          Text("  $datetime",
              style: TextStyle(color: Colors.black, fontSize: newsSpansSize))
        ])
      ])),
    );
  }

  void _toggleFollow() {
    setState(() {
      _channelStatus = _channelStatus != true ? true : false;
    });
  }

  Widget _getFollowButton() {
    return _channelStatus
        ? Container(
            width: 110.0,
            margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
            child: RaisedButton(
                onPressed: () => _toggleFollow(),
                child: Text("Following",
                    style: TextStyle(
                        color: appMainColor,
                        fontSize: 12.0,
                        fontWeight: FontWeight.bold,
                        letterSpacing: .3)),
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(35.0))),
                padding: EdgeInsets.only(top: 12.0, bottom: 12.0)),
          )
        : Container(
            width: 110.0,
            margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
            child: RaisedButton(
                onPressed: () => _toggleFollow(),
                child: Text("Follow",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 12.0,
                        fontWeight: FontWeight.bold,
                        letterSpacing: .3)),
                color: appMainColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(35.0))),
                padding: EdgeInsets.only(top: 12.0, bottom: 12.0)),
          );
  }

  @override
  void initState() {
    super.initState();
    //_checkExistWithTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //Drawer
        drawerScrimColor: Colors.transparent,
        drawer: getDrawer(context),
        //App Bar
        appBar: _channel != null
            ? AppBar(
                elevation: .0,
                leading: Builder(
                  builder: (context) => Tooltip(
                    message: "Open navigation menu",
                    child: GestureDetector(
                        child: Image.asset(imagesPath + "menu.png",
                            semanticLabel: "Aside (navigation) menu",
                            scale: appBarIconScale),
                        onTap: () => Scaffold.of(context).openDrawer()),
                  ),
                ), //Menu
                title: Image.asset(imagesPath + "logo.png",
                    scale: appBarIconScale), //Logo
                centerTitle: true,
                actions: <Widget>[
                  Tooltip(
                    message: "Settings",
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, "/Settings");
                      },
                      child: Container(
                          child: Image.asset(imagesPath + "settings.png",
                              scale: appBarIconScale)),
                    ),
                  )
                ],
                backgroundColor: appMainColor)
            : AppBar(
                backgroundColor: appMainColor,
                elevation: .0,
                leading: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Image.asset(imagesPath + "back.png",
                        scale: appBarIconScale)),
                title: Image.asset(imagesPath + "logo.png",
                    scale: appBarIconScale),
                centerTitle: true),
        body: _channel != null
            ? Container(
                child: Column(children: <Widget>[
                //Static content
                Container(
                    height: screenSize(window).height / 3.5,
                    child: Stack(children: <Widget>[
                      //Banner, Info
                      Container(
                          child: Image.asset(imagesPath + "channel-banner.png",
                              width: screenSize(window).width,
                              height: screenSize(window).height / 3.5,
                              fit: BoxFit.cover)),
                      //Banner gradient
                      /*Container(
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.bottomRight,
                                  end: Alignment.topLeft,
                                  colors: <Color>[
                            Colors.black26,
                            Colors.black12
                          ],
                                  stops: <double>[
                            .0,
                            .3
                          ]))),*/
                      //Info
                      Container(
                          alignment: Alignment.center,
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                Text(
                                    _channel.toUpperCase() +
                                        " channel".toUpperCase(),
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 1.1)),
                                _getFollowButton(),
                                Text("234K Followers",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: .2))
                              ]))
                    ])),
                //Content
                Expanded(
                    child: ListView(children: <Widget>[
                  _getChannelArticles(
                      title:
                          "NASA goes to Mars: Astronauts could land on Red Planet by 2039",
                      source: "SPACE.com",
                      datetime: "Feb 27, 2020",
                      onTap: () => Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Story(1)))),
                  _getChannelArticles(
                      title:
                          "Archaeologists discovered lost city in Honduran jungle",
                      source: "CNN",
                      datetime: "Apr 3, 2015",
                      onTap: () => Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Story()))),
                  _getChannelArticles(
                      title:
                          "The balloons that could fly tourists to the edge of space",
                      source: "CNN",
                      datetime: "Apr 1, 2015",
                      onTap: () => Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Story()))),
                  _getChannelArticles(
                      title:
                          "Praesent convallis posuere euismod Nulla sodales cras amet",
                      source: "BBC",
                      datetime: "Feb 10, 2020",
                      onTap: () => Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Story())))
                ]))
              ]))
            //Not found
            //TODO: Dynamic 404 function in init
            : Container(
                color: Colors.deepOrangeAccent,
                alignment: Alignment.center,
                child: Container(
                  height: screenSize(window).height / 4,
                  color: appMainColor,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("Channel not found",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.0)),
                        Padding(
                            padding: EdgeInsets.only(top: 15.0),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Padding(
                                      padding: EdgeInsets.only(right: 12.5),
                                      child: GestureDetector(
                                          onTap: () => Navigator.pop(context),
                                          child: Image.asset(
                                              imagesPath + "back.png",
                                              scale: appBarIconScale))),
                                  Text(_timedown.toString(),
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold))
                                ]))
                      ]),
                ),
              ));
  }
}
