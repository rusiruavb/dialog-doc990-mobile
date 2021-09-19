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
          buildMenuItem(
              icon: Icons.money_off_rounded,
              text: 'Refund Request',
              onClicked: () => Navigator.pushNamed(context, '/refund')),
        ],
      ),
    );
  }

  Widget buildMenuItem({String text, IconData icon, VoidCallback onClicked}) {
    return ListTile(
      leading: Icon(
        icon,
        size: 28,
      ),
      title: Text(
        text,
        style: TextStyle(
          fontFamily: FONT_FAMILY_DEFAULT,
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
      ),
      onTap: onClicked,
    );
  }
}
