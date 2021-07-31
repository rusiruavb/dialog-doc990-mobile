import 'package:dialog_doc990_mobile/screens/login/login_background.dart';
import 'package:dialog_doc990_mobile/screens/login/login_form.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: LoginBackground(
          child: LoginForm(),
        ),
      ),
    );
  }
}
