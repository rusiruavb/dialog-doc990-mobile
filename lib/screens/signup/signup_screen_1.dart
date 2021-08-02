import 'package:dialog_doc990_mobile/screens/signup/signup_background_1.dart';
import 'package:dialog_doc990_mobile/screens/signup/signup_form_1.dart';
import 'package:flutter/material.dart';

class SignUpScreen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SignUpBackground1(
          child: SignUpForm1(),
        ),
      ),
    );
  }
}
