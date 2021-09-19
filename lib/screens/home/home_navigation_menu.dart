import 'package:dialog_doc990_mobile/constants.dart';
import 'package:dialog_doc990_mobile/screen_keys.dart';
import 'package:flutter/material.dart';

class HomeNavigationMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      key: WidgetKeys.homeScreenNavigationKey,
      child: ListView(
        padding: EdgeInsets.only(left: 0, top: 20),
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text(
              'Nimal Perera',
              style: TextStyle(
                fontFamily: FONT_FAMILY_PRIMARY,
                fontSize: 18,
              ),
            ),
            accountEmail: Text('nimal89@gmail.com'),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.network(
                  'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
                  width: 90,
                  height: 90,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            decoration: BoxDecoration(
              image: DecorationImage(
                colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(1),
                  BlendMode.dstATop,
                ),
                image: AssetImage('assets/images/header_background.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, top: 10),
            child: Text(
              'Services',
              style: TextStyle(
                fontFamily: SF_PRO_FONT,
                fontWeight: FontWeight.w600,
                fontSize: 17,
                color: Colors.black54,
              ),
            ),
          ),
          buildMenuItem(
            icon: Icons.home_rounded,
            text: 'Home',
            onClicked: () => Navigator.pushNamed(context, '/home'),
            isNotificationIndicator: false,
          ),
          buildMenuItem(
            icon: Icons.person,
            text: 'My Profile',
            onClicked: () => Navigator.pushNamed(context, '/home'),
            isNotificationIndicator: false,
          ),
          buildMenuItem(
            icon: Icons.search,
            text: 'Channel Doctor',
            onClicked: () => Navigator.pushNamed(context, '/channel-doctor'),
            isNotificationIndicator: false,
          ),
          buildMenuItem(
            icon: Icons.favorite,
            text: 'My Channelings',
            onClicked: () => Navigator.pushNamed(context, '/home'),
            isNotificationIndicator: true,
          ),
          buildMenuItem(
            icon: Icons.description,
            text: 'Medicines',
            onClicked: () => Navigator.pushNamed(context, '/make-appointment'),
            isNotificationIndicator: false,
          ),
          buildMenuItem(
            icon: Icons.sync,
            text: 'Refund Request',
            onClicked: () => Navigator.pushNamed(context, '/refund'),
            isNotificationIndicator: true,
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.only(left: 16, top: 10),
            child: Text(
              'Actions',
              style: TextStyle(
                fontFamily: SF_PRO_FONT,
                fontWeight: FontWeight.w600,
                fontSize: 17,
                color: Colors.black54,
              ),
            ),
          ),
          buildMenuItem(
            icon: Icons.person_add,
            text: 'Sign Up',
            onClicked: () => Navigator.pushNamed(context, '/signup'),
            isNotificationIndicator: false,
          ),
          buildMenuItem(
            icon: Icons.fingerprint,
            text: 'Sign In',
            onClicked: () => Navigator.pushNamed(context, '/login'),
            isNotificationIndicator: false,
          ),
          buildMenuItem(
            icon: Icons.exit_to_app,
            text: 'Logout',
            onClicked: () => Navigator.pushNamed(context, '/home'),
            isNotificationIndicator: false,
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.only(left: 16, top: 10),
            child: Text(
              'Information',
              style: TextStyle(
                fontFamily: SF_PRO_FONT,
                fontWeight: FontWeight.w600,
                fontSize: 17,
                color: Colors.black54,
              ),
            ),
          ),
          buildMenuItem(
            icon: Icons.priority_high,
            text: 'Terms & Conditions',
            onClicked: () => Navigator.pushNamed(context, '/home'),
            isNotificationIndicator: false,
          ),
          buildMenuItem(
            icon: Icons.privacy_tip,
            text: 'Privacy Policy',
            onClicked: () => Navigator.pushNamed(context, '/home'),
            isNotificationIndicator: false,
          ),
          buildMenuItem(
            icon: Icons.contact_support,
            text: 'Contact Us',
            onClicked: () => Navigator.pushNamed(context, '/home'),
            isNotificationIndicator: false,
          ),
          buildMenuItem(
            icon: Icons.question_answer,
            text: 'FAQ',
            onClicked: () => Navigator.pushNamed(context, '/home'),
            isNotificationIndicator: false,
          ),
        ],
      ),
    );
  }

  Widget buildMenuItem(
      {String text,
      IconData icon,
      VoidCallback onClicked,
      bool isNotificationIndicator}) {
    return ListTile(
      leading: Icon(
        icon,
        size: 25,
      ),
      title: Text(
        text,
        style: TextStyle(
          fontFamily: SF_PRO_FONT,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
      onTap: onClicked,
      trailing: isNotificationIndicator
          ? ClipOval(
              child: Container(
                color: Color(COLOR_PRIMARY),
                width: 20,
                height: 20,
                child: Center(
                  child: Text(
                    '4',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
            )
          : Text(''),
    );
  }
}
