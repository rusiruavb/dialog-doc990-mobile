import 'package:dialog_doc990_mobile/providers/search_doctor_provider.dart';
import 'package:dialog_doc990_mobile/providers/user_provider.dart';
import 'package:dialog_doc990_mobile/screens/channel_doctor/search_doctor_form.dart';
import 'package:dialog_doc990_mobile/screens/channel_doctor/search_doctors.dart';
import 'package:dialog_doc990_mobile/screens/home/home_navigation_menu.dart';
import 'package:dialog_doc990_mobile/screens/profile/profile_content.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserProfile extends StatefulWidget {
  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  final _scaffoldKey =
      GlobalKey<ScaffoldState>(debugLabel: 'channelDoctorScreenKey');

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final provider = context.read<UserProvider>();

    return Scaffold(
      key: _scaffoldKey,
      drawer: Container(
        width: size.width * 0.8,
        child: Drawer(
          elevation: 0.0,
          child: HomeNavigationMenu(),
        ),
      ),
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            child: Container(
              child: Padding(
                padding: EdgeInsets.only(top: 100),
                child: ProfileContent(),
              ),
            ),
          ),
          Container(
            height: size.height * 0.12,
            decoration: BoxDecoration(
              color: Color(0xfffafafa),
            ),
            child: Stack(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 30, left: 0),
                  child: IconButton(
                    onPressed: () => _scaffoldKey.currentState.openDrawer(),
                    icon: provider.profileImage != null
                        ? Container(
                            decoration: BoxDecoration(
                              color: const Color(0xff7c94b6),
                              image: DecorationImage(
                                image: NetworkImage(
                                  provider.profileImage,
                                ),
                                fit: BoxFit.cover,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50.0)),
                            ),
                          )
                        : Icon(
                            Icons.notes,
                            color: Colors.red,
                          ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 45, left: 50),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Row(
                      children: <Widget>[
                        Text(
                          'My Profile',
                          style: TextStyle(
                            fontFamily: 'Larsseit',
                            fontSize: 17,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
