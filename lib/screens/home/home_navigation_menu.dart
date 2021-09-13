import 'package:dialog_doc990_mobile/constants.dart';
import 'package:dialog_doc990_mobile/screen_keys.dart';
import 'package:flutter/material.dart';

class HomeNavigationMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      key: WidgetKeys.homeScreenNavigationKey,
      child: ListView(
        padding: EdgeInsets.all(25),
        children: <Widget>[
          buildMenuItem(
            icon: Icons.home_rounded,
            text: 'Home',
            onClicked: () => Navigator.pushNamed(context, '/home'),
          ),
          buildMenuItem(
            icon: Icons.person,
            text: 'Sign Up',
            onClicked: () => Navigator.pushNamed(context, '/signup'),
          ),
          buildMenuItem(
            icon: Icons.login,
            text: 'Sign In',
            onClicked: () => Navigator.pushNamed(context, '/login'),
          ),
        ],
      ),
    );
  }

  Widget buildMenuItem({String text, IconData icon, VoidCallback onClicked}) {
    return ListTile(
      leading: Icon(
        icon,
        size: 30,
      ),
      title: Padding(
        child: Text(
          text,
          style: TextStyle(
            fontFamily: FONT_FAMILY_PRIMARY,
            fontSize: 18,
          ),
        ),
        padding: EdgeInsets.only(
          top: 5,
        ),
      ),
      onTap: onClicked,
    );
  }
}
