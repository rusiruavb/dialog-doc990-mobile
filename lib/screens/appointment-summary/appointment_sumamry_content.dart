import 'package:dialog_doc990_mobile/components/common/rounded_button.dart';
import 'package:dialog_doc990_mobile/components/common/rounded_input_field.dart';
import 'package:dialog_doc990_mobile/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppointmentSummaryContent extends StatefulWidget {
  @override
  _AppointmentSummaryContentState createState() =>
      _AppointmentSummaryContentState();
}

/// Code searching keywords: (Use keywords below to go through the codebase)
/// Doctor Charge Section :- "doctor charge information"
/// Appointment Summary Info :- "channel summary data"
/// Coupon Code section :- "coupon code section"
class _AppointmentSummaryContentState extends State<AppointmentSummaryContent> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 15, right: 15),
                child: Text(
                  'Appointment Information',
                  style: TextStyle(
                    fontFamily: FONT_FAMILY_PRIMARY,
                    fontSize: 22,
                  ),
                ),
              ),
            ],
          ),
          Row(
            // Warning card
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(left: 13, right: 13),
                width: size.width,
                child: Card(
                  color: Color(COLOR_YELLOW),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Your appointment is still NOT ACTIVE. Please click "Next" to pay & confirm.',
                    ),
                  ),
                ),
              )
            ],
          ),
          Row(
            // This is for preview channel summary data
            children: <Widget>[
              Container(
                width: size.width,
                padding: EdgeInsets.only(left: 13, right: 13, top: 8),
                child: Card(
                  color: Color(COLOR_SECONDARY),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 5, bottom: 5, top: 5),
                          child: Row(
                            // Reference No.
                            children: <Widget>[
                              Icon(
                                Icons.receipt,
                                size: 18,
                              ),
                              Text(
                                'Reference No: ',
                                style: TextStyle(
                                  fontFamily: FONT_FAMILY_PRIMARY,
                                  fontSize: 17,
                                ),
                              ),
                              Text(
                                '23423443',
                                style: TextStyle(
                                  fontFamily: FONT_FAMILY_PRIMARY,
                                  fontSize: 17,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 5, bottom: 5),
                          child: Row(
                            // Patient Name
                            children: <Widget>[
                              Icon(
                                Icons.person,
                                size: 18,
                              ),
                              Text(
                                "Patient's Name: ",
                                style: TextStyle(
                                  fontFamily: FONT_FAMILY_PRIMARY,
                                  fontSize: 17,
                                ),
                              ),
                              Text(
                                'Rusiru Bandara',
                                style: TextStyle(
                                  fontFamily: FONT_FAMILY_PRIMARY,
                                  fontSize: 17,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 5, bottom: 5),
                          child: Row(
                            // Phone Number
                            children: <Widget>[
                              Icon(
                                Icons.phone,
                                size: 18,
                              ),
                              Text(
                                'Phone Number: ',
                                style: TextStyle(
                                  fontFamily: FONT_FAMILY_PRIMARY,
                                  fontSize: 17,
                                ),
                              ),
                              Text(
                                '0776632436',
                                style: TextStyle(
                                  fontFamily: FONT_FAMILY_PRIMARY,
                                  fontSize: 17,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 5, bottom: 5),
                          child: Row(
                            // NIC
                            children: <Widget>[
                              Icon(
                                Icons.credit_card,
                                size: 18,
                              ),
                              Text(
                                'NIC: ',
                                style: TextStyle(
                                  fontFamily: FONT_FAMILY_PRIMARY,
                                  fontSize: 17,
                                ),
                              ),
                              Text(
                                '983343545V',
                                style: TextStyle(
                                  fontFamily: FONT_FAMILY_PRIMARY,
                                  fontSize: 17,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 5, bottom: 5),
                          child: Row(
                            // email
                            children: <Widget>[
                              Icon(
                                Icons.email,
                                size: 18,
                              ),
                              Text(
                                'Email: ',
                                style: TextStyle(
                                  fontFamily: FONT_FAMILY_PRIMARY,
                                  fontSize: 17,
                                ),
                              ),
                              Text(
                                'rusiru@gmail.com',
                                style: TextStyle(
                                  fontFamily: FONT_FAMILY_PRIMARY,
                                  fontSize: 17,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 5, bottom: 5),
                          child: Row(
                            // Hospital
                            children: <Widget>[
                              Icon(
                                Icons.medication,
                                size: 18,
                              ),
                              Text(
                                'Hospital: ',
                                style: TextStyle(
                                  fontFamily: FONT_FAMILY_PRIMARY,
                                  fontSize: 17,
                                ),
                              ),
                              Text(
                                'Asiri Hospital - Maharagama',
                                style: TextStyle(
                                  fontFamily: FONT_FAMILY_PRIMARY,
                                  fontSize: 17,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 5, bottom: 5),
                          child: Row(
                            // Room
                            children: <Widget>[
                              Icon(
                                Icons.location_on,
                                size: 18,
                              ),
                              Text(
                                'Room: ',
                                style: TextStyle(
                                  fontFamily: FONT_FAMILY_PRIMARY,
                                  fontSize: 17,
                                ),
                              ),
                              Text(
                                '112',
                                style: TextStyle(
                                  fontFamily: FONT_FAMILY_PRIMARY,
                                  fontSize: 17,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 5, bottom: 2),
                          child: Row(
                            // Time & Date
                            children: <Widget>[
                              Icon(
                                Icons.lock_clock,
                                size: 18,
                              ),
                              Text(
                                'Date & Time: ',
                                style: TextStyle(
                                  fontFamily: FONT_FAMILY_PRIMARY,
                                  fontSize: 17,
                                ),
                              ),
                              Text(
                                '10-05-2021 @ 12.30 PM',
                                style: TextStyle(
                                  fontFamily: FONT_FAMILY_PRIMARY,
                                  fontSize: 17,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            // This is for doctor charge information
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(left: 13, right: 13, top: 8),
                width: size.width,
                child: Card(
                  color: Color(COLOR_SECONDARY),
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 5, bottom: 5, top: 5),
                          child: Row(
                            // Reference No.
                            children: <Widget>[
                              Icon(
                                Icons.attach_money,
                                size: 18,
                              ),
                              Text(
                                'Doctor Charge: ',
                                style: TextStyle(
                                  fontFamily: FONT_FAMILY_PRIMARY,
                                  fontSize: 17,
                                ),
                              ),
                              Text(
                                'LKR 1000.00',
                                style: TextStyle(
                                  fontFamily: FONT_FAMILY_PRIMARY,
                                  fontSize: 17,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 5, bottom: 5, top: 5),
                          child: Row(
                            // Reference No.
                            children: <Widget>[
                              Icon(
                                Icons.attach_money,
                                size: 18,
                              ),
                              Text(
                                'Hospitl Charge: ',
                                style: TextStyle(
                                  fontFamily: FONT_FAMILY_PRIMARY,
                                  fontSize: 17,
                                ),
                              ),
                              Text(
                                'LKR 300.00',
                                style: TextStyle(
                                  fontFamily: FONT_FAMILY_PRIMARY,
                                  fontSize: 17,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 5, bottom: 5, top: 5),
                          child: Row(
                            // Reference No.
                            children: <Widget>[
                              Icon(
                                Icons.attach_money,
                                size: 18,
                              ),
                              Text(
                                'Refund Charge: ',
                                style: TextStyle(
                                  fontFamily: FONT_FAMILY_PRIMARY,
                                  fontSize: 17,
                                ),
                              ),
                              Text(
                                'LKR 250.00',
                                style: TextStyle(
                                  fontFamily: FONT_FAMILY_PRIMARY,
                                  fontSize: 17,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 5, bottom: 5, top: 5),
                          child: Row(
                            // Reference No.
                            children: <Widget>[
                              Icon(
                                Icons.attach_money,
                                size: 18,
                              ),
                              Text(
                                'Booking Charge: ',
                                style: TextStyle(
                                  fontFamily: FONT_FAMILY_PRIMARY,
                                  fontSize: 17,
                                ),
                              ),
                              Text(
                                'LKR 99.00',
                                style: TextStyle(
                                  fontFamily: FONT_FAMILY_PRIMARY,
                                  fontSize: 17,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 5, bottom: 5, top: 5),
                          child: Row(
                            // Reference No.
                            children: <Widget>[
                              Icon(
                                Icons.attach_money,
                                size: 18,
                              ),
                              Text(
                                'Total: ',
                                style: TextStyle(
                                  fontFamily: FONT_FAMILY_PRIMARY,
                                  fontSize: 17,
                                ),
                              ),
                              Text(
                                'LKR 1349.00',
                                style: TextStyle(
                                  fontFamily: FONT_FAMILY_PRIMARY,
                                  fontSize: 17,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
          Column(
            // Enter coupon code section
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 20),
                child: Row(
                  children: <Widget>[
                    Text(
                      'Do you have a ',
                      style: TextStyle(
                        fontFamily: FONT_FAMILY_PRIMARY,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      'Coupon Code ?',
                      style: TextStyle(
                        fontFamily: FONT_FAMILY_PRIMARY,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      'Enter below & click "Redeem"',
                      style: TextStyle(
                        fontFamily: FONT_FAMILY_PRIMARY,
                        fontSize: 13,
                        color: Colors.grey,
                      ),
                    ),
                  )
                ],
              ),
              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: RoundedTextFeild(
                      isNumber: false,
                      isPassword: false,
                      isPhoneNumber: false,
                      isRequiredFeild: false,
                      text: '',
                      onChange: (value) {
                        print(value);
                      },
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20, left: 20),
                child: Row(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        height: 50,
                        width: size.width * 0.898,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: FlatButton(
                            padding: EdgeInsets.symmetric(
                                vertical: 17.5, horizontal: 22),
                            color: Color(COLOR_PRIMARY),
                            onPressed: () {
                              print('object');
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    'REDEEM',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: SF_PRO_FONT,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w100,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 15, bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        RoundedButton(
                          action: () {
                            Navigator.pushNamedAndRemoveUntil(
                                context, '/home', (route) => false);
                          },
                          color: Color(COLOR_SECONDARY),
                          fontSize: 15,
                          height: 50,
                          width: size.width * 0.4,
                          text: 'CANCEL',
                          textColor: Colors.black,
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 35),
                          child: RoundedButton(
                            action: () {
                              print('object');
                            },
                            color: Color(COLOR_PRIMARY),
                            fontSize: 15,
                            height: 50,
                            width: size.width * 0.4,
                            text: 'SUBMIT',
                            textColor: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
