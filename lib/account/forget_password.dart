/*
  - Created Via Khaled Mohsen
  - Last Edit: 06/02/2020 02:05 AM
  - Retrive Account (Forget Password) Screen
*/

//Core
import 'package:flutter/material.dart';
import 'dart:ui';

//Packages
import 'package:keyboard_visibility/keyboard_visibility.dart';

//UIs
import '../inc/init.dart';

class ForgetPassword extends StatefulWidget {
  @override
  _ForgetPasswordState createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  FocusNode usernameOrEmailFocus;

  bool isFocusedUsernameOrEmail = false;

  void _handleFocusUsernameOrEmail() {
    if (usernameOrEmailFocus.hasFocus != isFocusedUsernameOrEmail) {
      setState(() {
        isFocusedUsernameOrEmail = usernameOrEmailFocus.hasFocus;
      });
    }
  }

  void _submit() {
    print("Done!");
  }

  @override
  void initState() {
    super.initState();
    usernameOrEmailFocus = FocusNode();
    usernameOrEmailFocus.addListener(_handleFocusUsernameOrEmail);
    KeyboardVisibilityNotification().addNewListener(onChange: (bool visibilty) {
      if (!visibilty && isFocusedUsernameOrEmail == true) {
        setState(() {
          usernameOrEmailFocus.unfocus();
          isFocusedUsernameOrEmail = false;
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    usernameOrEmailFocus.dispose();
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
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text("Retrive Account",
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
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                          //Username
                          Container(
                            margin: EdgeInsets.fromLTRB(25.0, .0, 25.0, 15.0),
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(255, 255, 255, .2),
                                borderRadius: BorderRadius.circular(35.0)),
                            child: TextFormField(
                              autofocus: true,
                              focusNode: usernameOrEmailFocus,
                              onEditingComplete: () => _submit(),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: isFocusedUsernameOrEmail
                                    ? ''
                                    : "Username or Email",
                                hintStyle: TextStyle(
                                    fontSize: 14.0, color: Colors.white),
                                contentPadding: EdgeInsets.all(20.0),
                                prefixIcon: Padding(
                                  padding:
                                      EdgeInsets.only(left: 10.0, right: 5.0),
                                  child: Container(
                                    child: Image.asset(
                                        imagesPath + "password.png",
                                        scale: 1.8,
                                        width: 47.0,
                                        semanticLabel:
                                            "Username or Email Text Field, Icon (Lock)"),
                                  ),
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
                              child: Text("Send Code for registeration Email",
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
                                      onPressed: () =>
                                          Navigator.popAndPushNamed(
                                              context, "/Register"),
                                      child: Text("Register new Account",
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
