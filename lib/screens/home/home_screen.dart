import 'package:dialog_doc990_mobile/screens/home/home_body_background.dart';
import 'package:dialog_doc990_mobile/screens/home/home_navigation_menu.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final _scaffoldKey = GlobalKey<ScaffoldState>(debugLabel: 'homeScreenKey');

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
        elevation: 0.0,
        child: HomeNavigationMenu(),
      ),
      body: Stack(
        children: <Widget>[
          HomeBodyBackground(
            child: Text('This is test'),
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
