import 'dart:ui';
import 'package:flutter/material.dart';
import '../../inc/init.dart';
//import 'package:webview_flutter/webview_flutter.dart';
import 'comments.dart' show Comments;

class Story extends StatefulWidget {
  final int _storyID;
  Story([this._storyID = 0]);
  @override
  _StoryState createState() => _StoryState(_storyID);
}

class _StoryState extends State<Story> with SingleTickerProviderStateMixin {
  _StoryState(this._storyID);
  final int _storyID;
  int _timedown = 5;
  int _currentAppBarTab = 0;
  //ScrollController _pageScrollController;
  bool _comments = false;
  bool _darkMode = false;

  //PageController _carouselController;
  final Color _storyAppBarIconsColor = Color.fromRGBO(252, 177, 153, 1.0);
  final Color _storyAppBarIconsColorActive = Colors.white;
  final double newsSpansSize = 11.0;
  final double sourceIconSize = 12.0;
  final double timeIconSize = 16.0;
  final mainNewsHeight = screenSize(window).height / 2.5;
  //int _carouselCurrentView = 0;
  double _sliderValue = 16.0;
  String _selectedFont = "Montserrat";

  Color _getBackgroundColor() {
    return _darkMode ? Colors.black : Colors.white;
  }

  Color _getTextColor() {
    return _darkMode ? Colors.white : Colors.black;
  }

  //TODO: Fix dispose issue
  /*void _checkExistWithTimer() {
    if (_storyID == 0) {
      Future.delayed(Duration(seconds: 5), () {
        Navigator.pop(context);
      });
      if (_timedown != 1) {
        Timer.periodic(Duration(seconds: 1), (t) {
          setState(() {
            _timedown = _timedown - 1;
          });
        });
      }
    }
  }*/

  Widget _getIntro({String intro}) {
    return Container(
      padding: EdgeInsets.only(right: 40.0),
      child: Text(intro,
          style: TextStyle(
              fontSize: _sliderValue,
              color: _getTextColor(),
              height: 1.6,
              fontFamily: _selectedFont)),
    );
  }

  Widget _getInterlacedImages({String image1, String image2}) {
    return Container(
        height: 250.0,
        margin: EdgeInsets.only(top: 15.0, bottom: 15.0),
        child: Stack(fit: StackFit.expand, children: <Widget>[
          Align(
              alignment: Alignment.bottomLeft,
              child: Image.asset(imagesPath + image1,
                  width:
                      250.0)), //TODO: semanticLabel must be added when API connect to the app
          Align(
              alignment: Alignment.topRight,
              child: Image.asset(imagesPath + image2,
                  width:
                      250.0)) //TODO: semanticLabel must be added when API connect to the app
        ]));
  }

