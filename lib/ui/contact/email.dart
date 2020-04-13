import 'dart:ui';
import 'package:flutter/material.dart';
import '../../inc/init.dart';
import 'phone.dart' show Phone;
import 'map.dart' show Map;

class Email extends StatefulWidget {
  @override
  _EmailState createState() => _EmailState();
}

class _EmailState extends State<Email> with SingleTickerProviderStateMixin {
  TabController _contactUsTabController;
  FocusNode usernameFocus;
  FocusNode emailFocus;
  FocusNode messageFocus;

  bool isFocusedUsername = false;
  bool isFocusedEmail = false;
  bool isFocusedMessage = false;

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

  void _handleFocusChangeMessage() {
    if (messageFocus.hasFocus != isFocusedMessage) {
      setState(() {
        isFocusedMessage = messageFocus.hasFocus;
      });
    }
  }

  void _focusEmail() {
    FocusScope.of(context).requestFocus(emailFocus);
  }

  void _focusMessage() {
    FocusScope.of(context).requestFocus(messageFocus);
  }

  void _submit() => print("Done!");

  Widget _getTabButton({String image, int index}) {
    bool indexes = _contactUsTabController.index == index;
    return Container(
      decoration: indexes
          ? BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(32.0)),
              boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: Colors.black12,
                      blurRadius: 15.0,
                      offset: Offset(.0, 4.0))
                ])
          : BoxDecoration(),
      child: CircleAvatar(
          child: Image.asset(imagesPath + image,
              width: 23.0,
              height: 23.0,
              fit: BoxFit.contain,
              color: indexes ? appMainColor : Colors.white),
          radius: 32.0,
          backgroundColor: indexes ? Colors.white : Colors.white12),
    );
  }

  @override
  void initState() {
    super.initState();
    _contactUsTabController =
        TabController(vsync: this, length: 3, initialIndex: 1);
    //Swipe change active tab
    _contactUsTabController.addListener(() {
      setState(() {
        _contactUsTabController.index = _contactUsTabController.index;
      });
    });
    usernameFocus = FocusNode();
    emailFocus = FocusNode();
    messageFocus = FocusNode();
    usernameFocus.addListener(_handleFocusChangeUsername);
    emailFocus.addListener(_handleFocusChangeEmail);
    messageFocus.addListener(_handleFocusChangeMessage);
  }

  @override
  void dispose() {
    super.dispose();
    usernameFocus.dispose();
    emailFocus.dispose();
    messageFocus.dispose();
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
            child: Stack(children: <Widget>[
          //Gradient
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
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(imagesPath + "drawer-background.png"),
                      fit: BoxFit.cover))),
          //Content
          Column(children: <Widget>[
            //Tabs buttons
            Container(
                margin: EdgeInsets.only(top: 40.0, bottom: 35.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              _contactUsTabController.index = 0;
                            });
                          },
                          child: _getTabButton(image: "contact.png", index: 0)),
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              _contactUsTabController.index = 1;
                            });
                          },
                          child: _getTabButton(image: "email.png", index: 1)),
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              _contactUsTabController.index = 2;
                            });
                          },
                          child: _getTabButton(image: "location.png", index: 2))
                    ])),
            //Tabs contents
            Expanded(
                child:
                    TabBarView(controller: _contactUsTabController, children: <
                        Widget>[
              Phone(),
              SingleChildScrollView(
                  child: Container(
                      child: Column(children: <Widget>[
                //Title
                Padding(
                  padding: EdgeInsets.only(bottom: 7.0),
                  child: Text("send feedback".toUpperCase(),
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 22.0,
                          letterSpacing: 1.0)),
                ),
                //Description
                Text("Your feedback is very important to us.",
                    style: TextStyle(color: Colors.white54, fontSize: 12.0)),

                //Form
                Container(
                    margin: EdgeInsets.only(top: 40.0),
                    child: Form(
                        child: Column(children: <Widget>[
                      //Username
                      Container(
                        margin: EdgeInsets.fromLTRB(25.0, .0, 25.0, 15.0),
                        decoration: BoxDecoration(
                            color: Colors.white12,
                            borderRadius: BorderRadius.circular(35.0)),
                        child: TextFormField(
                          textInputAction: TextInputAction.next,
                          focusNode: usernameFocus,
                          onEditingComplete: () => _focusEmail(),
                          initialValue: "Khaled Mohsen",
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: isFocusedUsername ? '' : "Name",
                            hintStyle:
                                TextStyle(fontSize: 14.0, color: Colors.white),
                            contentPadding: EdgeInsets.all(20.0),
                            prefixIcon: Padding(
                              padding: EdgeInsets.only(left: 10.0, right: 5.0),
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
                              color: Colors.white12,
                              borderRadius: BorderRadius.circular(35.0)),
                          child: TextFormField(
                              textInputAction: TextInputAction.next,
                              focusNode: emailFocus,
                              onEditingComplete: () => _focusMessage(),
                              initialValue: "pres.kbayomy@gmail.com",
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
                                  )),
                              style: TextStyle(color: Colors.white))),

                      //Message
                      Container(
                          margin: EdgeInsets.fromLTRB(25.0, 15.0, 25.0, 15.0),
                          child: TextFormField(
                              focusNode: messageFocus,
                              onEditingComplete: () => _submit(),
                              decoration: InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.white54, width: .5)),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.white54, width: .5)),
                                  hintText: isFocusedMessage
                                      ? ''
                                      : "Write something...",
                                  hintStyle: TextStyle(
                                      fontSize: 13.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      letterSpacing: .3),
                                  contentPadding:
                                      EdgeInsets.only(bottom: 20.0, top: 15.0),
                                  suffixIcon: Padding(
                                      padding: EdgeInsets.only(left: 10.0),
                                      child: GestureDetector(
                                        onTap: () => print("#New comment"),
                                        child: Image.asset(
                                            imagesPath + "submit.png",
                                            color: Colors.white,
                                            scale: 1.9,
                                            alignment: Alignment.centerRight,
                                            semanticLabel:
                                                "Submit Text Field, Icon (Submit)"),
                                      ))),
                              style: TextStyle(color: Colors.white)))
                    ])))
              ]))),
              Map()
            ]))
          ])
        ])));
  }
}
