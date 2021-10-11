import 'package:dialog_doc990_mobile/constants.dart';
import 'package:dialog_doc990_mobile/models/appointment_model.dart';
import 'package:dialog_doc990_mobile/providers/appointment_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppointmentContent extends StatefulWidget {
  @override
  _AppointmentContentState createState() => _AppointmentContentState();
}

class _AppointmentContentState extends State<AppointmentContent> {
  Future<List<AppointmentModel>> appointments;

  @override
  void initState() {
    super.initState();
    appointments = context.read<AppointmentProvider>().getUserAppointments();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      child: Column(
        children: <Widget>[
          FutureBuilder<List<AppointmentModel>>(
            future: appointments,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Container(
                  height: size.height * 0.9,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          'Your Appointments',
                          style: TextStyle(
                            fontFamily: FONT_FAMILY_PRIMARY,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          padding: EdgeInsets.only(top: 0),
                          itemCount: snapshot.data.length,
                          itemBuilder: (BuildContext context, int index) {
                            return AppointmentCard(
                              doctorName: snapshot.data[index].doctorName,
                              hospitalName: snapshot.data[index].hospitalName,
                              specilization:
                                  snapshot.data[index].specialization,
                              date: snapshot.data[index].date,
                              time: snapshot.data[index].time,
                              referenceNo: snapshot.data[index].referenceNo,
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                );
              } else if (snapshot.hasError) {
                return Text('Error with getting Trip information');
              }
              return Container(
                width: 25,
                height: 25,
                child: CircularProgressIndicator(
                  color: Color(COLOR_PRIMARY),
                  strokeWidth: 3,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class AppointmentCard extends StatefulWidget {
  final String doctorName;
  final String specilization;
  final String hospitalName;
  final DateTime date;
  final String time;
  final String referenceNo;

  AppointmentCard({
    this.doctorName,
    this.specilization,
    this.hospitalName,
    this.date,
    this.time,
    this.referenceNo,
  });

  @override
  _AppointmentCardState createState() => _AppointmentCardState(
        doctorName: doctorName,
        hospitalName: hospitalName,
        specilization: specilization,
        date: date,
        time: time,
        referenceNo: referenceNo,
      );
}

class _AppointmentCardState extends State<AppointmentCard> {
  final String doctorName;
  final String specilization;
  final String hospitalName;
  final DateTime date;
  final String time;
  final String referenceNo;
  String roomNo = '112';

  _AppointmentCardState({
    this.doctorName,
    this.specilization,
    this.hospitalName,
    this.date,
    this.time,
    this.referenceNo,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color(COLOR_SECONDARY),
            blurRadius: 10,
            spreadRadius: -22,
            offset: Offset(5.0, 5.0),
          )
        ],
      ),
      padding: EdgeInsets.all(5),
      child: Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: InkWell(
          child: Stack(
            children: [
              Opacity(
                opacity: 1,
                child: Image.asset(
                  'assets/images/appointment_background.png',
                  fit: BoxFit.fill,
                  scale: 0.2,
                  height: 200,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Dr. ' + doctorName,
                          style: TextStyle(
                            fontFamily: FONT_FAMILY_PRIMARY,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          '#' + referenceNo,
                          style: TextStyle(
                            fontFamily: FONT_FAMILY_PRIMARY,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                    Divider(
                      thickness: 1,
                      color: Colors.white,
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          specilization,
                          style: TextStyle(
                            fontFamily: FONT_FAMILY_PRIMARY,
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          hospitalName,
                          style: TextStyle(
                            fontFamily: FONT_FAMILY_PRIMARY,
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          date.toString().split(' ')[0] + ' at ' + time,
                          style: TextStyle(
                            fontFamily: FONT_FAMILY_PRIMARY,
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          'Room No.: 112',
                          style: TextStyle(
                            fontFamily: FONT_FAMILY_PRIMARY,
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        FlatButton(
                          onPressed: () {
                            print('test');
                          },
                          child: Text(
                            'CANCEL APPOINTMENT & REFUND',
                            style: TextStyle(
                              fontFamily: FONT_FAMILY_PRIMARY,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          color: Color(COLOR_YELLOW),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
