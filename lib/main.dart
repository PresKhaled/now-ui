import 'dart:core';
import 'package:flutter/material.dart';

import 'inc/init.dart';
import 'ui/discover.dart' show Discover;
import 'ui/story/story.dart' show Story;
import 'ui/overview.dart' show Overview;
import 'ui/channels/channels.dart' show Channels;
//import 'ui/channels/channel.dart' show Channel;
import 'ui/timeline.dart' show Timeline;
import 'ui/bookmarks.dart' show Bookmarks;
import 'ui/contact/email.dart' show Email;
import 'account/login.dart' show Login;
import 'account/register.dart' show Register;
import 'account/forget_password.dart' show ForgetPassword;
import 'account/profile.dart' show Profile;
import 'account/settings.dart' show Settings;
import 'ui/onboard/onboard.dart' show OnBoard;

//import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(new Main());

class Main extends StatefulWidget {
  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  //int _userOnBoardStatus = 0;

  /*Future _getUserOnBoard() async {
    //final _preferences = await SharedPreferences.getInstance();
    //final int _status = _preferences.getInt("onBoard");
    setState(() {
      //_userOnBoardStatus = _status;
     // _userOnBoardStatus = 0;
    });
  }*/

  @override
  void initState() {
    super.initState();
    //_getUserOnBoard();
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        debugShowCheckedModeBanner: false,
        //Theme
        theme: new ThemeData(
            primaryColor: appMainColor, //Deep orange ~
            primarySwatch: Colors.deepOrange,
            cursorColor: appMainColor,
            fontFamily: "Montserrat",
            tooltipTheme: TooltipThemeData(
                showDuration: Duration(seconds: 3),
                decoration: BoxDecoration(
                    color: Colors.deepOrange,
                    borderRadius: BorderRadius.all(Radius.circular(25.0)),
                    boxShadow: <BoxShadow>[
                      BoxShadow(color: Colors.black26, blurRadius: 5.0)
                    ]))),
        home: loggedIn
            ? Discover()
            : /*_userOnBoardStatus == 1 ? Login() :*/ OnBoard(),
        //initialRoute: loggedIn ? '/' : _userOnBoardStatus == 1 ? "/Login" : "/OnBoard",//initRoute value must be ready before anything, when change condition app must restart to make changes! - use home instead.
        routes: {
          "/OnBoard": (context) => OnBoard(),
          "/Discover": (context) => Discover(),
          "/Login": (context) => Login(),
          "/Register": (context) => Register(),
          "/ForgetPassword": (context) => ForgetPassword(),
          "/Story": (context) => Story(),
          "/Overview": (context) => Overview(),
          "/Channels": (context) => Channels(),
          //"/Channel": (context) => Channel(),
          "/Timeline": (context) => Timeline(),
          "/Settings": (context) => Settings(),
          "/ContactUs": (context) => Email(),
          "/Bookmarks": (context) => Bookmarks(),
          "/Profile": (context) => Profile()
        });
  }
}
