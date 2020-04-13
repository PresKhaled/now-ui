import 'package:flutter/material.dart';
import 'dart:ui';

import '../../inc/init.dart';

//import 'package:shared_preferences/shared_preferences.dart';

class OnBoard extends StatefulWidget {
  @override
  _OnBoardState createState() => _OnBoardState();
}

class _OnBoardState extends State<OnBoard> {
  final int _pages = 4;
  int _currentPage = 0;
  //String _slider = '0';

  PageController _onboardPagesController;

  Future _saveUserOnBoard() async {
    //final _preferences = await SharedPreferences.getInstance();
    //_preferences.setInt("onBoard", 1);
    Navigator.popAndPushNamed(context, "/Login");
  }

  Widget _getSlider() {
    return Container(
      width: screenSize(window).width * .50,
      child: Stack(children: <Widget>[
        Container(
          width: screenSize(window).width * .50,
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(width: 1.0, color: Colors.white24))),
        ),
        Container(
          width: screenSize(window).width * .50 / (_pages / (_currentPage + 1)),
          color: Colors.white,
          height: 1.0,
        )
      ]),
    );
  }

  @override
  void initState() {
    super.initState();
    _onboardPagesController = PageController(initialPage: 0);
    _onboardPagesController.addListener(() {
      setState(() {
        //_slider = _onboardPagesController.page.toStringAsFixed(3);
        _currentPage = _onboardPagesController.page.floor();
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _onboardPagesController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            padding: EdgeInsets.only(top: statusBarHeight(context)),
            color: appMainColor,
            child: PageView(
                controller: _onboardPagesController,
                children: <Widget>[
                  //Page 1
                  Container(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                        Container(
                            child: Text(
                                (_currentPage + 1).toString() +
                                    " of " +
                                    _pages.toString(),
                                style: TextStyle(
                                    color: Colors.white, fontSize: 24.0))),
                        Container(
                            child: Image.asset(imagesPath + "device1.png",
                                height: 150.0, fit: BoxFit.cover)),
                        Container(
                            child: Text(
                                "Explore the latest news\nfrom your mobile device",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1.1,
                                    height: 1.6))),
                        _getSlider()
                      ])),

                  //Page 2
                  Container(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                        Container(
                            child: Text(
                                (_currentPage + 1).toString() +
                                    " of " +
                                    _pages.toString(),
                                style: TextStyle(
                                    color: Colors.white, fontSize: 24.0))),
                        Container(
                            child: Image.asset(imagesPath + "device2.png",
                                height: 150.0, fit: BoxFit.cover)),
                        Container(
                            child: Text(
                                "Explore the latest news\nfrom your mobile device",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1.1,
                                    height: 1.6))),
                        _getSlider()
                      ])),

                  //Page 3
                  Container(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                        Container(
                            child: Text(
                                (_currentPage + 1).toString() +
                                    " of " +
                                    _pages.toString(),
                                style: TextStyle(
                                    color: Colors.white, fontSize: 24.0))),
                        Container(
                            child: Image.asset(imagesPath + "device3.png",
                                height: 150.0, fit: BoxFit.cover)),
                        Container(
                            child: Text(
                                "Explore the latest news\nfrom your mobile device",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1.1,
                                    height: 1.6))),
                        _getSlider()
                      ])),

                  //Page 4
                  Container(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                        Container(
                            child: Text(
                                (_currentPage + 1).toString() +
                                    " of " +
                                    _pages.toString(),
                                style: TextStyle(
                                    color: Colors.white, fontSize: 24.0))),
                        Container(
                            child: Image.asset(imagesPath + "devices.png",
                                height: 150.0, fit: BoxFit.cover)),
                        Container(
                            child: Text(
                                "Explore the latest news\nfrom your mobile device",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1.1,
                                    height: 1.6))),
                        Container(
                            child: FlatButton(
                                onPressed: () => _saveUserOnBoard(),
                                child: Text("Start!",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 22.0,
                                        fontWeight: FontWeight.bold))))
                      ])),
                ])));
  }
}
