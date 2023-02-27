//import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'main.dart';
import 'subsubcategory.dart';

var routes = <String, WidgetBuilder>{
  "/home": (BuildContext context) => MyApp(),
};
double? shortestSide; // get the shortest side of device
bool useMobileLayout = shortestSide! < 600.0;

class TCScreen extends StatefulWidget {
  @override
  _TCState createState() => _TCState();
}

int firtstime = 0;

class _TCState extends State<TCScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    //Timer(Duration(seconds: 5), () => Navigator.pushReplacementNamed(context, "/home"));
  }

  double topGasDetectionText = 120.00;
  double topIagree = 50;
  double topAcceptBtn = 50;

  double topGasDetectionText_landscap = 120.00;
  double topIagree_landscap = 50;
  double topAcceptBtn_landscap = 50;

  double fontsizeGasDetectionText = 60.0;
  double fontsizeGasDetectionText_ = 50.0;
  double fontsizeIagree = 0.0;
  double fontsizeAcceptBtn = 0.0;

  double scaleigree = 1.0;
  double scaleigree_ = 2.0;
  double scaleAcceptBtn = 1.0;
  double scaleAcceptBtn_ = 2.0;
  double scaleDrageImg = 1.0;

  @override
  Widget build(BuildContext context) {
    firtstime++;
    shortestSide = MediaQuery.of(context).size.shortestSide;
    useMobileLayout = shortestSide! < 550.0;

    if (useMobileLayout) {
      //for phone
      topGasDetectionText = 120;
      topIagree = 50;
      topAcceptBtn = 50;

      topGasDetectionText_landscap = 40.00;
      topIagree_landscap = 25;
      topAcceptBtn_landscap = 35;

      scaleigree = 1.0;
      scaleDrageImg = 1.0;
      scaleAcceptBtn = 1.0;
      fontsizeGasDetectionText = 60.0;
      if (MediaQuery.of(context).orientation == Orientation.landscape) {
        scaleigree_ = 2.0;
        scaleAcceptBtn_ = 2.5;
        fontsizeGasDetectionText_ = 40.0;
      }
    } else {
      //for tablet
      topGasDetectionText = 150;
      topIagree = 100;
      topAcceptBtn = 100;

      topGasDetectionText_landscap = 100;
      topIagree_landscap = 100;
      topAcceptBtn_landscap = 100;

      scaleigree = 1.57;
      scaleAcceptBtn = 1.7;
      scaleDrageImg = 1.3;

      fontsizeGasDetectionText = 50.0;

      fontsizeGasDetectionText_ = 50.0;
      scaleigree_ = 1.9;
      scaleAcceptBtn_ = 2.0;
    }
    if (firtstime <= 1) {
    } else {}

    //   final Orientation orientation = MediaQuery.of(context).orientation; // get the orientation
    if (MediaQuery.of(context).orientation == Orientation.portrait) {
      return Scaffold(
          body: Container(
        color: Color(0xFFE5E5E5),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            // Image.asset("assets/acceptbtn.png"),

            Container(
                color: Colors.white,
                child: Padding(
                    padding: EdgeInsets.only(top: 30, bottom: 10),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Image.asset(
                        'assets/tcdager.png',
                        alignment: Alignment.centerRight,
                        scale: scaleDrageImg,
                      ),
                    ))),
            ConstrainedBox(
              constraints: const BoxConstraints(minWidth: double.infinity),
              child: Padding(
                  padding: EdgeInsets.only(top: topGasDetectionText),
                  child: Text(
                    "Gas Detection",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: fontsizeGasDetectionText,

                      fontFamily: 'RobotoMono',
                      fontStyle: FontStyle.normal,
                      color: Color(0xFF666666), // insert your font size here
                    ),
                  )) /*Image.asset('assets/gasdetectionpg.png',fit: BoxFit.fitWidth,)*/,
            ),
            /*FlatButton(
                  onPressed: (){
                  },
                 padding: EdgeInsets.only(left: 0.0,right: 0.0),
                  child: Image.asset('assets/tcdager.png',fit: BoxFit.fitWidth,)),
              FlatButton(
                  onPressed: (){
                  },
                  padding: EdgeInsets.only(left: 0.0,right: 0.0),
                 // padding: EdgeInsets.only(left: 65.0,right: 65.0),
                  child: Image.asset('assets/gasdetectionpg.png',fit: BoxFit.fitWidth,)),*/
            Padding(
                padding: EdgeInsets.only(top: topIagree),
                child: GestureDetector(
                    onTap: () {
                      createFileOfPdfUrl("app_terms").then((file) {
                        setState(() {
                          //pathPDF = file.path;
                          //   pr.hide();
                          var now = new DateTime.now();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PDFScreen(
                                    file.path, "Terms of Use", "app_terms")),
                          );
                        });
                      });

                      //SharedPreferences prefs = await SharedPreferences.getInstance();
                    },
                    // padding: EdgeInsets.only(left: 0.0, right: 0.0, ),
                    //   padding: EdgeInsets.only(left: 65.0,right: 65.0),
                    child: Image.asset(
                      'assets/iagree.png',
                      // scale: scaleigree,
                    ))),
            Padding(
              padding:
                  EdgeInsets.only(left: 100.0, right: 100.0, top: topAcceptBtn),
              child: ElevatedButton(
                onPressed: () {
                  _setTcAccepted();
                  Navigator.pushReplacementNamed(context, "/home");
                },
                // padding: EdgeInsets.only(left: 0, right: 0, top: 0),
                child: Row(
                  children: [
                    Icon(
                      Icons.play_arrow,
                      color: Colors.white70,
                      size: 30,
                    ),
                    SizedBox(width: 25),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        "Accept",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
                // Image.asset(
                //   'assets/acceptbtn.png',
                //   scale: scaleAcceptBtn,
                // ),
              ),
            ),

            /* FlatButton(
                  onPressed: (){
                    exit(0);
                  },
                  padding: EdgeInsets.only(left: 65.0,right: 65.0,top: 30),
                  child: Image.asset('assets/declinebtn.png')),*/
          ],
        ),
      ));
    } else {
      return Scaffold(
          body: Container(
        color: Color(0xFFE5E5E5),
        child: Column(
          children: <Widget>[
            // Image.asset("assets/acceptbtn.png"),
            Container(
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.only(top: 25, bottom: 20),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Image.asset(
                      'assets/tcdager.png',
                      alignment: Alignment.centerRight,
                      scale: 2.0,
                    ),
                  ),
                )),

            ConstrainedBox(
              constraints: const BoxConstraints(minWidth: double.infinity),
              child: Padding(
                  padding: EdgeInsets.only(top: topGasDetectionText_landscap),
                  child: Text(
                    "Gas Detection",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: fontsizeGasDetectionText_,

                      fontFamily: 'RobotoMono',
                      fontStyle: FontStyle.normal,
                      color: Color(0xFF666666), // insert your font size here
                    ),
                  )) /*Image.asset('assets/gasdetectionpg.png',fit: BoxFit.fitWidth,)*/,
            ),
            /*FlatButton(
                  onPressed: (){
                  },
                 padding: EdgeInsets.only(left: 0.0,right: 0.0),
                  child: Image.asset('assets/tcdager.png',fit: BoxFit.fitWidth,)),
              FlatButton(
                  onPressed: (){
                  },
                  padding: EdgeInsets.only(left: 0.0,right: 0.0),
                 // padding: EdgeInsets.only(left: 65.0,right: 65.0),
                  child: Image.asset('assets/gasdetectionpg.png',fit: BoxFit.fitWidth,)),*/
            ElevatedButton(
                onPressed: () {
                  createFileOfPdfUrl("app_terms").then((file) {
                    setState(() {
                      //pathPDF = file.path;
                      //   pr.hide();
                      var now = new DateTime.now();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PDFScreen(
                                file.path, "Terms of Use", "app_terms")),
                      );
                    });
                  });

                  //SharedPreferences prefs = await SharedPreferences.getInstance();
                },
                //   padding: EdgeInsets.only(left: 65.0,right: 65.0),
                child: Padding(
                  padding: EdgeInsets.only(
                      left: 0.0, right: 0.0, top: topIagree_landscap),
                  child: Image.asset(
                    'assets/iagree.png',
                    scale: scaleigree_,
                  ),
                )),
            ElevatedButton(
                onPressed: () {
                  _setTcAccepted();
                  Navigator.pushReplacementNamed(context, "/home");
                },
                child: Padding(
                  padding: EdgeInsets.only(
                      left: 65.0, right: 65.0, top: topAcceptBtn_landscap),
                  child: Image.asset(
                    'assets/acceptbtn.png',
                    scale: scaleAcceptBtn_,
                  ),
                )),
            /* FlatButton(
                  onPressed: (){
                    exit(0);
                  },
                  padding: EdgeInsets.only(left: 65.0,right: 65.0,top: 30),
                  child: Image.asset('assets/declinebtn.png')),*/
          ],
        ),
      ));
    }
  }

  _setTcAccepted() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // int counter = (prefs.getInt('counter') ?? 0) + 1;
    await prefs.setBool("accepTC", true);
  }
}
