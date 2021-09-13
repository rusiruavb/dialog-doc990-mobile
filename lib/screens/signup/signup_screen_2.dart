import 'package:dialog_doc990_mobile/screens/home/home_navigation_menu.dart';
import 'package:dialog_doc990_mobile/screens/signup/signup_background_2.dart';
import 'package:dialog_doc990_mobile/screens/signup/signup_form_2.dart';
import 'package:flutter/material.dart';

class SignUpScreen2 extends StatelessWidget {
  final _scaffoldKey = GlobalKey<ScaffoldState>(debugLabel: 'test');

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      key: _scaffoldKey,
      drawer: Container(
        width: size.width * 0.6,
        child: Drawer(
          elevation: 0.0,
          child: HomeNavigationMenu(),
        ),
      ),
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            child: Container(
              child: SignUpBackground2(
                child: SignUpForm2(),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 30, left: 0),
            child: IconButton(
              onPressed: () => _scaffoldKey.currentState.openDrawer(),
              icon: Icon(
                Icons.notes,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
