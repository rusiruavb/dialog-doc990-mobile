import 'package:dialog_doc990_mobile/screens/signup/signup_background.dart';
import 'package:dialog_doc990_mobile/screens/signup/signup_form_1.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SignUpBackground(
          child: SignUpForm1(),
        ),
      ),
    );
  }
}
