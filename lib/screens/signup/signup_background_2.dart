import 'package:dialog_doc990_mobile/screen_keys.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';

class SignUpBackground2 extends StatelessWidget {
  final Widget child;

  const SignUpBackground2({
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.only(bottom: 20),
      child: SingleChildScrollView(
        child: Container(
          key: WidgetKeys.signUpScreenBackground2Key,
          height: size.height * 1.25,
          width: size.width,
          child: Stack(
            children: <Widget>[
              Positioned(
                top: 80,
                left: 20,
                child: Row(
                  children: <Widget>[
                    Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 10),
                          child: Image.asset(
                            'assets/images/logo.png',
                            scale: 3,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Proceed with your',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontFamily: FONT_FAMILY_PRIMARY,
                            fontSize: 18,
                            fontWeight: FontWeight.w200,
                            color: Color(TEXT_SECONDARY),
                          ),
                        ),
                        Text(
                          'Sign Up & SAVE',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontFamily: FONT_FAMILY_SECONDARY,
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Positioned(
                child: child,
                top: 180,
              )
            ],
          ),
        ),
      ),
    );
  }
}
