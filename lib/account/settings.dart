// Dart
import 'dart:ui';

// Packages internal, external
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:keyboard_visibility/keyboard_visibility.dart';

// Files
import '../inc/init.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  FocusNode usernameFocus;
  FocusNode emailFocus;
  FocusNode passwordFocus;

  bool isFocusedUsername = false;
  bool isFocusedEmail = false;
  bool isFocusedPassword = false;

  List<bool> _weekDays = [false, false, false, false, false, false, false];

  void _focusEmail() {
    FocusScope.of(context).requestFocus(emailFocus);
  }

  void _focusPassword() {
    FocusScope.of(context).requestFocus(passwordFocus);
  }

  void _handleFocusChangeUsername() {
    if (usernameFocus.hasFocus != isFocusedUsername) {
      setState(() {
        isFocusedUsername = usernameFocus.hasFocus;
      });
    }
  }

  void _handleFocusChangeEmail() {
    if (emailFocus.hasFocus != isFocusedEmail) {
      setState(() {
        isFocusedEmail = emailFocus.hasFocus;
      });
    }
  }

  void _handleFocusChangePassword() {
    if (passwordFocus.hasFocus != isFocusedPassword) {
      setState(() {
        isFocusedPassword = passwordFocus.hasFocus;
      });
    }
  }

  void _submit() {
    print("Done!");
  }

  Widget _getSwitch({String text, int index}) {
    return Padding(
        padding: EdgeInsets.fromLTRB(25, .0, 25.0, 3.0),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(text,
                  style: TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: .3)),
              /*Platform.isAndroid
                  //Android (Material) Switch
                  ?*/
              GestureDetector(
                  onTap: () {
                    _weekDays[index] = !_weekDays[index];
                  },
                  child: Switch.adaptive(
                    value: _weekDays[index],
                    onChanged: (status) {
                      setState(() {
                        _weekDays[index] = status;
                      });
                    },
                    inactiveThumbColor: Color.fromRGBO(183, 183, 183, 1.0),
                    activeColor: appSecColor,
                    inactiveTrackColor: Color.fromRGBO(229, 229, 229, 1.0),
                  ))
              //IOS (Cupertino) Switch
              /*: GestureDetector(
                      onTap: () {
                        _weekDays[index] = !_weekDays[index];
                      },
                      child: CupertinoSwitch(
                          value: _weekDays[index],
                          onChanged: (status) {
                            setState(() {
                              _weekDays[index] = status;
                            });
                          }))*/
            ]));
  }

  @override
  void initState() {
    super.initState();
    usernameFocus = FocusNode();
    emailFocus = FocusNode();
    passwordFocus = FocusNode();
    usernameFocus.addListener(_handleFocusChangeUsername);
    emailFocus.addListener(_handleFocusChangeEmail);
    passwordFocus.addListener(_handleFocusChangePassword);
    KeyboardVisibilityNotification().addNewListener(onChange: (bool visibilty) {
      if (!visibilty &&
          (isFocusedUsername || isFocusedEmail || isFocusedPassword)) {
        setState(() {
          usernameFocus.hasFocus
              ? usernameFocus.unfocus()
              : emailFocus.hasFocus
                  ? emailFocus.unfocus()
                  : passwordFocus.unfocus();
          isFocusedUsername = false;
          isFocusedEmail = false;
          isFocusedPassword = false;
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    usernameFocus.dispose();
    emailFocus.dispose();
    passwordFocus.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double _keyboardVisibility = MediaQuery.of(context).viewInsets.bottom;
    bool _isKeyboard = _keyboardVisibility > .0;
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
                  message: "Logout",
                  child: GestureDetector(
                      onTap: () => logout(context),
                      child: Container(
                          child: Image.asset(imagesPath + "logout.png",
                              scale: appBarIconScale))))
            ],
            backgroundColor: appMainColor),
        body: SingleChildScrollView(
          child: Container(
              child: Column(children: <Widget>[
            //Info
            Container(
                color: appSecColor,
                child: Column(children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 25.0),
                    child: Text("settings".toUpperCase(),
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 22.0,
                            fontWeight: FontWeight.bold,
                            letterSpacing: .3)),
                  ),
                  //Upload pic, Pic, Sync
                  Padding(
                      padding: EdgeInsets.fromLTRB(25.0, 30.0, 25.0, 35.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            //Upload button
                            GestureDetector(
                              onTap: () => print("Upload pressed"),
                              child: CircleAvatar(
                                child: Image.asset(imagesPath + "upload.png",
                                    width: 25.0),
                                radius: 28.0,
                                backgroundColor: Colors.white12,
                              ),
                            ),
                            //User pic
                            CircleAvatar(
                                child: Image.asset(imagesPath + "logo.png",
                                    width: 38.0),
                                radius: 28.0,
                                backgroundColor: Colors.transparent),
                            //Sync
                            GestureDetector(
                              onTap: () => print("Sync pressed"),
                              child: CircleAvatar(
                                child: Image.asset(imagesPath + "sync.png",
                                    width: 25.0),
                                radius: 28.0,
                                backgroundColor: Colors.white12,
                              ),
                            )
                          ])),
                  //Form
                  Container(
                      child: Form(
                          child: Column(
                              mainAxisAlignment: _isKeyboard
                                  ? MainAxisAlignment.end
                                  : MainAxisAlignment.center,
                              children: <Widget>[
                        //Username
                        Container(
                            margin: EdgeInsets.fromLTRB(25.0, .0, 25.0, 15.0),
                            decoration: BoxDecoration(
                                color: Colors.white12,
                                borderRadius: BorderRadius.circular(35.0)),
                            child: TextFormField(
                                initialValue: "Khaled Mohsen",
                                textInputAction: TextInputAction.next,
                                focusNode: usernameFocus,
                                onEditingComplete: () => _focusEmail(),
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: isFocusedUsername ? '' : "Name",
                                    hintStyle: TextStyle(
                                        fontSize: 14.0, color: Colors.white),
                                    contentPadding: EdgeInsets.all(20.0),
                                    prefixIcon: Padding(
                                        padding: EdgeInsets.only(
                                            left: 10.0, right: 5.0),
                                        child: Container(
                                          child: Image.asset(
                                              imagesPath + "name.png",
                                              scale: 1.8,
                                              width: 47.0,
                                              semanticLabel:
                                                  "Username Text Field, Icon (Name)"),
                                        ))),
                                style: TextStyle(color: Colors.white))),
                        //EMail
                        Container(
                            margin: EdgeInsets.fromLTRB(25.0, .0, 25.0, 15.0),
                            decoration: BoxDecoration(
                                color: Colors.white12,
                                borderRadius: BorderRadius.circular(35.0)),
                            child: TextFormField(
                                initialValue: "pres.kbayomy@gmail.com",
                                textInputAction: TextInputAction.next,
                                focusNode: emailFocus,
                                onEditingComplete: () => _focusPassword(),
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: isFocusedEmail ? '' : "Email",
                                    hintStyle: TextStyle(
                                        fontSize: 14.0, color: Colors.white),
                                    contentPadding: EdgeInsets.all(20.0),
                                    prefixIcon: Padding(
                                      padding: EdgeInsets.only(
                                          left: 5.0, right: 2.0),
                                      child: Image.asset(
                                          imagesPath + "email.png",
                                          scale: 1.8,
                                          semanticLabel:
                                              "EMail Text Field, Icon (EMail)"),
                                    )),
                                style: TextStyle(color: Colors.white))),
                        //Password
                        Container(
                            margin: EdgeInsets.fromLTRB(25.0, .0, 25.0, 45.0),
                            decoration: BoxDecoration(
                                color: Colors.white12,
                                borderRadius: BorderRadius.circular(35.0)),
                            child: TextFormField(
                                focusNode: passwordFocus,
                                obscureText: true,
                                onEditingComplete: () => _submit(),
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText:
                                        isFocusedPassword ? '' : "Password",
                                    hintStyle: TextStyle(
                                        fontSize: 14.0, color: Colors.white),
                                    contentPadding: EdgeInsets.all(20.0),
                                    prefixIcon: Padding(
                                      padding: EdgeInsets.only(
                                          left: 15.0, right: 10.0),
                                      child: Image.asset(
                                          imagesPath + "password.png",
                                          scale: 1.8,
                                          semanticLabel:
                                              "Password Text Field, Icon (Lock)"),
                                    )),
                                style: TextStyle(color: Colors.white)))
                      ])))
                ])),
            //Email notifcations
            Container(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                  Padding(
                      padding: EdgeInsets.fromLTRB(25.0, 25.0, 25.0, 20.0),
                      child: Text("email notifications".toUpperCase(),
                          style: TextStyle(
                              fontSize: 12.0,
                              fontWeight: FontWeight.bold,
                              letterSpacing: .5,
                              color: appMainColor))),
                  //Friday
                  _getSwitch(text: "Friday", index: 6),
                  //Saturday
                  _getSwitch(text: "Saturday", index: 0),
                  //Sunday
                  _getSwitch(text: "Sunday", index: 1),
                  //Monday
                  _getSwitch(text: "Monday", index: 2),
                  //Tuesday
                  _getSwitch(text: "Tuesday", index: 3),
                  //Wednesday
                  _getSwitch(text: "Wednesday", index: 4),
                  //Thursday
                  _getSwitch(text: "Thursday", index: 5)
                ]))
          ])),
        ));
  }
}
