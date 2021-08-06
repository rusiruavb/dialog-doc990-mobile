import 'package:dialog_doc990_mobile/screen_keys.dart';
import 'package:flutter/material.dart';

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
      color: Colors.red[900],
      height: size.height,
      width: size.width,
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 0,
            left: 0,
            child: Padding(
              child: Image.asset(
                'assets/images/sign_in_1_top.png',
                scale: 3.3,
              ),
              padding: EdgeInsets.only(
                top: 30,
                left: 20,
              ),
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: Padding(
              child: Text(
                'Sign Up & Save',
                style: TextStyle(
                  fontSize: 30,
                  fontFamily: 'Larsseit',
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              padding: EdgeInsets.only(
                top: 100,
                right: 25,
              ),
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: Padding(
              child: Text(
                '15% OFF on Service Fee',
                style: TextStyle(
                  fontSize: 19,
                  fontFamily: 'Larsseit',
                  color: Colors.white,
                ),
              ),
              padding: EdgeInsets.only(
                top: 141,
                right: 23,
              ),
            ),
          ),
          Positioned(
            child: child,
            bottom: 0,
          )
        ],
      ),
    );
  }
}
