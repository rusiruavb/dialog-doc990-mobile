import 'package:dialog_doc990_mobile/screens/home/home_navigation_menu.dart';
import 'package:dialog_doc990_mobile/screens/refund/refund_page.dart';
import 'package:flutter/material.dart';

class BankRefundScreen extends StatelessWidget {
  final _scaffoldKey =
      GlobalKey<ScaffoldState>(debugLabel: 'bankRefundScreenKey');

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomInset: true,
      drawer: Container(
        width: size.width * 0.7,
        child: Drawer(
          elevation: 0.0,
          child: HomeNavigationMenu(),
        ),
      ),
      body: Stack(
        children: <Widget>[
          RefundPage(),
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
        ],
      ),
    );
  }
}
