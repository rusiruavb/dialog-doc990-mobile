import 'package:dialog_doc990_mobile/components/common/rounded_button.dart';
import 'package:dialog_doc990_mobile/constants.dart';
import 'package:dialog_doc990_mobile/models/appointment_model.dart';
import 'package:dialog_doc990_mobile/models/user_model.dart';
import 'package:dialog_doc990_mobile/providers/appointment_provider.dart';
import 'package:dialog_doc990_mobile/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileContent extends StatefulWidget {
  @override
  _ProfileContentState createState() => _ProfileContentState();
}

class _ProfileContentState extends State<ProfileContent> {
  Future<List<AppointmentModel>> appointments;
  Future<UserModel> userProfile;

  @override
  void initState() {
    super.initState();
    appointments = context.read<AppointmentProvider>().getUserAppointments();
    userProfile = context.read<UserProvider>().getUserProfile();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return FutureBuilder<UserModel>(
      future: userProfile,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
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
                                snapshot.data.imageUrl,
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
                                snapshot.data.name,
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
                              snapshot.data.email,
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
                              snapshot.data.phoneNumber,
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
                              snapshot.data.nic,
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
                              snapshot.data.country,
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
              ],
            ),
          );
        } else if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        }
        return Text('');
      },
    );
  }
}
