import 'package:dialog_doc990_mobile/components/common/rounded_button.dart';
import 'package:dialog_doc990_mobile/components/common/rounded_dropdown_feild.dart';
import 'package:dialog_doc990_mobile/components/common/rounded_input_field.dart';
import 'package:dialog_doc990_mobile/components/make_appointment/province_select_dropdown.dart';
import 'package:dialog_doc990_mobile/components/make_appointment/time_select_dropdown.dart';
import 'package:dialog_doc990_mobile/constants.dart';
import 'package:dialog_doc990_mobile/providers/appointment_provider.dart';
import 'package:dialog_doc990_mobile/providers/search_doctor_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MakeAppointmentForm extends StatefulWidget {
  @override
  _MakeAppintmentFormState createState() => _MakeAppintmentFormState();
}

class _MakeAppintmentFormState extends State<MakeAppointmentForm> {
  GlobalKey<FormState> _appointmentFormKey =
      GlobalKey<FormState>(debugLabel: '_appointmentFormKey');
  bool _isAdditionalChargeChecked = false;
  bool _isPDFChecked = false;

  void validateFormAndSubmit() {
    if (_appointmentFormKey.currentState.validate()) {
      final provider = context.read<AppointmentProvider>();
      final doctor = context.read<SearchDoctorProvider>().getSelectedDoctor();
      provider.hospitalName = doctor.availableDetails[0].hospitalName;
      provider.date = doctor.availableDetails[0].dateTime;
      provider.doctorCharge =
          doctor.availableDetails[0].doctorCharge.toDouble();
      var appointment = {
        'time': provider.selectTime,
        'name': provider.patientTitle.split(' ')[1] + provider.patientName,
        'email': provider.email,
        'address': provider.address,
        'phoneNumber': provider.phoneNumber,
        'nic': provider.nic,
        'city': provider.city,
        'province': provider.province,
        'isChargeChecked': provider.isServiceChargeChecked,
        'isPDFChecked': provider.isPDFReceiptChecked,
        'referenceNo': provider.generateReferenceNo(),
        'hospitalName': provider.hospitalName,
        'date': provider.date,
      }; // call send data to backend function
      print(appointment);
      Navigator.pushNamed(context, '/appointment-summary');
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final provider = context.read<AppointmentProvider>();

    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return Color(COLOR_PRIMARY);
    }

    return SingleChildScrollView(
      child: Container(
        width: size.width,
        child: Padding(
          padding: EdgeInsets.only(
            top: 30,
            left: 25,
            right: 25,
          ),
          child: Form(
            key: _appointmentFormKey,
            child: Column(
              children: <Widget>[
                SelectTimeDropdown(
                  isRequiredFeild: true,
                  text: 'Select Appointment Time',
                  onChange: (value) {
                    provider.selectTime = value;
                  },
                  value: provider.selectTime,
                ),
                RoundedDropDownFeild(
                  isRequiredFeild: true,
                  isCountry: false,
                  text: 'Your Title',
                  value: provider.patientTitle,
                  onChange: (value) {
                    provider.patientTitle = value;
                  },
                ),
                RoundedTextFeild(
                  isRequiredFeild: true,
                  isPassword: false,
                  isNumber: false,
                  icon: Icons.person,
                  isPhoneNumber: false,
                  value: provider.patientName,
                  text: 'Your Name',
                  onChange: (name) {
                    provider.patientName = name;
                  },
                ),
                RoundedTextFeild(
                  isRequiredFeild: true,
                  isPassword: false,
                  isNumber: false,
                  icon: Icons.email,
                  isPhoneNumber: false,
                  value: provider.email,
                  text: 'Email Address',
                  onChange: (email) {
                    provider.email = email;
                  },
                ),
                RoundedTextFeild(
                  isRequiredFeild: true,
                  isPassword: false,
                  isNumber: true,
                  icon: Icons.phone,
                  isPhoneNumber: true,
                  value: provider.phoneNumber,
                  text: 'Phone Number',
                  onChange: (phoneNumber) {
                    provider.phoneNumber = phoneNumber;
                  },
                ),
                RoundedTextFeild(
                  isRequiredFeild: true,
                  isPassword: false,
                  isNumber: false,
                  icon: Icons.credit_card,
                  isPhoneNumber: false,
                  value: provider.nic,
                  text: 'NIC/ Passport Number',
                  onChange: (nic) {
                    provider.nic = nic;
                  },
                ),
                RoundedTextFeild(
                  isRequiredFeild: true,
                  isPassword: false,
                  isNumber: false,
                  icon: Icons.home,
                  isPhoneNumber: false,
                  value: provider.address,
                  text: 'Address',
                  onChange: (address) {
                    provider.address = address;
                  },
                ),
                RoundedTextFeild(
                  isRequiredFeild: true,
                  isPassword: false,
                  isNumber: false,
                  icon: Icons.location_city,
                  isPhoneNumber: false,
                  value: provider.city,
                  text: 'City',
                  onChange: (city) {
                    provider.city = city;
                  },
                ),
                ProvinceDropdown(
                  isRequiredFeild: true,
                  text: 'Province',
                  value: provider.province,
                  onChange: (value) {
                    provider.province = value;
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Checkbox(
                      checkColor: Colors.white,
                      fillColor: MaterialStateProperty.resolveWith(getColor),
                      value: provider.isServiceChargeChecked,
                      onChanged: (value) {
                        setState(() {
                          _isAdditionalChargeChecked =
                              !_isAdditionalChargeChecked;
                        });
                        provider.isServiceChargeChecked =
                            _isAdditionalChargeChecked;
                      },
                    ),
                    Text(
                      'Add Additional Service Charge: 250.00 LKR',
                      style: TextStyle(
                        fontFamily: FONT_FAMILY_PRIMARY,
                      ),
                    )
                  ],
                ),
                Row(
                  children: <Widget>[
                    Checkbox(
                      checkColor: Colors.white,
                      fillColor: MaterialStateProperty.resolveWith(getColor),
                      value: provider.isPDFReceiptChecked,
                      onChanged: (value) {
                        setState(() {
                          _isPDFChecked = !_isPDFChecked;
                        });
                        provider.isPDFReceiptChecked = _isPDFChecked;
                      },
                    ),
                    SizedBox(
                      width: size.width * 0.75,
                      child: Text(
                        'Check the box if you want to receive PDF receipt to your email.',
                        style: TextStyle(
                          fontFamily: FONT_FAMILY_PRIMARY,
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                RoundedButton(
                  text: 'CONTINUE',
                  color: Color(COLOR_PRIMARY),
                  textColor: Colors.white,
                  action: validateFormAndSubmit,
                  height: 50,
                  fontSize: 15,
                  width: size.width,
                  icon: Icons.send,
                  iconSize: 17,
                ),
                SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
