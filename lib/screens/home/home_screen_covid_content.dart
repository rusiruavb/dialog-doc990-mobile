import 'dart:convert';

import 'package:dialog_doc990_mobile/models/covid_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class HomeScreenCovidContent extends StatefulWidget {
  @override
  _HomeScreenCovidContentState createState() => _HomeScreenCovidContentState();
}

Future<CovidInfo> getCovidDetails() async {
  final responseData = await http.get(
      Uri.parse('https://www.hpb.health.gov.lk/api/get-current-statistical'));

  if (responseData.statusCode == 200) {
    return CovidInfo.fromJson(jsonDecode(responseData.body)['data']);
  } else {
    throw Exception('Failed to load the data');
  }
}

class _HomeScreenCovidContentState extends State<HomeScreenCovidContent> {
  Future<CovidInfo> covidInfo;

  @override
  void initState() {
    super.initState();
    covidInfo = getCovidDetails();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      children: <Widget>[
        Align(
          child: Padding(
            child: Text(
              'Covid Information 🇱🇰',
              style: TextStyle(
                fontFamily: 'Larsseit',
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            padding: EdgeInsets.only(left: 20),
          ),
          alignment: Alignment.topLeft,
        ),
        Align(
          child: Padding(
            child: FutureBuilder<CovidInfo>(
              future: covidInfo,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  DateTime updatedAt =
                      DateTime.parse(snapshot.data.lastUpdated);
                  return Text(
                    'Newest update ${DateFormat.yMMMMd('en_US').format(updatedAt)}',
                    style: TextStyle(
                      fontFamily: 'Larsseit',
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey,
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Text(snapshot.error.toString());
                }
                return Text('');
              },
            ),
            padding: EdgeInsets.only(left: 20),
          ),
          alignment: Alignment.topLeft,
        ),
        Padding(
          padding: EdgeInsets.only(
            left: 15,
            right: 15,
            top: 10,
            bottom: 5,
          ),
          child: FutureBuilder<CovidInfo>(
            future: covidInfo,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.30),
                        spreadRadius: 0,
                        blurRadius: 5,
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      CovidCounter(
                        color: Color(0xFFFF8748),
                        counter: snapshot.data.localCases,
                        title: 'Infected',
                      ),
                      CovidCounter(
                        color: Color(0xFFFF4848),
                        counter: snapshot.data.localDeaths,
                        title: 'Deaths',
                      ),
                      CovidCounter(
                        color: Color(0xFF36C12C),
                        counter: snapshot.data.localRecovered,
                        title: 'Recovered',
                      ),
                    ],
                  ),
                );
              } else if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              }
              return CircularProgressIndicator();
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: 15,
            right: 15,
            top: 10,
            bottom: 10,
          ),
          child: Column(
            children: <Widget>[
              Align(
                child: Padding(
                  child: Text(
                    'Symptomps',
                    style: TextStyle(
                      fontFamily: 'Larsseit',
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  padding: EdgeInsets.only(left: 5),
                ),
                alignment: Alignment.topLeft,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  CovidSymptompsCard(
                    image: 'assets/images/covid_cough.png',
                    title: 'Cough',
                  ),
                  CovidSymptompsCard(
                    image: 'assets/images/covid_headache.png',
                    title: 'Headache',
                  ),
                  CovidSymptompsCard(
                    image: 'assets/images/covid_fever.png',
                    title: 'Fever',
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class CovidCounter extends StatelessWidget {
  final int counter;
  final Color color;
  final String title;

  const CovidCounter({
    Key key,
    this.color,
    this.counter,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(6),
          height: 25,
          width: 25,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color.withOpacity(0.26),
          ),
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.transparent,
              border: Border.all(color: color, width: 2),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          '$counter',
          style: TextStyle(
            fontFamily: 'Larsseit',
            color: color,
            fontSize: 30,
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          '$title',
          style: TextStyle(
            fontFamily: 'Larsseit',
            color: Colors.grey,
            fontSize: 15,
            fontWeight: FontWeight.normal,
          ),
        ),
      ],
    );
  }
}

class CovidSymptompsCard extends StatelessWidget {
  final String title;
  final String image;

  const CovidSymptompsCard({
    Key key,
    this.title,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(0),
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
                  scale: 0.85,
                ),
                alignment: Alignment.center,
              ),
              Align(
                child: Container(
                  width: 55.0,
                  height: 70.0,
                  alignment: Alignment.center,
                  decoration: new BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(image),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                alignment: Alignment.center,
              ),
              Align(
                child: Padding(
                  child: Text(
                    title,
                    style: TextStyle(
                      fontFamily: 'Larsseit',
                      fontSize: 14,
                    ),
                  ),
                  padding: EdgeInsets.only(bottom: 1),
                ),
                alignment: Alignment.bottomCenter,
              ),
            ],
          ),
          width: 110,
          height: 110,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(15)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.30),
                spreadRadius: 0,
                blurRadius: 5,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
