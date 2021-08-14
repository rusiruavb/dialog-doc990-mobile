import 'package:dialog_doc990_mobile/screens/channel_doctor/search_doctor_form.dart';
import 'package:dialog_doc990_mobile/screens/home/home_navigation_menu.dart';
import 'package:flutter/material.dart';

class SearchDoctorScreen extends StatelessWidget {
  final _scaffoldKey =
      GlobalKey<ScaffoldState>(debugLabel: 'channelDoctorScreenKey');

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
          Padding(
            padding: EdgeInsets.only(top: 30, left: 0),
            child: IconButton(
              onPressed: () => _scaffoldKey.currentState.openDrawer(),
              icon: Icon(
                Icons.notes,
                color: Colors.red[900],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 40, left: 85),
            child: Align(
              alignment: Alignment.topCenter,
              child: Row(
                children: <Widget>[
                  Image.asset(
                    'assets/images/search_doctor.png',
                    scale: 14,
                  ),
                  Text(
                    'Channel Your Doctor',
                    style: TextStyle(
                      fontFamily: 'Larsseit',
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 100),
            child: SeachDoctorFormScreen(),
          )
        ],
      ),
    );
  }
}
