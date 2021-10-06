import 'package:dialog_doc990_mobile/constants.dart';
import 'package:dialog_doc990_mobile/models/doctor_model.dart';
import 'package:dialog_doc990_mobile/providers/search_doctor_provider.dart';
import 'package:dialog_doc990_mobile/screens/channel_doctor/search_doctor_form.dart';
import 'package:dialog_doc990_mobile/screens/home/home_navigation_menu.dart';
import 'package:dialog_doc990_mobile/screens/make_appointment/make_appointment_form.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MakeAppointmentScreen extends StatefulWidget {
  @override
  _MakeAppointmentScreenState createState() => _MakeAppointmentScreenState();
}

class _MakeAppointmentScreenState extends State<MakeAppointmentScreen> {
  Doctor doctor;
  final _scaffoldKey =
      GlobalKey<ScaffoldState>(debugLabel: 'channelDoctorScreenKey');

  @override
  void initState() {
    super.initState();
    doctor = context.read<SearchDoctorProvider>().getSelectedDoctor();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      key: _scaffoldKey,
      drawer: Container(
        width: size.width * 0.7,
        child: Drawer(
          elevation: 0.0,
          child: HomeNavigationMenu(),
        ),
      ),
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(top: 100),
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 25),
                    child: Row(
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            ClipOval(
                              child: Image.network(
                                doctor.imageUrl,
                                width: 100,
                                height: 100,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Dr. ' + doctor.name,
                                style: TextStyle(
                                  fontFamily: FONT_FAMILY_PRIMARY,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                doctor.specialization,
                                style: TextStyle(
                                  fontFamily: FONT_FAMILY_PRIMARY,
                                  fontSize: 15,
                                ),
                              ),
                              Text(
                                doctor.availableDetails[0].hospitalName,
                                style: TextStyle(
                                  fontFamily: FONT_FAMILY_PRIMARY,
                                  fontSize: 17,
                                ),
                              ),
                              Text(
                                doctor.availableDetails[0].dateTime
                                    .split("T")[0],
                                style: TextStyle(
                                  fontFamily: FONT_FAMILY_PRIMARY,
                                  fontSize: 17,
                                ),
                              ),
                              Text(
                                'Active Appointments: ' +
                                    doctor.appointments.toString(),
                                style: TextStyle(
                                  fontFamily: FONT_FAMILY_PRIMARY,
                                  fontSize: 17,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Row(
                    children: <Widget>[MakeAppointmentForm()],
                  ),
                ],
              ),
            ),
          ),
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
                  padding: EdgeInsets.only(top: 40, left: 70),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Row(
                      children: <Widget>[
                        Image.asset(
                          'assets/images/search_doctor.png',
                          scale: 14,
                        ),
                        Text(
                          'Make Your Appointment',
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
