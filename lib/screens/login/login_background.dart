import 'package:dialog_doc990_mobile/screen_keys.dart';
import 'package:flutter/material.dart';

class LoginBackground extends StatelessWidget {
  final Widget child;
  const LoginBackground({this.child});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      key: WidgetKeys.loginBackgroundKey,
      color: Colors.red[900],
      height: size.height,
      width: size.width,
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 0,
            right: 0,
            child: Padding(
              child: Image.asset(
                'assets/images/login_top.png',
                scale: 3,
              ),
              padding: EdgeInsets.only(top: 50, right: 8),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            child: Padding(
              child: Text(
                'Welcome',
                style: TextStyle(
                    fontSize: 30, fontFamily: 'Larsseit', color: Colors.white),
              ),
              padding: EdgeInsets.only(top: 100, left: 25),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            child: Padding(
              child: Text(
                'Doc 990',
                style: TextStyle(
                    fontSize: 50,
                    fontFamily: 'Larsseit',
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              padding: EdgeInsets.only(top: 140, left: 25),
            ),
          ),
          Positioned(bottom: 0, child: child)
        ],
      ),
    );
  }
}
