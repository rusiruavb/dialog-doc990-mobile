import 'dart:convert';

import 'package:dialog_doc990_mobile/api_endpoints.dart';
import 'package:dialog_doc990_mobile/components/common/rounded_button.dart';
import 'package:dialog_doc990_mobile/components/hospital_dropdown.dart';
import 'package:dialog_doc990_mobile/components/search_doctor/search_doctor_hospital.dart';
import 'package:dialog_doc990_mobile/components/search_doctor/search_doctor_name.dart';
import 'package:dialog_doc990_mobile/components/search_doctor/search_doctor_specialization.dart';
import 'package:dialog_doc990_mobile/components/specialization_dropdown.dart';
import 'package:dialog_doc990_mobile/components/search_doctor/search_doctor_datepicker.dart';
import 'package:dialog_doc990_mobile/components/underline_input_feild.dart';
import 'package:dialog_doc990_mobile/constants.dart';
import 'package:dialog_doc990_mobile/models/doctor_model.dart';
import 'package:dialog_doc990_mobile/providers/search_doctor_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SeachDoctorFormScreen extends StatefulWidget {
  @override
  _SeachDoctorFormScreenState createState() => _SeachDoctorFormScreenState();
}

class _SeachDoctorFormScreenState extends State<SeachDoctorFormScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    String doctorName = '';
    String hospitalName = '';
    String specilization = '';
    String selectedDate = '';

    void validateAndSubmit() {
      if (doctorName != '' ||
          hospitalName != '' ||
          specilization != '' ||
          selectedDate != '') {
        print(doctorName +
            ' ' +
            hospitalName +
            ' ' +
            specilization +
            ' ' +
            selectedDate);

        Provider.of<SearchDoctorProvider>(context, listen: false)
            .sendDotorSearchData(
                doctorName, specilization, selectedDate, hospitalName);
      } else {
        // display error message
      }
    }

    return Container(
      width: size.width,
      height: size.height * 0.62,
      child: Align(
        alignment: Alignment.topCenter,
        child: Card(
          shape: RoundedRectangleBorder(
            side: BorderSide(color: Colors.white70, width: 1),
            borderRadius: BorderRadius.circular(8),
          ),
          elevation: 3,
          child: Container(
            width: size.width * 0.9,
            child: Stack(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(15),
                  child: Column(
                    children: <Widget>[
                      Container(
                        child: SearchDoctorTextField(
                          isRequiredFeild: false,
                          onChange: (value) {
                            print(value);
                          },
                          text: 'Doctor - Max 20 Characters',
                          value: '',
                        ),
                      ),
                      Container(
                        child: SearchDoctorHospitalDrodown(
                          isRequiredFeild: false,
                          text: 'Select a hospital',
                          value: '',
                          onChange: (value) {
                            print(value);
                          },
                        ),
                      ),
                      Container(
                        child: SearchDoctorSpecializationDrodown(
                          isRequiredFeild: false,
                          text: 'Select Specialization',
                          value: '',
                          onChange: (value) {
                            print(value);
                          },
                        ),
                      ),
                      Container(
                        child: SearchDoctorDatePickerField(
                          text: 'Select the date',
                          onChange: (value) {
                            print(value);
                            selectedDate = value.toString();
                          },
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.030,
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: RoundedButton(
                          text: 'SEARCH',
                          color: Color(COLOR_PRIMARY),
                          textColor: Colors.white,
                          fontSize: 16,
                          height: 52,
                          width: size.width,
                          icon: Icons.search,
                          action: validateAndSubmit,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
