//Core
import 'package:flutter/material.dart';
import 'dart:ui';

//Dependences
import '../inc/init.dart';
import '../ui/story/story.dart' show Story;

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final double newsSpansSize = 11.0;
  final double sourceIconSize = 12.0;
  final double timeIconSize = 16.0;

  Widget _getProfileStories(
      {String image,
      String title,
      String source,
      Function onTap,
      String section,
      Function sectionOnTap}) {
    //Story
    return InkWell(
        onTap: onTap,
        child: Container(
            height: 140.0,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  //Story image
                  Container(
                      width: 110.0,
                      height: 140.0,
                      child:
                          Image.asset(imagesPath + image, fit: BoxFit.cover)),
                  //Story basic info
                  Expanded(
                      child: Container(
                          padding: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: <Widget>[
                                Text(title,
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold,
                                        height: 1.7)),
                                Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            Image.asset(
                                                imagesPath + "source.png",
                                                width: sourceIconSize,
                                                color: Colors.grey[800]),
                                            Text("  $source",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: newsSpansSize))
                                          ]),
                                      Expanded(
                                          child: Align(
                                              alignment: Alignment.centerRight,
                                              child: GestureDetector(
                                                  onTap: sectionOnTap,
                                                  child: Container(
                                                      padding: EdgeInsets.only(
                                                          bottom: 5.0),
                                                      decoration: BoxDecoration(
                                                        border: Border(
                                                            bottom: BorderSide(
                                                                color: Color
                                                                    .fromRGBO(
                                                                        140,
                                                                        140,
                                                                        140,
                                                                        1),
                                                                width: 1.0)),
                                                      ),
                                                      child: Text(
                                                          section.toUpperCase(),
                                                          textAlign:
                                                              TextAlign.right,
                                                          style: TextStyle(
                                                              fontSize:
                                                                  newsSpansSize,
                                                              color: Colors
                                                                  .black))))))
                                    ])
                              ])))
                ])));
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
                            semanticLabel: "Aside (navigation) menu",
                            scale: appBarIconScale),
                        onTap: () =>
                            Scaffold.of(context).openDrawer()))), //Menu
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
                              scale: appBarIconScale))))
            ],
            backgroundColor: appMainColor),
        body: Container(
            child: Column(children: <Widget>[
          //Basic info
          Container(
              width: screenSize(window).width,
              color: appSecColor,
              padding: EdgeInsets.all(25.0),
              child: Column(children: <Widget>[
                CircleAvatar(
                    child: Image.asset(imagesPath + "logo.png", width: 45.0),
                    radius: 35.0,
                    backgroundColor: Colors.transparent),
                Padding(
                  padding: EdgeInsets.only(top: 8.0),
                  child: Text("Khaled Mohsen",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 22.0,
                          letterSpacing: 1.0)),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8.0),
                  child: Text("Web, Mobile developer",
                      style: TextStyle(color: Colors.white54, fontSize: 12.0)),
                )
              ])),
          //Statistics
          Container(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                //Comments
                InkWell(
                  onTap: () => print("Comments count pressed"),
                  child: Container(
                      width: screenSize(window).width / 3,
                      height: 85.0,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text("36",
                                style: TextStyle(
                                    fontSize: 22,
                                    letterSpacing: .5,
                                    color: appMainColor)),
                            Text("Comments",
                                style: TextStyle(
                                    fontSize: 13.0,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: .5))
                          ])),
                ),
                //Channels
                InkWell(
                  onTap: () => print("Channels count pressed"),
                  child: Container(
                      width: screenSize(window).width / 3,
                      height: 85.0,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text("17",
                                style: TextStyle(
                                    fontSize: 22,
                                    letterSpacing: .5,
                                    color: appMainColor)),
                            Text("Channels",
                                style: TextStyle(
                                    fontSize: 13.0,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: .5))
                          ])),
                ),
                //Bookmarks
                InkWell(
                  onTap: () => print("Bookmarks count pressed"),
                  child: Container(
                      width: screenSize(window).width / 3,
                      height: 85.0,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text("58",
                                style: TextStyle(
                                    fontSize: 22,
                                    letterSpacing: .5,
                                    color: appMainColor)),
                            Text("Bookmarks",
                                style: TextStyle(
                                    fontSize: 13.0,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: .5))
                          ])),
                )
              ])),
          //Stories
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                  child:
                      Column(mainAxisSize: MainAxisSize.max, children: <Widget>[
                _getProfileStories(
                    image: "main.jpg",
                    title:
                        "NASA goes to Mars: Astronauts could land on Red Planet by 2039",
                    source: "SPACE.com",
                    onTap: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Story())),
                    section: "science",
                    sectionOnTap: () => print("Science section pressed")),
                _getProfileStories(
                    image: "story-image.png",
                    title:
                        "Arctic sea ice hits lowest winter maximum on record",
                    source: "CNN",
                    onTap: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Story(1))),
                    section: "environment",
                    sectionOnTap: () => print("Environment section pressed")),
                _getProfileStories(
                    image: "balloon.png",
                    title:
                        "The balloons that could fly tourists to the edge of space",
                    source: "BBC",
                    onTap: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Story())),
                    section: "travel",
                    sectionOnTap: () => print("Travel section pressed")),
                _getProfileStories(
                    image: "technology.png",
                    title:
                        "Pellentesque augue tortor, efficitur vel porttitor sit amet.",
                    source: "Lorem",
                    onTap: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Story())),
                    section: "unkown",
                    sectionOnTap: () => print("Unkown section pressed"))
              ])),
            ),
          )
        ])));
  }
}
