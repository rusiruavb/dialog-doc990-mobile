import 'package:dialog_doc990_mobile/components/rounded_button.dart';
import 'package:dialog_doc990_mobile/components/rounded_input_field.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.5,
      width: size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(50.0), topLeft: Radius.circular(50.0)),
        color: Colors.white,
      ),
      child: Padding(
        padding: EdgeInsets.only(top: 30, left: 25, right: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Sign Up',
              style: TextStyle(
                fontFamily: 'Larsseit',
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.left,
            ),
            SizedBox(
              height: size.height * 0.025,
            ),
            Text(
              'Phone Number',
              style: TextStyle(
                fontFamily: 'Larsseit',
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.left,
            ),
            SizedBox(
              height: size.height * 0.010,
            ),
            RoundedTextFeild(
              isPassword: false,
              isNumber: true,
            ),
            SizedBox(
              height: size.height * 0.025,
            ),
            Text(
              'Password',
              style: TextStyle(
                fontFamily: 'Larsseit',
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.left,
            ),
            SizedBox(
              height: size.height * 0.010,
            ),
            RoundedTextFeild(
              isPassword: true,
              isNumber: false,
            ),
            SizedBox(
              height: size.height * 0.025,
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: RoundedButton(
                text: 'SIGN UP',
                action: () {
                  print('Sign Up clicked');
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
