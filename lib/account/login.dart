/*
  - Created Via Khaled Mohsen
  - Last Edit: 06/02/2020 02:05 AM
  - Login Screen
*/

//Core
import 'package:flutter/material.dart';
import 'dart:ui';

//Packages
import 'package:keyboard_visibility/keyboard_visibility.dart';

//UIs
import '../inc/init.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  FocusNode usernameFocus;
  FocusNode passwordFocus;
  bool isFocusedUsername = false;
  bool isFocusedPassword = false;

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

  void _handleFocusChangePassword() {
    if (passwordFocus.hasFocus != isFocusedPassword) {
      setState(() {
        isFocusedPassword = passwordFocus.hasFocus;
      });
    }
  }

  void _submit() {
    setState(() {
      loggedIn = true;
    });
    Navigator.popAndPushNamed(context, "/Discover");
  }

  @override
  void initState() {
    super.initState();
    usernameFocus = FocusNode();
    passwordFocus = FocusNode();
    usernameFocus.addListener(_handleFocusChangeUsername);
    passwordFocus.addListener(_handleFocusChangePassword);
    KeyboardVisibilityNotification().addNewListener(onChange: (bool visibilty) {
      if (!visibilty && (isFocusedUsername || isFocusedPassword)) {
        setState(() {
          usernameFocus.hasFocus
              ? usernameFocus.unfocus()
              : passwordFocus.unfocus();
          isFocusedUsername = false;
          isFocusedPassword = false;
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    usernameFocus.dispose();
    passwordFocus.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double _keyboardVisibility = MediaQuery.of(context).viewInsets.bottom;
    bool _isKeyboard = _keyboardVisibility > .0;
    return new Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(children: <Widget>[
          Container(
              margin: EdgeInsets.only(top: statusBarHeight(context)),
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(imagesPath + "background.png"),
                    fit: BoxFit.cover),
              )),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: <Color>[
                    Color.fromRGBO(0, 0, 0, .8),
                    Color.fromRGBO(255, 106, 58, .8)
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  stops: [.0, 1.0]),
            ),
          ),
          SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.only(top: statusBarHeight(context)),
              child: Column(children: <Widget>[
                //Logo, Waves
                _isKeyboard
                    ? Container(width: 0, height: 0)
                    : Container(
                        height: screenSize(window).height / 2 -
                            (statusBarHeight(context) / 2), //Test
                        alignment: Alignment.center,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Image.asset(imagesPath + "waves.png", scale: 2.0),
                              Padding(
                                padding: EdgeInsets.only(top: 15.0),
                                child: Image.asset(
                                  imagesPath + "logo-big.png",
                                  scale: 2.0,
                                ),
                              )
                            ])),

                //Form
                Container(
                    height: screenSize(window).height / 2 -
                        (statusBarHeight(context) / 2),
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
                                color: Color.fromRGBO(255, 255, 255, .2),
                                borderRadius: BorderRadius.circular(35.0)),
                            child: TextFormField(
                              textInputAction: TextInputAction.next,
                              focusNode: usernameFocus,
                              onEditingComplete: () => _focusPassword(),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: isFocusedUsername ? '' : "Username",
                                hintStyle: TextStyle(
                                    fontSize: 14.0, color: Colors.white),
                                contentPadding: EdgeInsets.all(20.0),
                                prefixIcon: Padding(
                                  padding:
                                      EdgeInsets.only(left: 10.0, right: 5.0),
                                  child: Image.asset(
                                      imagesPath + "username.png",
                                      scale: 1.8,
                                      semanticLabel:
                                          "Username Text Field, Icon (User)"),
                                ),
                              ),
                              style: TextStyle(color: Colors.white),
                            ),
                          ),

                          //Password
                          Container(
                            margin: EdgeInsets.fromLTRB(25.0, .0, 25.0, 15.0),
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(255, 255, 255, .2),
                                borderRadius: BorderRadius.circular(35.0)),
                            child: TextFormField(
                              focusNode: passwordFocus,
                              obscureText: true,
                              onEditingComplete: () => _submit(),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: isFocusedPassword ? '' : "Password",
                                hintStyle: TextStyle(
                                    fontSize: 14.0, color: Colors.white),
                                contentPadding: EdgeInsets.all(20.0),
                                prefixIcon: Padding(
                                  padding:
                                      EdgeInsets.only(left: 15.0, right: 10.0),
                                  child: Image.asset(
                                      imagesPath + "password.png",
                                      scale: 1.8,
                                      semanticLabel:
                                          "Password Text Field, Icon (Lock)"),
                                ),
                              ),
                              style: TextStyle(color: Colors.white),
                            ),
                          ),

                          //Submit Button
                          Container(
                            width: double.infinity,
                            margin: EdgeInsets.fromLTRB(25.0, .0, 25.0, 15.0),
                            child: RaisedButton(
                              padding: EdgeInsets.all(20.0),
                              onPressed: () => _submit(),
                              child: Text("Get Started",
                                  style: TextStyle(color: Colors.white)),
                              color: Color.fromRGBO(249, 99, 50, 1),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(35.0)),
                            ),
                          ),

                          //Links (Create Account, Help)
                          Container(
                            margin: EdgeInsets.only(left: 25.0, right: 25.0),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  FlatButton(
                                      onPressed: () =>
                                          Navigator.popAndPushNamed(
                                              context, "/Register"),
                                      child: Text("Create Account",
                                          style: TextStyle(
                                              fontSize: 12.5,
                                              color: Colors.white54))),
                                  FlatButton(
                                      onPressed: () =>
                                          Navigator.popAndPushNamed(
                                              context, "/ForgetPassword"),
                                      child: Text("Need Help?",
                                          style: TextStyle(
                                              fontSize: 12.5,
                                              color: Colors.white54)))
                                ]),
                          )
                        ])))
              ]),
            ),
          )
        ]));
  }
}
