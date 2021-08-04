import 'package:dialog_doc990_mobile/screens/home/home_navigation_menu.dart';
import 'package:dialog_doc990_mobile/screens/signup/signup_background_1.dart';
import 'package:dialog_doc990_mobile/screens/signup/signup_form_1.dart';
import 'package:flutter/material.dart';

class SignUpScreen1 extends StatelessWidget {
  final _scaffoldKey = GlobalKey<ScaffoldState>(debugLabel: 'signUpScreenKey');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
        elevation: 0.0,
        child: HomeNavigationMenu(),
      ),
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            child: SafeArea(
              child: Container(
                child: SignUpBackground1(
                  child: SignUpForm1(),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 30, left: 0),
            child: IconButton(
              onPressed: () => _scaffoldKey.currentState.openDrawer(),
              icon: Icon(
                Icons.notes,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
