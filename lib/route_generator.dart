import 'package:dialog_doc990_mobile/screens/home/home_screen.dart';
import 'package:dialog_doc990_mobile/screens/login/login_screen.dart';
import 'package:dialog_doc990_mobile/screens/signup/signup_screen_1.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final arguments = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case '/signup':
        return MaterialPageRoute(builder: (_) => SignUpScreen1());
      case '/login':
        return MaterialPageRoute(builder: (_) => LoginScreen());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.red[900],
          leading: IconButton(
            icon: Transform(
              alignment: Alignment.center,
              transform: Matrix4.rotationY(math.pi),
              child: Icon(Icons.segment_rounded),
            ),
            onPressed: () {
              print('Error Route');
            },
          ),
        ),
        body: Center(
          child: Text(
            'Dear Customer, this is wrong route',
            style: TextStyle(
              fontFamily: 'Larsseit',
              fontSize: 25,
            ),
          ),
        ),
      );
    });
  }
}
