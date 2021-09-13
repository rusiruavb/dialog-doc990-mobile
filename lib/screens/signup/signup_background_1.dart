import 'package:dialog_doc990_mobile/screen_keys.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';

class SignUpBackground1 extends StatelessWidget {
  final Widget child;
  const SignUpBackground1({
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      key: WidgetKeys.signUpScreenBackground1Key,
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
                  scale: 2.5,
                ),
              ],
            ),
          ),
          Positioned(
            top: 210,
            left: 20,
            child: Text(
              '15% OFF on Service Fee',
              style: TextStyle(
                fontFamily: FONT_FAMILY_PRIMARY,
                fontSize: 20,
                fontWeight: FontWeight.w200,
                color: Color(TEXT_SECONDARY),
              ),
            ),
          ),
          Positioned(
            top: 230,
            left: 20,
            child: Text(
              'Sign Up & SAVE',
              style: TextStyle(
                fontFamily: FONT_FAMILY_SECONDARY,
                fontSize: 38,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Positioned(bottom: 0, child: child)
        ],
      ),
    );
  }
}
