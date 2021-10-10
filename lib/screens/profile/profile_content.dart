import 'package:dialog_doc990_mobile/components/common/rounded_button.dart';
import 'package:dialog_doc990_mobile/constants.dart';
import 'package:dialog_doc990_mobile/models/appointment_model.dart';
import 'package:dialog_doc990_mobile/providers/appointment_provider.dart';
import 'package:dialog_doc990_mobile/screens/appointments/appointment_content.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileContent extends StatefulWidget {
  @override
  _ProfileContentState createState() => _ProfileContentState();
}

class _ProfileContentState extends State<ProfileContent> {
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
          Row(
            // Profile information
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      ClipOval(
                        child: Image.network(
                          'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
                          width: 130,
                          height: 130,
                          fit: BoxFit.cover,
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Row(
                      children: <Widget>[
                        Text(
                          'Nimal Perera',
                          style: TextStyle(
                            fontFamily: FONT_FAMILY_PRIMARY,
                            fontSize: 22,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        'nimalperera@gmail.com',
                        style: TextStyle(
                          fontFamily: FONT_FAMILY_PRIMARY,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        '0775545454',
                        style: TextStyle(
                          fontFamily: FONT_FAMILY_PRIMARY,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    // Appointments
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: RoundedButton(
                          color: Color(COLOR_PRIMARY),
                          fontSize: 15,
                          height: 50,
                          text: 'EDIT MY PROFILE',
                          textColor: Colors.white,
                          action: () {
                            print('clicked');
                          },
                          width: size.width * 0.9,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
          SingleChildScrollView(
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
                                    hospitalName:
                                        snapshot.data[index].hospitalName,
                                    specilization:
                                        snapshot.data[index].specialization,
                                    date: snapshot.data[index].date,
                                    time: snapshot.data[index].time,
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
          ),
        ],
      ),
    );
  }
}
