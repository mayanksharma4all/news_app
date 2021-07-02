import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/screens/newheadlines.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 1), () {
      moveToNextScreen();
    });
  }

  moveToNextScreen() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => NewsHeadlines()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          Colors.yellowAccent,
          Colors.lightGreenAccent,
          Colors.purpleAccent
        ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 10,
              ),
              // Padding(
              //   padding: EdgeInsets.only(top: 50),
              //   child: Image.network(
              //       'https://upload.wikimedia.org/wikipedia/commons/4/4d/NewPipe_App_Icon.png'),
              // ),
              Column(
                children: [
                  Image.network(
                      'https://upload.wikimedia.org/wikipedia/commons/4/4d/NewPipe_App_Icon.png'),
                  Text(
                    'News App 2021',
                    style: TextStyle(
                        fontSize: 52,
                        fontWeight: FontWeight.bold,
                        color: Colors.red),
                  )
                ],
              ),

              Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Text(
                    'PoweredBy :: Brain Mentors Pvt Ltd',
                    style: TextStyle(
                        color: Colors.white, backgroundColor: Colors.black),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
