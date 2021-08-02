import 'package:dialog_doc990_mobile/screens/signup/signup_background_2.dart';
import 'package:dialog_doc990_mobile/screens/signup/signup_form_2.dart';
import 'package:flutter/material.dart';

class SignUpScreen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SignUpBackground2(
          child: SignUpForm2(),
        ),
      ),
    );
  }
}
