import 'dart:async';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  final int duration;
  final Widget navigationPage;

  WelcomeScreen({
    this.navigationPage,
    this.duration,
  });

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: duration), () {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => navigationPage),
        ModalRoute.withName('/home'),
      );
    });

    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Center(
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
      ),
    );
  }
}

const colorizeColors = [
  Color(0xffe62a29),
  Color(0xffffcb08),
];
