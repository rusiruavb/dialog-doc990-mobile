import 'package:dialog_doc990_mobile/screen_keys.dart';
import 'package:flutter/material.dart';

class HomeScreenContent extends StatefulWidget {
  @override
  _HomeScreenContentState createState() => _HomeScreenContentState();
}

class _HomeScreenContentState extends State<HomeScreenContent> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      key: WidgetKeys.homeScreenContentKey,
      child: Container(
        height: 200,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(10),
              child: Card(
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.white70, width: 1),
                  borderRadius: BorderRadius.circular(15),
                ),
                elevation: 0,
                child: Container(
                  child: Stack(
                    children: <Widget>[
                      Align(
                        child: Image.asset(
                          'assets/images/service_background.png',
                          scale: 0.7,
                        ),
                        alignment: Alignment.center,
                      ),
                      Align(
                        child: Container(
                          width: 120.0,
                          height: 120.0,
                          alignment: Alignment.center,
                          decoration: new BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                    'assets/images/search_doctor.png'),
                                fit: BoxFit.fill),
                          ),
                        ),
                        alignment: Alignment.topCenter,
                      ),
                      Align(
                        child: Padding(
                          child: Text(
                            'Search Doctor',
                            style: TextStyle(
                              fontFamily: 'Larsseit',
                              fontSize: 15,
                            ),
                          ),
                          padding: EdgeInsets.only(bottom: 8),
                        ),
                        alignment: Alignment.bottomCenter,
                      ),
                    ],
                  ),
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.45),
                        spreadRadius: 0,
                        blurRadius: 10,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Card(
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.white70, width: 1),
                  borderRadius: BorderRadius.circular(15),
                ),
                elevation: 0,
                child: Container(
                  child: Stack(
                    children: <Widget>[
                      Align(
                        child: Image.asset(
                          'assets/images/service_background.png',
                          scale: 0.7,
                        ),
                        alignment: Alignment.center,
                      ),
                      Align(
                        child: Container(
                          width: 120.0,
                          height: 120.0,
                          alignment: Alignment.center,
                          decoration: new BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                    'assets/images/search_doctor.png'),
                                fit: BoxFit.fill),
                          ),
                        ),
                        alignment: Alignment.topCenter,
                      ),
                      Align(
                        child: Padding(
                          child: Text(
                            'Search Doctor',
                            style: TextStyle(
                              fontFamily: 'Larsseit',
                              fontSize: 15,
                            ),
                          ),
                          padding: EdgeInsets.only(bottom: 8),
                        ),
                        alignment: Alignment.bottomCenter,
                      ),
                    ],
                  ),
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.45),
                        spreadRadius: 0,
                        blurRadius: 10,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Card(
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.white70, width: 1),
                  borderRadius: BorderRadius.circular(15),
                ),
                elevation: 0,
                child: Container(
                  child: Stack(
                    children: <Widget>[
                      Align(
                        child: Image.asset(
                          'assets/images/service_background.png',
                          scale: 0.7,
                        ),
                        alignment: Alignment.center,
                      ),
                      Align(
                        child: Container(
                          width: 120.0,
                          height: 120.0,
                          alignment: Alignment.center,
                          decoration: new BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                    'assets/images/search_doctor.png'),
                                fit: BoxFit.fill),
                          ),
                        ),
                        alignment: Alignment.topCenter,
                      ),
                      Align(
                        child: Padding(
                          child: Text(
                            'Search Doctor',
                            style: TextStyle(
                              fontFamily: 'Larsseit',
                              fontSize: 15,
                            ),
                          ),
                          padding: EdgeInsets.only(bottom: 8),
                        ),
                        alignment: Alignment.bottomCenter,
                      ),
                    ],
                  ),
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.45),
                        spreadRadius: 0,
                        blurRadius: 10,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Card(
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.white70, width: 1),
                  borderRadius: BorderRadius.circular(15),
                ),
                elevation: 0,
                child: Container(
                  child: Stack(
                    children: <Widget>[
                      Align(
                        child: Image.asset(
                          'assets/images/service_background.png',
                          scale: 0.7,
                        ),
                        alignment: Alignment.center,
                      ),
                      Align(
                        child: Container(
                          width: 120.0,
                          height: 120.0,
                          alignment: Alignment.center,
                          decoration: new BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                    'assets/images/search_doctor.png'),
                                fit: BoxFit.fill),
                          ),
                        ),
                        alignment: Alignment.topCenter,
                      ),
                      Align(
                        child: Padding(
                          child: Text(
                            'Search Doctor',
                            style: TextStyle(
                              fontFamily: 'Larsseit',
                              fontSize: 15,
                            ),
                          ),
                          padding: EdgeInsets.only(bottom: 8),
                        ),
                        alignment: Alignment.bottomCenter,
                      ),
                    ],
                  ),
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.45),
                        spreadRadius: 0,
                        blurRadius: 10,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
