import 'package:dialog_doc990_mobile/screens/signup/signup_screen_1.dart';
import 'package:flutter/material.dart';

void main() => runApp(DocApp());

class DocApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignUpScreen1(),
    );
  }
}
