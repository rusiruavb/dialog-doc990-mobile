import 'package:dialog_doc990_mobile/constants.dart';
import 'package:dialog_doc990_mobile/models/user_model.dart';
import 'package:dialog_doc990_mobile/providers/appointment_provider.dart';
import 'package:dialog_doc990_mobile/providers/user_provider.dart';
import 'package:dialog_doc990_mobile/screen_keys.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class HomeNavigationMenu extends StatefulWidget {
  @override
  _HomeNavigationMenuState createState() => _HomeNavigationMenuState();
}

class _HomeNavigationMenuState extends State<HomeNavigationMenu> {
  Future<UserModel> profileInfo;
  int noOfAppointments = 0;

  @override
  void initState() {
    super.initState();
    int appointments = 0;
    final provider = Provider.of<UserProvider>(context, listen: false);
    final appointmentProvider =
        Provider.of<AppointmentProvider>(context, listen: false);

    profileInfo = provider.getUserProfile();

    noOfAppointments = appointmentProvider.noOfAppointments;
    print(noOfAppointments);
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      key: WidgetKeys.homeScreenNavigationKey,
      child: ListView(
        padding: EdgeInsets.only(left: 0, top: 20),
        children: <Widget>[
          profileInfo != null
              ? FutureBuilder<UserModel>(
                  future: profileInfo,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return UserAccountsDrawerHeader(
                        accountName: Text(
                          snapshot.data.name,
                          style: TextStyle(
                            fontFamily: FONT_FAMILY_PRIMARY,
                            fontSize: 18,
                          ),
                        ),
                        accountEmail: Text(snapshot.data.email),
                        currentAccountPicture: CircleAvatar(
                          child: ClipOval(
                            child: Image.network(
                              snapshot.data.imageUrl,
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
                            image: AssetImage(
                                'assets/images/header_background.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    } else if (snapshot.hasError) {
                      Fluttertoast.showToast(msg: snapshot.error.toString());
                    }
                    return Text('');
                  },
                )
              : Text(''),
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
            onClicked: () => Navigator.pushNamed(context, '/profile'),
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
            onClicked: () => Navigator.pushNamed(context, '/appointments'),
            isNotificationIndicator: true,
            noOfItems: noOfAppointments,
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
            onClicked: () {
              context.read<UserProvider>().logoutAccount(context);
            },
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

  Widget buildMenuItem({
    String text,
    IconData icon,
    VoidCallback onClicked,
    bool isNotificationIndicator,
    int noOfItems,
  }) {
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
                    noOfItems.toString(),
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
