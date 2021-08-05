import 'package:flutter/material.dart';

class HomeScreenCovidContent extends StatefulWidget {
  @override
  _HomeScreenCovidContentState createState() => _HomeScreenCovidContentState();
}

class _HomeScreenCovidContentState extends State<HomeScreenCovidContent> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Align(
          child: Padding(
            child: Text(
              'Covide Information',
              style: TextStyle(
                fontFamily: 'Larsseit',
                fontSize: 25,
                fontWeight: FontWeight.w600,
              ),
            ),
            padding: EdgeInsets.only(left: 20),
          ),
          alignment: Alignment.topLeft,
        )
      ],
    );
  }
}
