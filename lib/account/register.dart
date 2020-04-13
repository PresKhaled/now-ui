/*
  - Created Via Khaled Mohsen
  - Last Edit: 06/02/2020 02:05 AM
  - Register Screen
*/

//Core
import 'package:flutter/material.dart';
import 'dart:ui';

//Packages
import 'package:keyboard_visibility/keyboard_visibility.dart';

//UIs
import '../inc/init.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  FocusNode usernameFocus;
  FocusNode emailFocus;
  FocusNode passwordFocus;

  int _isSelected = 1;
  bool isFocusedUsername = false;
  bool isFocusedEmail = false;
  bool isFocusedPassword = false;

  Widget _createDot(int dot) {
    return Container(
        width: 35.0,
        height: 35.0,
        decoration: BoxDecoration(
            border: _isSelected == dot
                ? Border.all(
                    width: 2.0, color: Color.fromRGBO(255, 255, 255, .5))
                : Border.all(width: .0, color: Colors.transparent),
            borderRadius: BorderRadius.circular(25.0)),
        child: IconButton(
            padding: EdgeInsets.zero,
            iconSize: .0,
            icon: Image.asset(imagesPath + "dot.png", scale: 1.5),
            onPressed: () {
              setState(() {
                _isSelected = dot;
              });
            }));
  }

  Widget _createLine() {
    return Container(
      width: 80.0,
      height: 1.0,
      color: Colors.white,
    );
  }

  void _focusEmail() {
    FocusScope.of(context).requestFocus(emailFocus);
  }

  void _focusPassword() {
    FocusScope.of(context).requestFocus(passwordFocus);
  }

  void _submit() {
    print("Done!");
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
                        height: (screenSize(window).height * .40) -
                            (statusBarHeight(context) / 2), //Test
                        //alignment: Alignment.center,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Container(
                                width: screenSize(window).width / 1.3,
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      //Dot 1
                                      _createDot(1),

                                      //Line 1
                                      _createLine(),

                                      //Dot 2
                                      _createDot(2),
                                      //Line 2
                                      _createLine(),

                                      //Dot 3
                                      _createDot(3),
                                    ]),
                              ),
                              Text("CREATE ACCOUNT",
                                  style: TextStyle(
                                      fontSize: 26.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white)),
                            ])),

                //Form
                Container(
                    height: (screenSize(window).height * .60) -
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
                              onEditingComplete: () => _focusEmail(),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: isFocusedUsername ? '' : "Name",
                                hintStyle: TextStyle(
                                    fontSize: 14.0, color: Colors.white),
                                contentPadding: EdgeInsets.all(20.0),
                                prefixIcon: Padding(
                                  padding:
                                      EdgeInsets.only(left: 10.0, right: 5.0),
                                  child: Container(
                                    child: Image.asset(imagesPath + "name.png",
                                        scale: 1.8,
                                        width: 47.0,
                                        semanticLabel:
                                            "Username Text Field, Icon (Name)"),
                                  ),
                                ),
                              ),
                              style: TextStyle(color: Colors.white),
                            ),
                          ),

                          //EMail
                          Container(
                            margin: EdgeInsets.fromLTRB(25.0, .0, 25.0, 15.0),
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(255, 255, 255, .2),
                                borderRadius: BorderRadius.circular(35.0)),
                            child: TextFormField(
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
                                  padding:
                                      EdgeInsets.only(left: 5.0, right: 2.0),
                                  child: Image.asset(imagesPath + "email.png",
                                      scale: 1.8,
                                      semanticLabel:
                                          "EMail Text Field, Icon (EMail)"),
                                ),
                              ),
                              style: TextStyle(color: Colors.white),
                            ),
                          ),

                          //Password
                          Container(
                            margin: EdgeInsets.fromLTRB(25.0, .0, 25.0, 45.0),
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
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: Color.fromRGBO(255, 255, 255, .2),
                                    width: 2.0),
                                borderRadius: BorderRadius.circular(35.0)),
                            child: FlatButton(
                              padding: EdgeInsets.all(20.0),
                              onPressed: () => _submit(),
                              child: Text("Continue",
                                  style: TextStyle(color: Colors.white)),
                              color: Colors.transparent,
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
                                              context, "/Login"),
                                      child: Text("Have an account?",
                                          style: TextStyle(
                                              fontSize: 12.5,
                                              color: Colors.white54))),
                                  FlatButton(
                                      onPressed: () => {},
                                      child: Text("Terms & Conditions",
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
