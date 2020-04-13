import 'dart:ui';

import 'package:flutter/material.dart';

import '../account/login.dart' show Login;

final Color appMainColor = Color.fromRGBO(249, 99, 50, 1.0);
final Color appSecColor = Color.fromRGBO(236, 93, 47, 1.0);
final String imagesPath = "assets/images/";
final double appBarIconScale = 1.8;

bool loggedIn = false;

Size screenSize(Window window) {
  final _screenSize = MediaQueryData.fromWindow(window).size;
  return _screenSize;
}

double statusBarHeight(context) {
  final _statusBarHeight = MediaQuery.of(context).padding.top;
  return _statusBarHeight;
}

Widget _getDrawerListTile(
    {String image, String semanticLabel, String title, Function onTap}) {
  final double _perfixDrawerIconsSize = 22.0;
  final Color _drawerTitlesColor = Colors.white;
  final double _drawerTitlesSize = 14.0;
  return ListTile(
      onTap: onTap ?? () {},
      leading: Padding(
        padding: EdgeInsets.only(top: 2.5),
        child: Image.asset(imagesPath + image,
            semanticLabel: semanticLabel,
            width: _perfixDrawerIconsSize,
            fit: BoxFit.cover),
      ),
      title: Text(title,
          style: TextStyle(
              color: _drawerTitlesColor,
              fontSize: _drawerTitlesSize,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.0)),
      contentPadding: EdgeInsets.only(right: 35.0, left: 40.0));
}

Widget getDrawer(context) {
  return Drawer(
      elevation: .0,
      semanticLabel: "Navigation menu",
      child: SingleChildScrollView(
          child: Container(
              height: screenSize(window).height,
              width: screenSize(window).width,
              child: Column(children: <Widget>[
                Expanded(
                    child: Stack(children: <Widget>[
                  //Gridient
                  Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: <Color>[
                                Color.fromRGBO(0, 0, 0, .9),
                                appMainColor
                              ],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              stops: [.0, 1.0]))),
                  //Background image
                  Container(
                      margin: EdgeInsets.only(top: statusBarHeight(context)),
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                  imagesPath + "drawer-background.png"),
                              fit: BoxFit.cover))),
                  //Content
                  Container(
                      child: Column(children: <Widget>[
                    //Pages
                    Expanded(
                      child: Padding(
                          padding: EdgeInsets.only(top: 25.0, bottom: 25.0),
                          child: ListView(
                              physics: NeverScrollableScrollPhysics(),
                              children: <Widget>[
                                _getDrawerListTile(
                                    image: "news.png",
                                    semanticLabel: "News Icon",
                                    title: "NEWS",
                                    onTap: () => Navigator.popAndPushNamed(
                                        context, "/Discover")),
                                _getDrawerListTile(
                                    image: "channels.png",
                                    semanticLabel: "Channels Icon",
                                    title: "CHANNELS",
                                    onTap: () => Navigator.popAndPushNamed(
                                        context, "/Channels")),
                                _getDrawerListTile(
                                    image: "bookmarks.png",
                                    semanticLabel: "Bookmarks Icon",
                                    title: "BOOKMARKS",
                                    onTap: () {
                                      Navigator.popAndPushNamed(
                                          context, "/Bookmarks");
                                    }),
                                _getDrawerListTile(
                                    image: "overview.png",
                                    semanticLabel: "Overview Icon",
                                    title: "OVERVIEW",
                                    onTap: () => Navigator.popAndPushNamed(
                                        context, "/Overview")),
                                _getDrawerListTile(
                                    image: "calendar.png",
                                    semanticLabel: "Calendar Icon",
                                    title: "CALENDAR"),
                                _getDrawerListTile(
                                    image: "timeline.png",
                                    semanticLabel: "Timeline Icon",
                                    title: "TIMELINE",
                                    onTap: () {
                                      Navigator.popAndPushNamed(
                                          context, "/Timeline");
                                    }),
                                _getDrawerListTile(
                                    image: "profile.png",
                                    semanticLabel: "Profile Icon",
                                    title: "PROFILE",
                                    onTap: () {
                                      Navigator.popAndPushNamed(
                                          context, "/Profile");
                                    }),
                                _getDrawerListTile(
                                    image: "widgets.png",
                                    semanticLabel: "Widgets Icon",
                                    title: "WIDGETS"),
                                _getDrawerListTile(
                                    image: "settings.png",
                                    semanticLabel: "Settings Icon",
                                    title: "SETTINGS",
                                    onTap: () {
                                      Navigator.popAndPushNamed(
                                          context, "/Settings");
                                    }),
                                _getDrawerListTile(
                                    image: "contact.png",
                                    semanticLabel: "Contact Icon",
                                    title: "CONTACT US",
                                    onTap: () {
                                      Navigator.popAndPushNamed(
                                          context, "/ContactUs");
                                    })
                              ]))
                    ),
                    //User
                    Container(
                        //Some calculates here. get a coffee
                        height: 75.5,
                        margin: EdgeInsets.fromLTRB(40.0, .0, 35.0, 25.0),
                        padding: EdgeInsets.only(top: 27.5),
                        decoration: BoxDecoration(
                            border: Border(
                                top: BorderSide(
                                    width: .2, color: Colors.white70))),
                        //Info
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              //Username & logout
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    //Logout
                                    GestureDetector(
                                      onTap: () => logout(context),
                                      child: Text("LOG OUT",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.bold,
                                              letterSpacing: .5)),
                                    ),
                                    //Username
                                    Padding(
                                      padding: EdgeInsets.only(bottom: 6.0),
                                      child: GestureDetector(
                                        onTap: () {
                                          Navigator.popAndPushNamed(
                                              context, "/Profile");
                                        },
                                        child: Text("Khaled Mohsen",
                                            style: TextStyle(
                                                fontSize: 12.0,
                                                color: Colors.white70)),
                                      ),
                                    )
                                  ]),
                              //User picture
                              Padding(
                                  padding: EdgeInsets.only(bottom: 6.0),
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.popAndPushNamed(
                                          context, "/Profile");
                                    },
                                    child: CircleAvatar(
                                        radius: 35.0,
                                        backgroundColor: Colors.transparent,
                                        child: Image.asset(
                                            imagesPath + "logo.png",
                                            width: 30.0)),
                                  ))
                            ]))
                  ]))
                ]))
              ]))));
}

void logout(BuildContext context) {
  loggedIn = false;
  Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (BuildContext context) => Login()),
      ModalRoute.withName("/Login"));
}
