// Start page, detects silently whether the user has signed in for not. If not, he's re-directed to the sign in page.

// Start page, detects silently whether the user has signed in for not. If not, he's re-directed to the sign in page.
// For that divider like splash screen :
//          decoration: BoxDecoration(
//          gradient: LinearGradient(
//            begin: Alignment.topLeft,
//            end: Alignment.bottomRight,
//            colors: [
////              Colors.blueAccent,
////                Colors.redAccent.shade400,
////              Color(0xFFCF5CCF),
////              Color(0xFFFF57AC),
////
//              Colors.blue,
////              Color(0xFFFF6D91),
//              Colors.orange,
////              Color(0xFFFF8D7E),
//              Colors.orange,
//            ],
//            stops: [0.5, 0.1, 1],
//          ),
//        ),

// For that paint like screen :
//decoration: BoxDecoration(
//gradient: LinearGradient(
//begin: Alignment.topLeft,
//end: Alignment.bottomRight,
//colors: [
//Colors.blueAccent,
////                Colors.redAccent.shade400,
////              Color(0xFFCF5CCF),

// for multiple final(for now) dividor :
//decoration: BoxDecoration(
//          gradient: LinearGradient(
//            begin: Alignment.topLeft,
//            end: Alignment.bottomRight,
//            colors: [
//              Colors.blueAccent,
////                Colors.redAccent.shade400,
////              Color(0xFFCF5CCF,
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:practice/pages/home.dart';
import 'package:shimmer/shimmer.dart';

class StartScreen extends StatefulWidget {
  @override
  _StartScreenState createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTimer();
  }

  callback() {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      return Home();
    }));
  }

  startTimer() async {
    var duration = Duration(seconds: 2);
    return Timer(duration, callback);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      resizeToAvoidBottomInset: true,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
//              Colors.blueAccent,
//                Colors.redAccent.shade400,
//              Color(0xFFCF5CCF),
//              Color(0xFFFF57AC),
//
              Colors.blue,
//              Color(0xFFFF6D91),
              Colors.orange,
//              Color(0xFFFF8D7E),
              Colors.orange,
            ],
            stops: [0.5, 0.1, 1],
          ),
        ),

//        decoration: BoxDecoration(
//            image: DecorationImage(
//                image: AssetImage(
//                  'assets/images/splashpage.jpg',
//                ),
//                fit: BoxFit.cover)),
        width: 1000,
        height: 1000,
        child: Stack(
          alignment: Alignment.center,
          children: [
//            Opacity(
//              opacity: 0.5,
//              child: Image.asset(
//                'assets/images/splashpage.jpg',
//                fit: BoxFit.fill,
//              ),
//            ),
            Shimmer.fromColors(
              baseColor: Colors.black,
              highlightColor: Colors.grey.shade400,
              child: RichText(
                text: TextSpan(
                  style: TextStyle(fontSize: 100),
                  children: <TextSpan>[
                    TextSpan(
                        text: 'Tit',
                        style: GoogleFonts.pacifico(
                            textStyle: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          color: Colors.green.shade700,
                        ))),
                    TextSpan(
                        text: 'le',
                        style: GoogleFonts.pacifico(
                            textStyle: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          color: Colors.green.shade700,
                        ))),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 60.0, left: 10),
              child: Text(
                ' \t\t\t\t\t                               - YOUR SUB TITLE.',
                style: TextStyle(
                    fontStyle: FontStyle.italic,
                    color: Colors.grey.shade700,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