  Widget _getQuote({String qoute, String source}) {
    return Container(
        decoration: BoxDecoration(
            border: Border(left: BorderSide(color: appMainColor, width: 2.0))),
        child: Padding(
          padding: EdgeInsets.only(left: 30.0, right: 45.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(qoute,
                    style: TextStyle(
                        color: appMainColor,
                        //fontWeight: FontWeight.w300,
                        height: 1.8,
                        fontFamily: _selectedFont)),
                Padding(
                  padding: EdgeInsets.only(top: 15.0),
                  child: Text("- " + source,
                      style: TextStyle(
                          color: appMainColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 12.0,
                          fontFamily: _selectedFont)),
                )
              ]),
        ));
  }

  Widget _getQuestion({String question}) {
    return Container(
        margin: EdgeInsets.only(top: 30.0, bottom: 20.0),
        child: Text(question,
            style: TextStyle(
                color: _getTextColor(),
                fontSize: _sliderValue,
                fontWeight: FontWeight.bold,
                height: 1.6,
                fontFamily: _selectedFont)));
  }

  Widget _getParagraph({String paragraph}) {
    return Container(
      padding: EdgeInsets.fromLTRB(.0, .0, 30.0, 10.0),
      child: Text(paragraph,
          style: TextStyle(
              fontSize: _sliderValue,
              color: _getTextColor(),
              height: 1.9,
              fontFamily: _selectedFont)),
    );
  }

  /*Widget _getVideoFromUrl({String url}) {
    return Container(
      height: 300.0,
      margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
      child: OverflowBox(
        maxWidth: screenSize(window).width,
        child: WebView(
          initialUrl: url,
          javascriptMode: JavascriptMode.unrestricted,
        ),
      ),
    );
  }*/

  /*void _scrollToTop() {
    _pageScrollController.animateTo(
        _pageScrollController.position.maxScrollExtent,
        duration: Duration(milliseconds: 500),
        curve: null);
  }*/

  void _darkModeSwitch(bool val) {
    setState(() {
      _darkMode = val;
    });
  }

  void _showModalBottomSheetFunc(context) {
    showModalBottomSheet(
        context: context,
        backgroundColor: _getBackgroundColor(),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(35.0),
                topLeft: Radius.circular(35.0))),
        builder: (BuildContext context) {
          return Container(
              child: Column(children: <Widget>[
            Expanded(
                child: ListView(children: <Widget>[
              //Static
              Container(
                padding: EdgeInsets.all(20.0),
                child: Text("Select your preferred font",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: appMainColor, fontSize: 16.0)),
              ),
              /*Padding(
                padding: EdgeInsets.only(right: 35, left: 35.0),
                child: Divider(
                    color: _darkMode ? Colors.white : Colors.deepOrange),
              ),*/
              //Available fonts
              //TODO: Add font weights buttons (Regular, Light, Bold ...)
              //Montserrat - Default
              ListTile(
                  onTap: () {
                    setState(() {
                      _selectedFont = "Montserrat";
                      Navigator.pop(context);
                    });
                  },
                  leading: Padding(
                    padding: EdgeInsets.only(top: 10.0),
                    child: Image.asset(imagesPath + "text.png",
                        width: 24.0, fit: BoxFit.cover, color: appMainColor),
                  ),
                  title: Text("Montserrat (Default)",
                      style: TextStyle(
                        color: _getTextColor(),
                        fontSize: 14.0,
                        fontFamily: "Montserrat",
                      )),
                  subtitle: Text("Donec condimentum arcu ante, in.",
                      style: TextStyle(
                        color: _getTextColor(),
                        fontSize: 14.0,
                        fontFamily: "Montserrat",
                      )),
                  trailing: _selectedFont == "Montserrat"
                      ? Container(
                          child: Icon(Icons.star,
                              color: Colors.yellow[600], size: 24.0),
                          decoration: BoxDecoration(boxShadow: [
                            BoxShadow(
                                color:
                                    _darkMode ? Colors.white10 : Colors.black12,
                                blurRadius: 15.0)
                          ]))
                      : Container(width: .0, height: .0)),

              //Open Sans
              ListTile(
                  onTap: () {
                    setState(() {
                      _selectedFont = "OpenSans";
                      Navigator.pop(context);
                    });
                  },
                  leading: Padding(
                    padding: EdgeInsets.only(top: 10.0),
                    child: Image.asset(imagesPath + "text.png",
                        width: 24.0, fit: BoxFit.cover, color: appMainColor),
                  ),
                  title: Text("Open Sans",
                      style: TextStyle(
                        color: _getTextColor(),
                        fontSize: 14.0,
                        fontFamily: "OpenSans",
                      )),
                  subtitle: Text("Nunc ut augue non libero.",
                      style: TextStyle(
                        color: _getTextColor(),
                        fontSize: 14.0,
                        fontFamily: "OpenSans",
                      )),
                  trailing: _selectedFont == "OpenSans"
                      ? Container(
                          child: Icon(Icons.star,
                              color: Colors.yellow[600], size: 24.0),
                          decoration: BoxDecoration(boxShadow: [
                            BoxShadow(
                                color:
                                    _darkMode ? Colors.white10 : Colors.black12,
                                blurRadius: 15.0)
                          ]))
                      : Container(width: .0, height: .0)),

              //Roboto
              ListTile(
                  onTap: () {
                    setState(() {
                      _selectedFont = "Roboto";
                      Navigator.pop(context);
                    });
                  },
                  leading: Padding(
                    padding: EdgeInsets.only(top: 10.0),
                    child: Image.asset(imagesPath + "text.png",
                        width: 24.0, fit: BoxFit.cover, color: appMainColor),
                  ),
                  title: Text("Roboto",
                      style: TextStyle(
                        color: _getTextColor(),
                        fontSize: 14.0,
                        fontFamily: "Roboto",
                      )),
                  subtitle: Text("Aenean lorem lectus, commodo sit.",
                      style: TextStyle(
                        color: _getTextColor(),
                        fontSize: 14.0,
                        fontFamily: "Roboto",
                      )),
                  trailing: _selectedFont == "Roboto"
                      ? Container(
                          child: Icon(Icons.star,
                              color: Colors.yellow[600], size: 24.0),
                          decoration: BoxDecoration(boxShadow: [
                            BoxShadow(
                                color:
                                    _darkMode ? Colors.white10 : Colors.black12,
                                blurRadius: 15.0)
                          ]))
                      : Container(width: .0, height: .0))
            ]))
          ]));
        });
  }

  @override
  void initState() {
    super.initState();
    //_checkExistWithTimer();
    //_carouselController = PageController(initialPage: 1, viewportFraction: 1.0);
    //_pageScrollController = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _storyID != 0
            ? AppBar(
                automaticallyImplyLeading: false,
                elevation: .0,
                actions: <Widget>[
                  Expanded(
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                        //Back button
                        IconButton(
                          onPressed: () => Navigator.pop(context),
                          //Like design require
                          focusColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          splashColor: Colors.deepOrangeAccent,
                          tooltip: "Back",
                          icon: Image.asset(imagesPath + "back.png",
                              scale: appBarIconScale,
                              color: _storyAppBarIconsColor),
                        ),
                        //Comments button
                        IconButton(
                          onPressed: () {
                            setState(() {
                              _comments != true
                                  ? _comments = true
                                  : _comments = false;
                            });
                          },
                          //Like design require
                          focusColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          tooltip: "Comments",
                          icon: Image.asset(imagesPath + "comments.png",
                              scale: appBarIconScale,
                              color: _comments
                                  ? _storyAppBarIconsColorActive
                                  : _storyAppBarIconsColor),
                        ),
                        //Text customize button
                        IconButton(
                          onPressed: () {
                            setState(() {
                              // _scrollToTop();
                              _comments = false;
                              _currentAppBarTab == 1
                                  ? _currentAppBarTab = 0
                                  : _currentAppBarTab = 1;
                            });
                          },
                          //Like design require
                          focusColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          tooltip: "Text customizing",
                          icon: Image.asset(imagesPath + "text.png",
                              scale: appBarIconScale,
                              color: _comments
                                  ? _storyAppBarIconsColor
                                  : _storyAppBarIconsColorActive),
                        ),
                        //Bookmark button
                        IconButton(
                          onPressed: () {},
                          //Like design require
                          focusColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          splashColor: Colors.deepOrangeAccent,
                          tooltip: "Bookmark story",
                          icon: Image.asset(imagesPath + "bookmark.png",
                              scale: appBarIconScale,
                              color: _storyAppBarIconsColor),
                        ),
                        //Share button
                        IconButton(
                          onPressed: () {},
                          //Like design require
                          focusColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          splashColor: Colors.deepOrangeAccent,
                          tooltip: "Share story",
                          icon: Image.asset(imagesPath + "share.png",
                              scale: appBarIconScale,
                              color: _storyAppBarIconsColor),
                        )
                      ]))
                ],
              )
            : AppBar(
                backgroundColor: appMainColor,
                elevation: .0,
                leading: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Image.asset(imagesPath + "back.png",
                      scale: appBarIconScale),
                ),
                title: Image.asset(imagesPath + "logo.png",
                    scale: appBarIconScale),
                centerTitle: true,
                /*actions: <Widget>[
              //IconButton instead of GestureDetector, Tooltip
              IconButton(
                  icon: Icon(Icons.report),
                  iconSize: 32.0,
                  onPressed: () {},
                  //Like design require
                  focusColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  splashColor: Colors.deepOrangeAccent,
                  tooltip: "Report story")
            ]*/
              ),
        body: _storyID != 0
            //Story read
            ? _comments != true
                ? SingleChildScrollView(
                    child: Container(
                        color: _getBackgroundColor(),
                        child: Column(children: <Widget>[
                          _currentAppBarTab == 0
                              ?
                              //News image
                              Stack(children: <Widget>[
                                  //Story Image
                                  Container(
                                      height: mainNewsHeight,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                imagesPath + "story-image.png"),
                                            fit: BoxFit.cover),
                                      )),
                                  //Gridient
                                  Container(
                                      //Main News Gradient
                                      height: mainNewsHeight,
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                            begin: Alignment.bottomCenter,
                                            end: Alignment.topCenter,
                                            colors: [
                                              Color.fromRGBO(0, 0, 0, .7),
                                              Colors.transparent
                                            ],
                                            stops: [
                                              .0,
                                              .3
                                            ]),
                                      )),
                                  //Header
                                  Container(
                                      height: mainNewsHeight,
                                      padding: EdgeInsets.all(20.0),
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: <Widget>[
                                            Container(
                                                margin: EdgeInsets.only(
                                                    bottom: 20.0),
                                                child: Text(
                                                    "Arctic sea ice extent hits record low for winter maximum",
                                                    style: TextStyle(
                                                        fontSize: 20.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.white)))
                                          ]))
                                ])
                              :
                              //Text customize
                              //TODO: AnimatedContainer not working, think it's normal - change code later
                              Container(
                                  height: mainNewsHeight,
                                  color: Color.fromRGBO(236, 93, 47, 1.0),
                                  child: Column(children: <Widget>[
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: <Widget>[
                                          //Light activate
                                          Padding(
                                            padding: EdgeInsets.all(25.0),
                                            child: GestureDetector(
                                              onTap: () =>
                                                  _darkModeSwitch(false),
                                              child: Container(
                                                  //width: screenSize(window).width / 2 - .5,
                                                  decoration: _darkMode != true
                                                      ? BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                          boxShadow: [
                                                              BoxShadow(
                                                                  color: Colors
                                                                      .black12,
                                                                  blurRadius:
                                                                      10.0,
                                                                  offset:
                                                                      Offset(.0,
                                                                          15.0))
                                                            ])
                                                      : BoxDecoration(
                                                          shape:
                                                              BoxShape.circle),
                                                  child: CircleAvatar(
                                                      radius: 35.0,
                                                      child: Image.asset(
                                                          imagesPath +
                                                              "shams.png",
                                                          width: 25.0,
                                                          color: _darkMode
                                                              ? Colors.white
                                                              : appMainColor),
                                                      backgroundColor: _darkMode
                                                          ? Colors.white12
                                                          : Colors.white)),
                                            ),
                                          ),
                                          //TODO: Add vertical line - Vertical divider not working, Container needs specific height
                                          //Dark activate
                                          Padding(
                                            padding: EdgeInsets.all(25.0),
                                            child: GestureDetector(
                                              onTap: () =>
                                                  _darkModeSwitch(true),
                                              child: Container(
                                                  //width: screenSize(window).width / 2 - .5,
                                                  decoration: _darkMode
                                                      ? BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                          boxShadow: [
                                                              BoxShadow(
                                                                  color: Colors
                                                                      .black12,
                                                                  blurRadius:
                                                                      10.0,
                                                                  offset:
                                                                      Offset(.0,
                                                                          15.0))
                                                            ])
                                                      : BoxDecoration(
                                                          shape:
                                                              BoxShape.circle),
                                                  child: CircleAvatar(
                                                      radius: 35.0,
                                                      child: Image.asset(
                                                          imagesPath +
                                                              "helal.png",
                                                          width: 16.0,
                                                          color: _darkMode
                                                              ? appMainColor
                                                              : Colors.white),
                                                      backgroundColor: _darkMode
                                                          ? Colors.white
                                                          : Colors.white12)),
                                            ),
                                          )
                                        ]),
                                    Divider(height: .5, color: Colors.white),
                                    //Change font
                                    Container(
                                        padding: EdgeInsets.all(35.0),
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              Text("CHOOSE TYPEFACE",
                                                  style: TextStyle(
                                                      fontSize: 13.0,
                                                      color: Colors.white38)),
                                              //Fonts bottom menu
                                              GestureDetector(
                                                  onTap: () =>
                                                      _showModalBottomSheetFunc(
                                                          context), //Bottom Fonts menu
                                                  child: Container(
                                                      child: Row(
                                                          children: <Widget>[
                                                        //Selected font
                                                        Text(
                                                            _selectedFont
                                                                .toUpperCase(),
                                                            style: TextStyle(
                                                                fontSize: 13.0,
                                                                color: Colors
                                                                    .white)),
                                                        Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    left: 25.0),
                                                            child: Image.asset(
                                                                imagesPath +
                                                                    "next.png",
                                                                color: Colors
                                                                    .white,
                                                                width:
                                                                    12.0) //Rotate - angle: 1.5,
                                                            )
                                                      ])))
                                            ])),
                                    Divider(height: .5, color: Colors.white),
                                    //Slider
                                    Expanded(
                                        child: Container(
                                            padding: EdgeInsets.only(
                                                right: 35.0, left: 35.0),
                                            alignment: Alignment.center,
                                            child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: <Widget>[
                                                  //fontSize -2
                                                  GestureDetector(
                                                    onTap: () {
                                                      setState(() {
                                                        if (_sliderValue >= 14)
                                                          _sliderValue =
                                                              _sliderValue -
                                                                  2.0;
                                                      });
                                                    },
                                                    child: Image.asset(
                                                      imagesPath +
                                                          "small-a.png",
                                                      width: 18.0,
                                                    ),
                                                  ),
                                                  //Font slider
                                                  Expanded(
                                                      child: Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  right: 20.0,
                                                                  left: 20.0),
                                                          child:
                                                              Slider.adaptive(
                                                            min: 12.0,
                                                            max: 20.0,
                                                            value: _sliderValue,
                                                            //divisions: 5,
                                                            activeColor:
                                                                Colors.white,
                                                            inactiveColor:
                                                                Colors.white12,
                                                            onChanged: (v) {
                                                              setState(() {
                                                                _sliderValue =
                                                                    v;
                                                              });
                                                            },
                                                            //label: _sliderValue.toStringAsFixed(2)
                                                          ))),
                                                  //fontSize +2
                                                  GestureDetector(
                                                    onTap: () {
                                                      setState(() {
                                                        if (_sliderValue <= 18)
                                                          _sliderValue =
                                                              _sliderValue +
                                                                  2.0;
                                                      });
                                                    },
                                                    child: Image.asset(
                                                        imagesPath +
                                                            "large-a.png",
                                                        width: 24.0),
                                                  )
                                                ])))
                                  ])),
                          //Source, DateTime, Channel
                          Container(
                              padding: EdgeInsets.all(20.0),
                              child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: <Widget>[
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(right: 20.0),
                                      child: Row(children: <Widget>[
                                        Image.asset(imagesPath + "source.png",
                                            width: sourceIconSize,
                                            color: Colors.grey[800]),
                                        Text("  CNN",
                                            style: TextStyle(
                                                color: _getTextColor(),
                                                fontSize: newsSpansSize)),
                                      ]),
                                    ),
                                    Row(children: <Widget>[
                                      Image.asset(imagesPath + "time.png",
                                          width: timeIconSize,
                                          color: Colors.grey[800]),
                                      Text("  Feb 18, 2020",
                                          style: TextStyle(
                                              color: _getTextColor(),
                                              fontSize: newsSpansSize)),
                                    ]),
                                    Expanded(
                                      child: Align(
                                        alignment: Alignment.centerRight,
                                        child: Container(
                                          padding: EdgeInsets.only(bottom: 5.0),
                                          decoration: BoxDecoration(
                                            border: Border(
                                                bottom: BorderSide(
                                                    color: Color.fromRGBO(
                                                        140, 140, 140, 1),
                                                    width: 1.0)),
                                          ),
                                          child: Text("ENVIRONMENT",
                                              textAlign: TextAlign.right,
                                              style: TextStyle(
                                                  color: _getTextColor(),
                                                  fontSize: newsSpansSize)),
                                        ),
                                      ),
                                    ),
                                  ])),
                          //Content
                          Container(
                              padding:
                                  EdgeInsets.fromLTRB(20.0, 10.0, 20.0, .0),
                              child: Column(children: <Widget>[
                                //Intro - Dynamic -
                                _getIntro(
                                    intro:
                                        "According to the National Oceanic and Atmospheric Administration, Ted Scambos, NSIDC lead scientist, puts the potentially record low maximum sea ice extent this year down to low ice extent in the Pacific and a late drop in ice extent in the Barents Sea."),
                                //TODO: There's space on sides, idk coming from where
                                //Interlaced images - Dynamic -
                                _getInterlacedImages(
                                    image1: "story-image3.png",
                                    image2: "story-image2.png"),
                                //Quote - Dynamic -
                                _getQuote(
                                    qoute:
                                        "“Over the span of the satellite record, Arctic sea ice has been declining significantly, while sea ice in the Antarctic has increased very slightly”",
                                    source: "NOAA"),
                                //Question - Dynamic -
                                _getQuestion(
                                    question:
                                        "So what does this new record for the lowest level of winter ice actually mean?"),
                                //Paragraph - Dynamic -
                                _getParagraph(
                                    paragraph:
                                        "The Arctic Ocean freezes every winter and much of the sea-ice then thaws every summer, and that process will continue whatever happens with climate change. Even if the Arctic continues to be one of the fastest-warming regions of the world, it will always be plunged into bitterly cold polar dark every winter. And year-by-year, for all kinds of natural reasons, there\’s huge variety of the state of the ice."),
                                //Video from URL - Dynamic -
                                /*_getVideoFromUrl(
                                    url:
                                        "https://www.youtube.com/embed/nvDX9aBiTio"),*/
                                //Paragraph - Dynamic -
                                _getParagraph(
                                    paragraph:
                                        "For a start, it does not automatically follow that a record amount of ice will melt this summer. More important for determining the size of the annual thaw is the state of the weather as the midnight sun approaches and temperatures rise. But over the more than 30 years of satellite records, scientists have observed a clear pattern of decline, decade- by-decade.\n\nSo at some point this century the summers are on course to be clear of ice, opening up new shipping lanes, making it easier to access the region\’s oil and gas and possibly also altering the path of the jet stream that drives our weather. So the matter of when all this might happen is the subject of intense research."),
                                //Carousel
                                /*Container(
                                height: 300.0,
                                child: OverflowBox(
                                    maxWidth: screenSize(window).width,
                                    child: ListView(
                                        scrollDirection: Axis.horizontal,
                                        children: <Widget>[
                                          Container(
                                            width: 300.0,
                                            height: 200.0,
                                            child: Image.asset(
                      imagesPath + "carousel1.png",
                      fit: BoxFit.fill),
                                          ),
                                          Container(
                                            width: 300.0,
                                            height: 200.0,
                                            child: Image.asset(
                      imagesPath + "carousel2.png",
                      fit: BoxFit.fill),
                                          ),
                                          Container(
                                            screenSize(window).width,
                                            child: Image.asset(
                      imagesPath + "carousel3.png",
                      fit: BoxFit.fill),
                                          )
                                        ])))*/
                                /*Container(
                              height: 300.0,
                              margin: EdgeInsets.only(top: 30.0),
                              child: OverflowBox(
                                maxWidth: screenSize(window).width,
                                child: PageView(
                                    controller: _carouselController,
                                    children: <Widget>[
                                      Container(
                                          child: Image.asset(
                                              imagesPath + "carousel1.png",
                                              fit: _carouselCurrentView == 1
                        ? BoxFit.scaleDown
                        : BoxFit.fill)),
                                      Container(
                                          child: Image.asset(
                                              imagesPath + "carousel2.png",
                                              fit: _carouselCurrentView == 2
                        ? BoxFit.scaleDown
                        : BoxFit.fill)),
                                      Container(
                                          child: Image.asset(
                                              imagesPath + "carousel3.png",
                                              fit: _carouselCurrentView == 3
                        ? BoxFit.scaleDown
                        : BoxFit.fill))
                                    ],
                                    onPageChanged: (i) {
                                      setState(() {
                                        _carouselCurrentView = i;
                                      });
                                    }),
                              ),
                          ),*/
                                //Next story
                                Container(
                                    margin: EdgeInsets.fromLTRB(
                                        10.0, 80.0, 10.0, 50.0),
                                    child: Column(children: <Widget>[
                                      Container(
                                          child: Text("NEXT STORY",
                                              style: TextStyle(
                                                  color: Color.fromRGBO(
                                                      145, 145, 145, 1.0),
                                                  fontSize: 12.0,
                                                  fontWeight:
                                                      FontWeight.bold))),
                                      GestureDetector(
                                        onTap: () => Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    Story(0))),
                                        child: Container(
                                          padding: EdgeInsets.only(
                                              top: 25.0, bottom: 25.0),
                                          child: Text(
                                              "New battery for smartphones can be charged in a minute",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: _getTextColor(),
                                                  fontSize: 20.0,
                                                  fontWeight: FontWeight.bold,
                                                  height: 1.5)),
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(top: 15.0),
                                        child: GestureDetector(
                                          onTap: () => Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      Story(0))),
                                          child: Image.asset(
                                              imagesPath + "next.png",
                                              scale: appBarIconScale,
                                              color: appMainColor),
                                        ),
                                      )
                                    ]))
                              ])),
                        ])),
                  )
                :
                //Comments Page
                Comments()
            //Story not found
            //TODO: Add 404 image png or gif, (with animation if possible) OR Motion Graphic video!
            : Container(
                color: Colors.deepOrangeAccent,
                alignment: Alignment.center,
                child: Container(
                    height: screenSize(window).height / 4,
                    color: appMainColor,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("Story not found",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.0)),
                          Padding(
                              padding: EdgeInsets.only(top: 15.0),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Padding(
                                        padding: EdgeInsets.only(right: 12.5),
                                        child: GestureDetector(
                                            onTap: () => Navigator.pop(context),
                                            child: Image.asset(
                                                imagesPath + "back.png",
                                                scale: appBarIconScale))),
                                    Text(_timedown.toString(),
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.bold))
                                  ]))
                        ])),
              ));
  }
}
