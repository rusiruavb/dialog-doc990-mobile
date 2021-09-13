import 'package:dialog_doc990_mobile/constants.dart';
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
      height: size.height,
      width: size.width,
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 100,
            left: 20,
            child: Stack(
              children: <Widget>[
                Image.asset(
                  'assets/images/logo.png',
                  scale: 2,
                ),
              ],
            ),
          ),
          Positioned(
            top: 230,
            left: 20,
            child: Text(
              'Proceed with your',
              style: TextStyle(
                fontFamily: FONT_FAMILY_PRIMARY,
                fontSize: 20,
                fontWeight: FontWeight.w200,
                color: Color(TEXT_SECONDARY),
              ),
            ),
          ),
          Positioned(
            top: 250,
            left: 20,
            child: Text(
              'Login',
              style: TextStyle(
                fontFamily: FONT_FAMILY_SECONDARY,
                fontSize: 38,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Positioned(bottom: 20, child: child)
        ],
      ),
    );
  }
}
