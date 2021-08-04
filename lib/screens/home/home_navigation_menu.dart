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
            onClicked: () => navigateToSelectedPage(context, '/'),
          ),
          buildMenuItem(
            icon: Icons.person,
            text: 'Sign Up',
            onClicked: () => navigateToSelectedPage(context, '/signup'),
          ),
          buildMenuItem(
            icon: Icons.login,
            text: 'Sign In',
            onClicked: () => navigateToSelectedPage(context, '/login'),
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
            fontFamily: 'Larsseit',
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

  navigateToSelectedPage(BuildContext context, String route) {
    Navigator.of(context).pop();
    switch (route) {
      case '/':
        Navigator.of(context).pushNamed('/');
        break;
      case '/signup':
        Navigator.of(context).pushNamed('/signup');
        break;
      case '/login':
        Navigator.of(context).pushNamed('/login');
        break;
    }
  }
}
