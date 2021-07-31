import 'dart:async';

import 'package:dialog_doc990_mobile/screens/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<WelcomeScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 2),
        () => {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LoginScreen()))
            });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Positioned(
            top: 0,
            right: 0,
            child: Image.asset(
              'assets/images/landing_top.png',
              width: size.width * 0.5,
            ),
          ),
          Positioned(
            child: Image.asset(
              'assets/images/logo.png',
              scale: 1.3,
              alignment: Alignment.center,
            ),
          ),
          Positioned(
            bottom: 0,
            child: Image.asset(
              'assets/images/landing_bottom.png',
              width: size.width,
              height: size.height * 0.33,
              fit: BoxFit.fill,
            ),
          )
        ],
      ),
    );
  }
}
