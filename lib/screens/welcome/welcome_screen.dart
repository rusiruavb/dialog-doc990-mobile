import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:dialog_doc990_mobile/screens/home/home_screen.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

const colorizeColors = [
  Color(0xffe62a29),
  Color(0xffffcb08),
];

class _SplashScreenState extends State<WelcomeScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 3),
      () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomeScreen(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/images/logo.png',
              height: 150,
            ),
            SizedBox(
              height: 15,
            ),
            AnimatedTextKit(
              animatedTexts: [
                ColorizeAnimatedText(
                  'Channeling Made Easy',
                  textStyle: TextStyle(
                    fontFamily: 'Larsseit',
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                  ),
                  colors: colorizeColors,
                  speed: const Duration(milliseconds: 300),
                )
              ],
              totalRepeatCount: 1,
            ),
            SizedBox(
              height: 15,
            ),
            CircularProgressIndicator(
              strokeWidth: 5,
              valueColor: AlwaysStoppedAnimation<Color>(
                Colors.red[900],
              ),
            )
          ],
        ),
      ),
    );
  }
}
