import 'package:dialog_doc990_mobile/constants.dart';
import 'package:dialog_doc990_mobile/models/doctor_model.dart';
import 'package:dialog_doc990_mobile/providers/search_doctor_provider.dart';
import 'package:dialog_doc990_mobile/screens/appointment-summary/appointment_sumamry_content.dart';
import 'package:dialog_doc990_mobile/screens/home/home_navigation_menu.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppointmentSummary extends StatefulWidget {
  @override
  _AppointmentSummaryState createState() => _AppointmentSummaryState();
}

class _AppointmentSummaryState extends State<AppointmentSummary> {
  Doctor doctor;
  final _scaffoldKey =
      GlobalKey<ScaffoldState>(debugLabel: 'appointmentSummaryScreenKey');

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
                            ClipRRect(
                              borderRadius: BorderRadius.circular(15),
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
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    doctor.availableDetails[0].hospitalName,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                    softWrap: false,
                                    style: TextStyle(
                                      fontFamily: FONT_FAMILY_PRIMARY,
                                      fontSize: 15,
                                    ),
                                  ),
                                ],
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
                    children: <Widget>[
                      AppointmentSummaryContent(),
                    ],
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
                          'Appointment Summary',
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
