import 'dart:ui';
import 'package:flutter/material.dart';
import '../../inc/init.dart';

class Comments extends StatefulWidget {
  @override
  _CommentsState createState() => _CommentsState();
}

class _CommentsState extends State<Comments>
    with SingleTickerProviderStateMixin {
  TabController _commentsTabBarController;
  int _commentsCount = 100;
  final mainNewsHeight = screenSize(window).height / 2.5;
  FocusNode messageFocus;
  bool isFocusedMessage = false;

  String _getCommentsCount(int ccount) {
    if (ccount < 11) {
      return ccount.toString() + " comments".toUpperCase();
    } else {
      return ccount.toString() + " comment".toUpperCase();
    }
  }

  BorderSide _getActiveTabBorder(int currentActiveTab) {
    return _commentsTabBarController.index == currentActiveTab
        ? BorderSide(color: Colors.white38, width: 1.0)
        : BorderSide(color: Colors.transparent, width: 1.0);
  }

  void _handleFocusChangeMessage() {
    if (messageFocus.hasFocus != isFocusedMessage) {
      setState(() {
        isFocusedMessage = messageFocus.hasFocus;
      });
    }
  }

  void _submit() => print("Done!");

  @override
  void initState() {
    super.initState();
    _commentsTabBarController = TabController(length: 3, vsync: this);
    //Swipe change active tab
    _commentsTabBarController.addListener(() {
      setState(() {
        _commentsTabBarController.index = _commentsTabBarController.index;
      });
    });
    messageFocus = FocusNode();
    messageFocus.addListener(_handleFocusChangeMessage);
  }

  @override
  void dispose() {
    super.dispose();
    messageFocus.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            width: screenSize(window).width,
            height: screenSize(window).height,
            child: Column(children: <Widget>[
              //Filter tabs
              Container(
                  height: mainNewsHeight / 2,
                  color: Color.fromRGBO(236, 93, 47, 1.0),
                  padding: EdgeInsets.all(25.0),
                  child: Column(children: <Widget>[
                    Container(
                        margin: EdgeInsets.only(top: 10.0, bottom: 25.0),
                        child: Text(_getCommentsCount(_commentsCount),
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 22.0,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.0))),
                    Expanded(
                        child: Container(
                            margin: EdgeInsets.only(top: 10.0),
                            child: TabBar(
                                controller: _commentsTabBarController,
                                indicator: BoxDecoration(),
                                labelPadding: EdgeInsets.zero,
                                tabs: <Widget>[
                                  //Best
                                  Tab(
                                      child: FlatButton(
                                          onPressed: () {
                                            setState(() {
                                              _commentsTabBarController.index =
                                                  0;
                                            });
                                          },
                                          child: Text("Best",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 12.0)),
                                          shape: RoundedRectangleBorder(
                                              side: _getActiveTabBorder(0),
                                              borderRadius:
                                                  BorderRadius.circular(25.0)),
                                          padding: EdgeInsets.fromLTRB(
                                              35.0, 11.0, 35.0, 11.0))),
                                  //Newest
                                  Tab(
                                      child: FlatButton(
                                          onPressed: () {
                                            setState(() {
                                              _commentsTabBarController.index =
                                                  1;
                                            });
                                          },
                                          child: Text("Newest",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 12.0)),
                                          shape: RoundedRectangleBorder(
                                              side: _getActiveTabBorder(1),
                                              borderRadius:
                                                  BorderRadius.circular(25.0)),
                                          padding: EdgeInsets.fromLTRB(
                                              35.0, 11.0, 35.0, 11.0))),
                                  //Oldest
                                  Tab(
                                      child: FlatButton(
                                          onPressed: () {
                                            setState(() {
                                              _commentsTabBarController.index =
                                                  2;
                                            });
                                          },
                                          child: Text("Oldest",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 12.0)),
                                          shape: RoundedRectangleBorder(
                                              side: _getActiveTabBorder(2),
                                              borderRadius:
                                                  BorderRadius.circular(25.0)),
                                          padding: EdgeInsets.fromLTRB(
                                              35.0, 11.0, 35.0, 11.0))),
                                ])))
                  ])),
              //Tabs views
              Expanded(
                child: TabBarView(
                    controller: _commentsTabBarController,
                    children: <Tab>[
                      //Best view
                      Tab(
                          child: Container(
                              height: screenSize(window).height -
                                  (mainNewsHeight / 2),
                              child: Column(children: <Widget>[
                                //TODO: Load more when reach the end
                                Expanded(
                                    child: ListView(children: <Widget>[
                                  //Comment #1
                                  ListTile(
                                      onTap: () {},
                                      contentPadding: EdgeInsets.all(15.0),
                                      leading: Container(
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(18.0)),
                                              boxShadow: <BoxShadow>[
                                                BoxShadow(
                                                    color: Colors.black12,
                                                    blurRadius: 5.0,
                                                    offset: Offset(.0, 2.0))
                                              ]),
                                          child: CircleAvatar(
                                              child: Image.asset(
                                                  imagesPath + "profile.png"),
                                              radius: 18.0)),
                                      title: Padding(
                                        padding: EdgeInsets.only(
                                            top: 14.0, bottom: 10.0),
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              //TODO: Fix username long overflow issue
                                              Container(
                                                  child: Text(
                                                "Mohamed Ismaail",
                                                style: TextStyle(
                                                    fontSize: 14.0,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )),
                                              Row(children: <Widget>[
                                                Container(
                                                    margin: EdgeInsets.only(
                                                        right: 18.0),
                                                    child:
                                                        Row(children: <Widget>[
                                                      Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  top: 2.0,
                                                                  right: 8.0),
                                                          child: Image.asset(
                                                              imagesPath +
                                                                  "time.png",
                                                              width: 17,
                                                              color: Colors
                                                                  .grey[700])),
                                                      RichText(
                                                          text: TextSpan(
                                                              children: [
                                                            TextSpan(
                                                                text: "Apr 3,",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .black,
                                                                    fontSize:
                                                                        11.0,
                                                                    fontFamily:
                                                                        "Montserrat",
                                                                    letterSpacing:
                                                                        .5)),
                                                            TextSpan(
                                                                text:
                                                                    "  1:22pm",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .grey,
                                                                    fontSize:
                                                                        11.0,
                                                                    fontFamily:
                                                                        "Montserrat"))
                                                          ]))
                                                    ])),
                                                Container(
                                                    child:
                                                        Row(children: <Widget>[
                                                  Padding(
                                                      padding: EdgeInsets.only(
                                                          top: 2.0, right: 7.0),
                                                      child: Image.asset(
                                                          imagesPath +
                                                              "like.png",
                                                          width: 17,
                                                          color: Colors
                                                              .grey[700])),
                                                  Text("12",
                                                      style: TextStyle(
                                                          fontSize: 12.0))
                                                ]))
                                              ])
                                            ]),
                                      ),
                                      subtitle: Container(
                                        padding: EdgeInsets.only(
                                            top: 10.0, bottom: 10.0),
                                        child: Text(
                                            "Such a massive change in such a short time is extremely unusual.",
                                            style: TextStyle(
                                                color: Colors.black,
                                                height: 1.5)),
                                      ),
                                      isThreeLine: true),
                                  //Comment #2
                                  ListTile(
                                      onTap: () {},
                                      contentPadding: EdgeInsets.all(15.0),
                                      leading: Container(
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(18.0)),
                                              boxShadow: <BoxShadow>[
                                                BoxShadow(
                                                    color: Colors.black12,
                                                    blurRadius: 5.0,
                                                    offset: Offset(.0, 2.0))
                                              ]),
                                          child: CircleAvatar(
                                              child: Image.asset(
                                                  imagesPath + "profile.png"),
                                              radius: 18.0)),
                                      title: Padding(
                                        padding: EdgeInsets.only(
                                            top: 14.0, bottom: 10.0),
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              //TODO: Fix username long overflow issue
                                              Container(
                                                  child: Text(
                                                "Khaled Mohsen",
                                                style: TextStyle(
                                                    fontSize: 14.0,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )),
                                              Row(children: <Widget>[
                                                Container(
                                                    margin: EdgeInsets.only(
                                                        right: 18.0),
                                                    child:
                                                        Row(children: <Widget>[
                                                      Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  top: 2.0,
                                                                  right: 8.0),
                                                          child: Image.asset(
                                                              imagesPath +
                                                                  "time.png",
                                                              width: 17,
                                                              color: Colors
                                                                  .grey[700])),
                                                      RichText(
                                                          text: TextSpan(
                                                              children: [
                                                            TextSpan(
                                                                text: "Apr 3,",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .black,
                                                                    fontSize:
                                                                        11.0,
                                                                    fontFamily:
                                                                        "Montserrat",
                                                                    letterSpacing:
                                                                        .5)),
                                                            TextSpan(
                                                                text:
                                                                    "  5:04pm",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .grey,
                                                                    fontSize:
                                                                        11.0,
                                                                    fontFamily:
                                                                        "Montserrat"))
                                                          ]))
                                                    ])),
                                                Container(
                                                    child:
                                                        Row(children: <Widget>[
                                                  Padding(
                                                      padding: EdgeInsets.only(
                                                          top: 2.0, right: 7.0),
                                                      child: Image.asset(
                                                          imagesPath +
                                                              "like.png",
                                                          width: 17,
                                                          color: Colors
                                                              .grey[700])),
                                                  Text("8",
                                                      style: TextStyle(
                                                          fontSize: 12.0))
                                                ]))
                                              ])
                                            ]),
                                      ),
                                      subtitle: Container(
                                        padding: EdgeInsets.only(
                                            top: 10.0, bottom: 10.0),
                                        child: Text(
                                            "Loss of Arctic sea ice is just one of the many changes that are.",
                                            style: TextStyle(
                                                color: Colors.black,
                                                height: 1.5)),
                                      ),
                                      isThreeLine: true),
                                  //Comment #3
                                  ListTile(
                                      onTap: () {},
                                      contentPadding: EdgeInsets.all(15.0),
                                      leading: Container(
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(18.0)),
                                              boxShadow: <BoxShadow>[
                                                BoxShadow(
                                                    color: Colors.black12,
                                                    blurRadius: 5.0,
                                                    offset: Offset(.0, 2.0))
                                              ]),
                                          child: CircleAvatar(
                                              child: Image.asset(
                                                  imagesPath + "profile.png"),
                                              radius: 18.0)),
                                      title: Padding(
                                        padding: EdgeInsets.only(
                                            top: 14.0, bottom: 10.0),
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              //TODO: Fix username long overflow issue
                                              Container(
                                                  child: Text(
                                                "Mahmoud Flower",
                                                style: TextStyle(
                                                    fontSize: 14.0,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )),
                                              Row(children: <Widget>[
                                                Container(
                                                    margin: EdgeInsets.only(
                                                        right: 18.0),
                                                    child:
                                                        Row(children: <Widget>[
                                                      Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  top: 2.0,
                                                                  right: 8.0),
                                                          child: Image.asset(
                                                              imagesPath +
                                                                  "time.png",
                                                              width: 17,
                                                              color: Colors
                                                                  .grey[700])),
                                                      RichText(
                                                          text: TextSpan(
                                                              children: [
                                                            TextSpan(
                                                                text: "Apr 3,",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .black,
                                                                    fontSize:
                                                                        11.0,
                                                                    fontFamily:
                                                                        "Montserrat",
                                                                    letterSpacing:
                                                                        .5)),
                                                            TextSpan(
                                                                text:
                                                                    "  10:34am",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .grey,
                                                                    fontSize:
                                                                        11.0,
                                                                    fontFamily:
                                                                        "Montserrat"))
                                                          ]))
                                                    ])),
                                                Container(
                                                    child:
                                                        Row(children: <Widget>[
                                                  Padding(
                                                      padding: EdgeInsets.only(
                                                          top: 2.0, right: 7.0),
                                                      child: Image.asset(
                                                          imagesPath +
                                                              "like.png",
                                                          width: 17,
                                                          color: Colors
                                                              .grey[700])),
                                                  Text("5",
                                                      style: TextStyle(
                                                          fontSize: 12.0))
                                                ]))
                                              ])
                                            ]),
                                      ),
                                      subtitle: Container(
                                        padding: EdgeInsets.only(
                                            top: 10.0, bottom: 10.0),
                                        child: Text(
                                            "Perhaps they had the same thing in the early 20th century.",
                                            style: TextStyle(
                                                color: Colors.black,
                                                height: 1.5)),
                                      ),
                                      isThreeLine: true),
                                  //Comment #4
                                  ListTile(
                                      onTap: () {},
                                      contentPadding: EdgeInsets.all(15.0),
                                      leading: Container(
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(18.0)),
                                              boxShadow: <BoxShadow>[
                                                BoxShadow(
                                                    color: Colors.black12,
                                                    blurRadius: 5.0,
                                                    offset: Offset(.0, 2.0))
                                              ]),
                                          child: CircleAvatar(
                                              child: Image.asset(
                                                  imagesPath + "profile.png"),
                                              radius: 18.0)),
                                      title: Padding(
                                        padding: EdgeInsets.only(
                                            top: 14.0, bottom: 10.0),
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              //TODO: Fix username long overflow issue
                                              Container(
                                                  child: Text(
                                                "Badr alel",
                                                style: TextStyle(
                                                    fontSize: 14.0,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )),
                                              Row(children: <Widget>[
                                                Container(
                                                    margin: EdgeInsets.only(
                                                        right: 18.0),
                                                    child:
                                                        Row(children: <Widget>[
                                                      Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  top: 2.0,
                                                                  right: 8.0),
                                                          child: Image.asset(
                                                              imagesPath +
                                                                  "time.png",
                                                              width: 17,
                                                              color: Colors
                                                                  .grey[700])),
                                                      RichText(
                                                          text: TextSpan(
                                                              children: [
                                                            TextSpan(
                                                                text: "Apr 3,",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .black,
                                                                    fontSize:
                                                                        11.0,
                                                                    fontFamily:
                                                                        "Montserrat",
                                                                    letterSpacing:
                                                                        .5)),
                                                            TextSpan(
                                                                text:
                                                                    "  11:53am",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .grey,
                                                                    fontSize:
                                                                        11.0,
                                                                    fontFamily:
                                                                        "Montserrat"))
                                                          ]))
                                                    ])),
                                                Container(
                                                    child:
                                                        Row(children: <Widget>[
                                                  Padding(
                                                      padding: EdgeInsets.only(
                                                          top: 2.0, right: 7.0),
                                                      child: Image.asset(
                                                          imagesPath +
                                                              "like.png",
                                                          width: 17,
                                                          color: Colors
                                                              .grey[700])),
                                                  Text("3",
                                                      style: TextStyle(
                                                          fontSize: 12.0))
                                                ]))
                                              ])
                                            ]),
                                      ),
                                      subtitle: Container(
                                        padding: EdgeInsets.only(
                                            top: 10.0, bottom: 10.0),
                                        child: Text(
                                            "Nunc id ipsum ut risus vehicula mollis. Aliquam volutpat.",
                                            style: TextStyle(
                                                color: Colors.black,
                                                height: 1.5)),
                                      ),
                                      isThreeLine: true)
                                ]))
                              ]))),
                      //Newest
                      Tab(
                          child: Container(
                              height: screenSize(window).height -
                                  (mainNewsHeight / 2),
                              child: Column(children: <Widget>[
                                //TODO: Load more when reach the end
                                Expanded(
                                    child: ListView(children: <Widget>[
                                  //Comment #1
                                  ListTile(
                                      onTap: () {},
                                      contentPadding: EdgeInsets.all(15.0),
                                      leading: Container(
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(18.0)),
                                              boxShadow: <BoxShadow>[
                                                BoxShadow(
                                                    color: Colors.black12,
                                                    blurRadius: 5.0,
                                                    offset: Offset(.0, 2.0))
                                              ]),
                                          child: CircleAvatar(
                                              child: Image.asset(
                                                  imagesPath + "profile.png"),
                                              radius: 18.0)),
                                      title: Padding(
                                        padding: EdgeInsets.only(
                                            top: 14.0, bottom: 10.0),
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              //TODO: Fix username long overflow issue
                                              Container(
                                                  child: Text(
                                                "Mohamed Ismaail",
                                                style: TextStyle(
                                                    fontSize: 14.0,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )),
                                              Row(children: <Widget>[
                                                Container(
                                                    margin: EdgeInsets.only(
                                                        right: 18.0),
                                                    child:
                                                        Row(children: <Widget>[
                                                      Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  top: 2.0,
                                                                  right: 8.0),
                                                          child: Image.asset(
                                                              imagesPath +
                                                                  "time.png",
                                                              width: 17,
                                                              color: Colors
                                                                  .grey[700])),
                                                      RichText(
                                                          text: TextSpan(
                                                              children: [
                                                            TextSpan(
                                                                text: "Apr 3,",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .black,
                                                                    fontSize:
                                                                        11.0,
                                                                    fontFamily:
                                                                        "Montserrat",
                                                                    letterSpacing:
                                                                        .5)),
                                                            TextSpan(
                                                                text:
                                                                    "  1:22pm",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .grey,
                                                                    fontSize:
                                                                        11.0,
                                                                    fontFamily:
                                                                        "Montserrat"))
                                                          ]))
                                                    ])),
                                                Container(
                                                    child:
                                                        Row(children: <Widget>[
                                                  Padding(
                                                      padding: EdgeInsets.only(
                                                          top: 2.0, right: 7.0),
                                                      child: Image.asset(
                                                          imagesPath +
                                                              "like.png",
                                                          width: 17,
                                                          color: Colors
                                                              .grey[700])),
                                                  Text("12",
                                                      style: TextStyle(
                                                          fontSize: 12.0))
                                                ]))
                                              ])
                                            ]),
                                      ),
                                      subtitle: Container(
                                        padding: EdgeInsets.only(
                                            top: 10.0, bottom: 10.0),
                                        child: Text(
                                            "Such a massive change in such a short time is extremely unusual.",
                                            style: TextStyle(
                                                color: Colors.black,
                                                height: 1.5)),
                                      ),
                                      isThreeLine: true),
                                  //Comment #2
                                  ListTile(
                                      onTap: () {},
                                      contentPadding: EdgeInsets.all(15.0),
                                      leading: Container(
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(18.0)),
                                              boxShadow: <BoxShadow>[
                                                BoxShadow(
                                                    color: Colors.black12,
                                                    blurRadius: 5.0,
                                                    offset: Offset(.0, 2.0))
                                              ]),
                                          child: CircleAvatar(
                                              child: Image.asset(
                                                  imagesPath + "profile.png"),
                                              radius: 18.0)),
                                      title: Padding(
                                        padding: EdgeInsets.only(
                                            top: 14.0, bottom: 10.0),
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              //TODO: Fix username long overflow issue
                                              Container(
                                                  child: Text(
                                                "Khaled Mohsen",
                                                style: TextStyle(
                                                    fontSize: 14.0,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )),
                                              Row(children: <Widget>[
                                                Container(
                                                    margin: EdgeInsets.only(
                                                        right: 18.0),
                                                    child:
                                                        Row(children: <Widget>[
                                                      Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  top: 2.0,
                                                                  right: 8.0),
                                                          child: Image.asset(
                                                              imagesPath +
                                                                  "time.png",
                                                              width: 17,
                                                              color: Colors
                                                                  .grey[700])),
                                                      RichText(
                                                          text: TextSpan(
                                                              children: [
                                                            TextSpan(
                                                                text: "Apr 3,",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .black,
                                                                    fontSize:
                                                                        11.0,
                                                                    fontFamily:
                                                                        "Montserrat",
                                                                    letterSpacing:
                                                                        .5)),
                                                            TextSpan(
                                                                text:
                                                                    "  5:04pm",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .grey,
                                                                    fontSize:
                                                                        11.0,
                                                                    fontFamily:
                                                                        "Montserrat"))
                                                          ]))
                                                    ])),
                                                Container(
                                                    child:
                                                        Row(children: <Widget>[
                                                  Padding(
                                                      padding: EdgeInsets.only(
                                                          top: 2.0, right: 7.0),
                                                      child: Image.asset(
                                                          imagesPath +
                                                              "like.png",
                                                          width: 17,
                                                          color: Colors
                                                              .grey[700])),
                                                  Text("8",
                                                      style: TextStyle(
                                                          fontSize: 12.0))
                                                ]))
                                              ])
                                            ]),
                                      ),
                                      subtitle: Container(
                                        padding: EdgeInsets.only(
                                            top: 10.0, bottom: 10.0),
                                        child: Text(
                                            "Loss of Arctic sea ice is just one of the many changes that are.",
                                            style: TextStyle(
                                                color: Colors.black,
                                                height: 1.5)),
                                      ),
                                      isThreeLine: true),
                                  //Comment #3
                                  ListTile(
                                      onTap: () {},
                                      contentPadding: EdgeInsets.all(15.0),
                                      leading: Container(
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(18.0)),
                                              boxShadow: <BoxShadow>[
                                                BoxShadow(
                                                    color: Colors.black12,
                                                    blurRadius: 5.0,
                                                    offset: Offset(.0, 2.0))
                                              ]),
                                          child: CircleAvatar(
                                              child: Image.asset(
                                                  imagesPath + "profile.png"),
                                              radius: 18.0)),
                                      title: Padding(
                                        padding: EdgeInsets.only(
                                            top: 14.0, bottom: 10.0),
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              //TODO: Fix username long overflow issue
                                              Container(
                                                  child: Text(
                                                "Mahmoud Flower",
                                                style: TextStyle(
                                                    fontSize: 14.0,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )),
                                              Row(children: <Widget>[
                                                Container(
                                                    margin: EdgeInsets.only(
                                                        right: 18.0),
                                                    child:
                                                        Row(children: <Widget>[
                                                      Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  top: 2.0,
                                                                  right: 8.0),
                                                          child: Image.asset(
                                                              imagesPath +
                                                                  "time.png",
                                                              width: 17,
                                                              color: Colors
                                                                  .grey[700])),
                                                      RichText(
                                                          text: TextSpan(
                                                              children: [
                                                            TextSpan(
                                                                text: "Apr 3,",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .black,
                                                                    fontSize:
                                                                        11.0,
                                                                    fontFamily:
                                                                        "Montserrat",
                                                                    letterSpacing:
                                                                        .5)),
                                                            TextSpan(
                                                                text:
                                                                    "  10:34am",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .grey,
                                                                    fontSize:
                                                                        11.0,
                                                                    fontFamily:
                                                                        "Montserrat"))
                                                          ]))
                                                    ])),
                                                Container(
                                                    child:
                                                        Row(children: <Widget>[
                                                  Padding(
                                                      padding: EdgeInsets.only(
                                                          top: 2.0, right: 7.0),
                                                      child: Image.asset(
                                                          imagesPath +
                                                              "like.png",
                                                          width: 17,
                                                          color: Colors
                                                              .grey[700])),
                                                  Text("5",
                                                      style: TextStyle(
                                                          fontSize: 12.0))
                                                ]))
                                              ])
                                            ]),
                                      ),
                                      subtitle: Container(
                                        padding: EdgeInsets.only(
                                            top: 10.0, bottom: 10.0),
                                        child: Text(
                                            "Perhaps they had the same thing in the early 20th century.",
                                            style: TextStyle(
                                                color: Colors.black,
                                                height: 1.5)),
                                      ),
                                      isThreeLine: true),
                                  //Comment #4
                                  ListTile(
                                      onTap: () {},
                                      contentPadding: EdgeInsets.all(15.0),
                                      leading: Container(
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(18.0)),
                                              boxShadow: <BoxShadow>[
                                                BoxShadow(
                                                    color: Colors.black12,
                                                    blurRadius: 5.0,
                                                    offset: Offset(.0, 2.0))
                                              ]),
                                          child: CircleAvatar(
                                              child: Image.asset(
                                                  imagesPath + "profile.png"),
                                              radius: 18.0)),
                                      title: Padding(
                                        padding: EdgeInsets.only(
                                            top: 14.0, bottom: 10.0),
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              //TODO: Fix username long overflow issue
                                              Container(
                                                  child: Text(
                                                "Badr alel",
                                                style: TextStyle(
                                                    fontSize: 14.0,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )),
                                              Row(children: <Widget>[
                                                Container(
                                                    margin: EdgeInsets.only(
                                                        right: 18.0),
                                                    child:
                                                        Row(children: <Widget>[
                                                      Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  top: 2.0,
                                                                  right: 8.0),
                                                          child: Image.asset(
                                                              imagesPath +
                                                                  "time.png",
                                                              width: 17,
                                                              color: Colors
                                                                  .grey[700])),
                                                      RichText(
                                                          text: TextSpan(
                                                              children: [
                                                            TextSpan(
                                                                text: "Apr 3,",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .black,
                                                                    fontSize:
                                                                        11.0,
                                                                    fontFamily:
                                                                        "Montserrat",
                                                                    letterSpacing:
                                                                        .5)),
                                                            TextSpan(
                                                                text:
                                                                    "  11:53am",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .grey,
                                                                    fontSize:
                                                                        11.0,
                                                                    fontFamily:
                                                                        "Montserrat"))
                                                          ]))
                                                    ])),
                                                Container(
                                                    child:
                                                        Row(children: <Widget>[
                                                  Padding(
                                                      padding: EdgeInsets.only(
                                                          top: 2.0, right: 7.0),
                                                      child: Image.asset(
                                                          imagesPath +
                                                              "like.png",
                                                          width: 17,
                                                          color: Colors
                                                              .grey[700])),
                                                  Text("3",
                                                      style: TextStyle(
                                                          fontSize: 12.0))
                                                ]))
                                              ])
                                            ]),
                                      ),
                                      subtitle: Container(
                                        padding: EdgeInsets.only(
                                            top: 10.0, bottom: 10.0),
                                        child: Text(
                                            "Nunc id ipsum ut risus vehicula mollis. Aliquam volutpat.",
                                            style: TextStyle(
                                                color: Colors.black,
                                                height: 1.5)),
                                      ),
                                      isThreeLine: true)
                                ]))
                              ]))),
                      //Oldest
                      Tab(
                          child: Container(
                              height: screenSize(window).height -
                                  (mainNewsHeight / 2),
                              child: Column(children: <Widget>[
                                //TODO: Load more when reach the end
                                Expanded(
                                    child: ListView(children: <Widget>[
                                  //Comment #1
                                  ListTile(
                                      onTap: () {},
                                      contentPadding: EdgeInsets.all(15.0),
                                      leading: Container(
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(18.0)),
                                              boxShadow: <BoxShadow>[
                                                BoxShadow(
                                                    color: Colors.black12,
                                                    blurRadius: 5.0,
                                                    offset: Offset(.0, 2.0))
                                              ]),
                                          child: CircleAvatar(
                                              child: Image.asset(
                                                  imagesPath + "profile.png"),
                                              radius: 18.0)),
                                      title: Padding(
                                        padding: EdgeInsets.only(
                                            top: 14.0, bottom: 10.0),
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              //TODO: Fix username long overflow issue
                                              Container(
                                                  child: Text(
                                                "Mohamed Ismaail",
                                                style: TextStyle(
                                                    fontSize: 14.0,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )),
                                              Row(children: <Widget>[
                                                Container(
                                                    margin: EdgeInsets.only(
                                                        right: 18.0),
                                                    child:
                                                        Row(children: <Widget>[
                                                      Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  top: 2.0,
                                                                  right: 8.0),
                                                          child: Image.asset(
                                                              imagesPath +
                                                                  "time.png",
                                                              width: 17,
                                                              color: Colors
                                                                  .grey[700])),
                                                      RichText(
                                                          text: TextSpan(
                                                              children: [
                                                            TextSpan(
                                                                text: "Apr 3,",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .black,
                                                                    fontSize:
                                                                        11.0,
                                                                    fontFamily:
                                                                        "Montserrat",
                                                                    letterSpacing:
                                                                        .5)),
                                                            TextSpan(
                                                                text:
                                                                    "  1:22pm",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .grey,
                                                                    fontSize:
                                                                        11.0,
                                                                    fontFamily:
                                                                        "Montserrat"))
                                                          ]))
                                                    ])),
                                                Container(
                                                    child:
                                                        Row(children: <Widget>[
                                                  Padding(
                                                      padding: EdgeInsets.only(
                                                          top: 2.0, right: 7.0),
                                                      child: Image.asset(
                                                          imagesPath +
                                                              "like.png",
                                                          width: 17,
                                                          color: Colors
                                                              .grey[700])),
                                                  Text("12",
                                                      style: TextStyle(
                                                          fontSize: 12.0))
                                                ]))
                                              ])
                                            ]),
                                      ),
                                      subtitle: Container(
                                        padding: EdgeInsets.only(
                                            top: 10.0, bottom: 10.0),
                                        child: Text(
                                            "Such a massive change in such a short time is extremely unusual.",
                                            style: TextStyle(
                                                color: Colors.black,
                                                height: 1.5)),
                                      ),
                                      isThreeLine: true),
                                  //Comment #2
                                  ListTile(
                                      onTap: () {},
                                      contentPadding: EdgeInsets.all(15.0),
                                      leading: Container(
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(18.0)),
                                              boxShadow: <BoxShadow>[
                                                BoxShadow(
                                                    color: Colors.black12,
                                                    blurRadius: 5.0,
                                                    offset: Offset(.0, 2.0))
                                              ]),
                                          child: CircleAvatar(
                                              child: Image.asset(
                                                  imagesPath + "profile.png"),
                                              radius: 18.0)),
                                      title: Padding(
                                        padding: EdgeInsets.only(
                                            top: 14.0, bottom: 10.0),
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              //TODO: Fix username long overflow issue
                                              Container(
                                                  child: Text(
                                                "Khaled Mohsen",
                                                style: TextStyle(
                                                    fontSize: 14.0,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )),
                                              Row(children: <Widget>[
                                                Container(
                                                    margin: EdgeInsets.only(
                                                        right: 18.0),
                                                    child:
                                                        Row(children: <Widget>[
                                                      Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  top: 2.0,
                                                                  right: 8.0),
                                                          child: Image.asset(
                                                              imagesPath +
                                                                  "time.png",
                                                              width: 17,
                                                              color: Colors
                                                                  .grey[700])),
                                                      RichText(
                                                          text: TextSpan(
                                                              children: [
                                                            TextSpan(
                                                                text: "Apr 3,",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .black,
                                                                    fontSize:
                                                                        11.0,
                                                                    fontFamily:
                                                                        "Montserrat",
                                                                    letterSpacing:
                                                                        .5)),
                                                            TextSpan(
                                                                text:
                                                                    "  5:04pm",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .grey,
                                                                    fontSize:
                                                                        11.0,
                                                                    fontFamily:
                                                                        "Montserrat"))
                                                          ]))
                                                    ])),
                                                Container(
                                                    child:
                                                        Row(children: <Widget>[
                                                  Padding(
                                                      padding: EdgeInsets.only(
                                                          top: 2.0, right: 7.0),
                                                      child: Image.asset(
                                                          imagesPath +
                                                              "like.png",
                                                          width: 17,
                                                          color: Colors
                                                              .grey[700])),
                                                  Text("8",
                                                      style: TextStyle(
                                                          fontSize: 12.0))
                                                ]))
                                              ])
                                            ]),
                                      ),
                                      subtitle: Container(
                                        padding: EdgeInsets.only(
                                            top: 10.0, bottom: 10.0),
                                        child: Text(
                                            "Loss of Arctic sea ice is just one of the many changes that are.",
                                            style: TextStyle(
                                                color: Colors.black,
                                                height: 1.5)),
                                      ),
                                      isThreeLine: true),
                                  //Comment #3
                                  ListTile(
                                      onTap: () {},
                                      contentPadding: EdgeInsets.all(15.0),
                                      leading: Container(
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(18.0)),
                                              boxShadow: <BoxShadow>[
                                                BoxShadow(
                                                    color: Colors.black12,
                                                    blurRadius: 5.0,
                                                    offset: Offset(.0, 2.0))
                                              ]),
                                          child: CircleAvatar(
                                              child: Image.asset(
                                                  imagesPath + "profile.png"),
                                              radius: 18.0)),
                                      title: Padding(
                                        padding: EdgeInsets.only(
                                            top: 14.0, bottom: 10.0),
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              //TODO: Fix username long overflow issue
                                              Container(
                                                  child: Text(
                                                "Mahmoud Flower",
                                                style: TextStyle(
                                                    fontSize: 14.0,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )),
                                              Row(children: <Widget>[
                                                Container(
                                                    margin: EdgeInsets.only(
                                                        right: 18.0),
                                                    child:
                                                        Row(children: <Widget>[
                                                      Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  top: 2.0,
                                                                  right: 8.0),
                                                          child: Image.asset(
                                                              imagesPath +
                                                                  "time.png",
                                                              width: 17,
                                                              color: Colors
                                                                  .grey[700])),
                                                      RichText(
                                                          text: TextSpan(
                                                              children: [
                                                            TextSpan(
                                                                text: "Apr 3,",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .black,
                                                                    fontSize:
                                                                        11.0,
                                                                    fontFamily:
                                                                        "Montserrat",
                                                                    letterSpacing:
                                                                        .5)),
                                                            TextSpan(
                                                                text:
                                                                    "  10:34am",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .grey,
                                                                    fontSize:
                                                                        11.0,
                                                                    fontFamily:
                                                                        "Montserrat"))
                                                          ]))
                                                    ])),
                                                Container(
                                                    child:
                                                        Row(children: <Widget>[
                                                  Padding(
                                                      padding: EdgeInsets.only(
                                                          top: 2.0, right: 7.0),
                                                      child: Image.asset(
                                                          imagesPath +
                                                              "like.png",
                                                          width: 17,
                                                          color: Colors
                                                              .grey[700])),
                                                  Text("5",
                                                      style: TextStyle(
                                                          fontSize: 12.0))
                                                ]))
                                              ])
                                            ]),
                                      ),
                                      subtitle: Container(
                                        padding: EdgeInsets.only(
                                            top: 10.0, bottom: 10.0),
                                        child: Text(
                                            "Perhaps they had the same thing in the early 20th century.",
                                            style: TextStyle(
                                                color: Colors.black,
                                                height: 1.5)),
                                      ),
                                      isThreeLine: true),
                                  //Comment #4
                                  ListTile(
                                      onTap: () {},
                                      contentPadding: EdgeInsets.all(15.0),
                                      leading: Container(
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(18.0)),
                                              boxShadow: <BoxShadow>[
                                                BoxShadow(
                                                    color: Colors.black12,
                                                    blurRadius: 5.0,
                                                    offset: Offset(.0, 2.0))
                                              ]),
                                          child: CircleAvatar(
                                              child: Image.asset(
                                                  imagesPath + "profile.png"),
                                              radius: 18.0)),
                                      title: Padding(
                                        padding: EdgeInsets.only(
                                            top: 14.0, bottom: 10.0),
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              //TODO: Fix username long overflow issue
                                              Container(
                                                  child: Text(
                                                "Badr alel",
                                                style: TextStyle(
                                                    fontSize: 14.0,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )),
                                              Row(children: <Widget>[
                                                Container(
                                                    margin: EdgeInsets.only(
                                                        right: 18.0),
                                                    child:
                                                        Row(children: <Widget>[
                                                      Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  top: 2.0,
                                                                  right: 8.0),
                                                          child: Image.asset(
                                                              imagesPath +
                                                                  "time.png",
                                                              width: 17,
                                                              color: Colors
                                                                  .grey[700])),
                                                      RichText(
                                                          text: TextSpan(
                                                              children: [
                                                            TextSpan(
                                                                text: "Apr 3,",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .black,
                                                                    fontSize:
                                                                        11.0,
                                                                    fontFamily:
                                                                        "Montserrat",
                                                                    letterSpacing:
                                                                        .5)),
                                                            TextSpan(
                                                                text:
                                                                    "  11:53am",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .grey,
                                                                    fontSize:
                                                                        11.0,
                                                                    fontFamily:
                                                                        "Montserrat"))
                                                          ]))
                                                    ])),
                                                Container(
                                                    child:
                                                        Row(children: <Widget>[
                                                  Padding(
                                                      padding: EdgeInsets.only(
                                                          top: 2.0, right: 7.0),
                                                      child: Image.asset(
                                                          imagesPath +
                                                              "like.png",
                                                          width: 17,
                                                          color: Colors
                                                              .grey[700])),
                                                  Text("3",
                                                      style: TextStyle(
                                                          fontSize: 12.0))
                                                ]))
                                              ])
                                            ]),
                                      ),
                                      subtitle: Container(
                                        padding: EdgeInsets.only(
                                            top: 10.0, bottom: 10.0),
                                        child: Text(
                                            "Nunc id ipsum ut risus vehicula mollis. Aliquam volutpat.",
                                            style: TextStyle(
                                                color: Colors.black,
                                                height: 1.5)),
                                      ),
                                      isThreeLine: true)
                                ]))
                              ])))
                    ]),
              ),
              //Submit comment
              Container(
                height: 65.0,
                child: OverflowBox(
                    child: //Message
                        Container(
                            //padding: EdgeInsets.all(5.0),
                            child: TextFormField(
                                focusNode: messageFocus,
                                onEditingComplete: () => _submit(),
                                maxLines: 10,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    prefixIcon: GestureDetector(
                                      onTap: () => print("K!"),
                                      child: Image.asset(
                                          imagesPath + "attachment.png",
                                          color: Colors.grey[850],
                                          scale: 1.8,
                                          semanticLabel:
                                              "Attachment Text Field, Icon (Attachment)"),
                                    ),
                                    hintText: "Write something...",
                                    hintStyle: TextStyle(
                                        fontSize: 13.0,
                                        color: Colors.grey[500]),
                                    contentPadding: EdgeInsets.all(20.0),
                                    suffixIcon: Padding(
                                      padding: EdgeInsets.only(
                                          left: 5.0, right: 2.0),
                                      child: GestureDetector(
                                        onTap: () => print("KK!"),
                                        child: Image.asset(
                                            imagesPath + "submit.png",
                                            color: appMainColor,
                                            scale: 1.8,
                                            semanticLabel:
                                                "Submit Text Field, Icon (Submit)"),
                                      ),
                                    )),
                                style: TextStyle(color: appMainColor)))),
              )
            ])));
  }
}
