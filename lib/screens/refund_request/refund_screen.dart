import 'package:dialog_doc990_mobile/constants.dart';
import 'package:dialog_doc990_mobile/screens/home/home_navigation_menu.dart';
import 'package:dialog_doc990_mobile/screens/refund_request/refund_page.dart';
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
        width: size.width * 0.8,
        child: Drawer(
          elevation: 0.0,
          child: HomeNavigationMenu(),
        ),
      ),
      body: Stack(
        children: <Widget>[
          RefundPage(),
          Container(
            height: size.height * 0.12,
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Stack(
              children: [
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
                  padding: EdgeInsets.only(top: 40, left: 100),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Row(
                      children: <Widget>[
                        Image.asset(
                          'assets/images/money_refund.png',
                          scale: 14,
                        ),
                        Text(
                          'Refund Request',
                          style: TextStyle(
                            fontFamily: FONT_FAMILY_PRIMARY,
                            fontSize: 20,
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
