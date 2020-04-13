import 'dart:ui';
import 'package:flutter/material.dart';
import '../inc/init.dart';
import 'story/story.dart' show Story;

class Bookmarks extends StatefulWidget {
  @override
  _BookmarksState createState() => _BookmarksState();
}

class _BookmarksState extends State<Bookmarks> {
  final double newsSpansSize = 11.0;
  final double sourceIconSize = 12.0;
  final double timeIconSize = 16.0;

  Widget _getBookmarksStories(
      {String title,
      String source,
      String datetime,
      String section,
      Function onTap}) {
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
          Row(mainAxisSize: MainAxisSize.max, children: <Widget>[
            Image.asset(imagesPath + "time.png",
                width: timeIconSize, color: Colors.grey[800]),
            Text("  $datetime",
                style: TextStyle(color: Colors.black, fontSize: newsSpansSize))
          ]),
          //Section
          Expanded(
              child: Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                      onTap: () => print(section.toUpperCase() + " Clicked!"),
                      child: Container(
                          // alignment: Alignment.centerRight,
                          padding: EdgeInsets.only(bottom: 5.0),
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      color: Color.fromRGBO(140, 140, 140, 1),
                                      width: 1.0))),
                          child: Text(section.toUpperCase(),
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                  fontSize: newsSpansSize,
                                  color: Colors.black))))))
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
          //UI Title
          Container(
              width: screenSize(window).width,
              height: 100.0,
              color: appSecColor,
              child: Center(
                child: Text("bookmarks".toUpperCase(),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2.0)),
              )),
          //Bookmarked items - Stories only for now
          Expanded(
              child: ListView(children: <Widget>[
            _getBookmarksStories(
                title:
                    "NASA goes to Mars: Astronauts could land on Red Planet by 2039",
                source: "SPACE.com",
                datetime: "Feb 27, 2020",
                section: "section #1",
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Story(1)))),
            _getBookmarksStories(
                title: "Archaeologists discovered lost city in Honduran jungle",
                source: "CNN",
                datetime: "Apr 3, 2015",
                section: "section #2",
                onTap: () => Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Story()))),
            _getBookmarksStories(
                title:
                    "The balloons that could fly tourists to the edge of space",
                source: "CNN",
                datetime: "Apr 1, 2015",
                section: "section #3",
                onTap: () => Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Story()))),
            _getBookmarksStories(
                title:
                    "Praesent convallis posuere euismod Nulla sodales cras amet",
                source: "BBC",
                datetime: "Feb 10, 2020",
                section: "section #4",
                onTap: () => Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Story())))
          ]))
        ])));
  }
}
