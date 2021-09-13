import 'package:dialog_doc990_mobile/components/rounded_button.dart';
import 'package:dialog_doc990_mobile/components/underline_dropdown_feild.dart';
import 'package:dialog_doc990_mobile/components/underline_input_feild.dart';
import 'package:flutter/material.dart';

class SeachDoctorFormScreen extends StatefulWidget {
  @override
  _SeachDoctorFormScreenState createState() => _SeachDoctorFormScreenState();
}

class _SeachDoctorFormScreenState extends State<SeachDoctorFormScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      height: size.height * 0.9,
      child: OrientationBuilder(
        builder: (context, orientation) => orientation == Orientation.portrait
            ? buildPortrait(context)
            : buildLandscape(context),
      ),
    );
  }
}

Widget buildPortrait(context) {
  String doctorName;
  String hospital;
  final size = MediaQuery.of(context).size;
  return Align(
    alignment: Alignment.topCenter,
    child: Card(
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.white70, width: 1),
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 0,
      child: Container(
        width: size.width * 0.9,
        height: size.height * 0.47,
        child: Stack(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(15),
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(bottom: 0),
                    child: UnderLineTextFeild(
                      onChange: (value) {
                        print(value);
                      },
                      iconText: '👨‍⚕️',
                      text: 'Doctor - Max 20 Characters',
                    ),
                  ),
                  Container(
                    child: UnderLineDropDownFeild(
                      isHospital: true,
                      isSpecialization: false,
                      text: 'Any Hospital',
                      iconText: '🏥',
                      onChange: (value) {
                        print(value);
                      },
                    ),
                  ),
                  Container(
                    child: UnderLineDropDownFeild(
                      isHospital: false,
                      isSpecialization: true,
                      text: 'Any Specialization',
                      iconText: '🥼',
                      onChange: (value) {
                        print(value);
                      },
                    ),
                  ),
                  Container(
                    child: UnderLineTextFeild(
                      iconText: '👨‍⚕️',
                      text: 'Doctor - Max 20 Characters',
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.030,
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: RoundedButton(
                      text: 'SEARCH',
                      height: size.height * 0.073,
                      width: size.width * 0.31,
                      action: () => {print('object')},
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    ),
  );
}

Widget buildLandscape(context) {
  final size = MediaQuery.of(context).size;
  return Align(
    alignment: Alignment.topCenter,
    child: Card(
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.white70, width: 1),
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 0,
      child: Container(
        width: size.width * 0.95,
        height: size.height * 0.95,
        child: Stack(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(15),
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(bottom: 12),
                    child: UnderLineTextFeild(
                      iconText: '👨‍⚕️',
                      text: 'Doctor - Max 20 Characters',
                    ),
                  ),
                  Container(
                    child: UnderLineDropDownFeild(
                      isHospital: true,
                      text: 'Any Hospital',
                      iconText: '🏥',
                      onChange: (value) {
                        print(value);
                      },
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(bottom: 10),
                    child: UnderLineDropDownFeild(
                      isHospital: true,
                      text: 'Any Hospital',
                      iconText: '🏥',
                      onChange: (value) {
                        print(value);
                      },
                    ),
                  ),
                  Container(
                    child: UnderLineTextFeild(
                      iconText: '👨‍⚕️',
                      text: 'Doctor - Max 20 Characters',
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.030,
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: RoundedButton(
                      text: 'SEARCH',
                      height: size.height * 0.14,
                      width: size.width * 0.16,
                      action: () => {print('object')},
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    ),
  );
}
