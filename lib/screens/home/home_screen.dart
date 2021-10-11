import 'package:dialog_doc990_mobile/providers/user_provider.dart';
import 'package:dialog_doc990_mobile/screens/home/home_body_background.dart';
import 'package:dialog_doc990_mobile/screens/home/home_navigation_menu.dart';
import 'package:dialog_doc990_mobile/screens/home/home_screen_covid_content.dart';
import 'package:dialog_doc990_mobile/screens/home/home_screen_service_content.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>(debugLabel: 'homeScreenKey');

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
            child: HomeBodyBackground(
              child: HomeScreenServiceContent(
                child: HomeScreenCovidContent(),
              ),
            ),
          ),
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
                        borderRadius: BorderRadius.all(Radius.circular(50.0)),
                      ),
                    )
                  : Icon(
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
