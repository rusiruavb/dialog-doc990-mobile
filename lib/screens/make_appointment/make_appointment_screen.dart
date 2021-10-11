import 'package:dialog_doc990_mobile/constants.dart';
import 'package:dialog_doc990_mobile/models/doctor_model.dart';
import 'package:dialog_doc990_mobile/providers/search_doctor_provider.dart';
import 'package:dialog_doc990_mobile/providers/user_provider.dart';
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
    final provider = context.read<UserProvider>();

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
                                width: 90,
                                height: 90,
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
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50.0)),
                            ),
                          )
                        : Icon(
                            Icons.notes,
                            color: Colors.red,
                          ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 45, left: 50),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Row(
                      children: <Widget>[
                        Text(
                          'Make Your Appointment',
                          style: TextStyle(
                            fontFamily: 'Larsseit',
                            fontSize: 17,
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
