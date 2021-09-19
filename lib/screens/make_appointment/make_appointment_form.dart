import 'package:dialog_doc990_mobile/components/common/rounded_button.dart';
import 'package:dialog_doc990_mobile/components/common/rounded_dropdown_feild.dart';
import 'package:dialog_doc990_mobile/components/common/rounded_input_field.dart';
import 'package:dialog_doc990_mobile/components/make_appointment/province_select_dropdown.dart';
import 'package:dialog_doc990_mobile/components/make_appointment/time_select_dropdown.dart';
import 'package:dialog_doc990_mobile/constants.dart';
import 'package:dialog_doc990_mobile/providers/appointment_provider.dart';
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
      var appointment = {
        'time': provider.getTime(),
        'title': provider.getTitle(),
        'name': provider.getName(),
        'email': provider.getEmail(),
        'address': provider.getAddress(),
        'phoneNumber': provider.getPhoneNumber(),
        'nic': provider.getNIC(),
        'city': provider.getCity(),
        'province': provider.getProvince(),
        'isChargeChecked': provider.getChargeCheck(),
        'isPDFChecked': provider.getPDFCheck(),
      };

      // call send data to backend function
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
                    provider.setTime(value);
                  },
                  value: provider.getTime(),
                ),
                RoundedDropDownFeild(
                  isRequiredFeild: true,
                  isCountry: false,
                  text: 'Your Title',
                  value: provider.getTitle(),
                  onChange: (value) {
                    provider.setTitle(value);
                  },
                ),
                RoundedTextFeild(
                  isRequiredFeild: true,
                  isPassword: false,
                  isNumber: false,
                  icon: Icons.person,
                  isPhoneNumber: false,
                  value: provider.getName(),
                  text: 'Your Name',
                  onChange: (name) {
                    provider.setName(name);
                  },
                ),
                RoundedTextFeild(
                  isRequiredFeild: true,
                  isPassword: false,
                  isNumber: false,
                  icon: Icons.email,
                  isPhoneNumber: false,
                  value: provider.getEmail(),
                  text: 'Email Address',
                  onChange: (email) {
                    provider.setEmail(email);
                  },
                ),
                RoundedTextFeild(
                  isRequiredFeild: true,
                  isPassword: false,
                  isNumber: false,
                  icon: Icons.phone,
                  isPhoneNumber: true,
                  value: provider.getPhoneNumber(),
                  text: 'Phone Number',
                  onChange: (phoneNumber) {
                    provider.setPhoneNumber(phoneNumber);
                  },
                ),
                RoundedTextFeild(
                  isRequiredFeild: true,
                  isPassword: false,
                  isNumber: false,
                  icon: Icons.credit_card,
                  isPhoneNumber: false,
                  value: provider.getNIC(),
                  text: 'NIC/ Passport Number',
                  onChange: (nic) {
                    provider.setNIC(nic);
                  },
                ),
                RoundedTextFeild(
                  isRequiredFeild: true,
                  isPassword: false,
                  isNumber: false,
                  icon: Icons.home,
                  isPhoneNumber: false,
                  value: provider.getAddress(),
                  text: 'Address',
                  onChange: (address) {
                    provider.setAddress(address);
                  },
                ),
                RoundedTextFeild(
                  isRequiredFeild: true,
                  isPassword: false,
                  isNumber: false,
                  icon: Icons.location_city,
                  isPhoneNumber: false,
                  value: provider.getCity(),
                  text: 'City',
                  onChange: (city) {
                    provider.setCity(city);
                  },
                ),
                ProvinceDropdown(
                  isRequiredFeild: true,
                  text: 'Province',
                  value: provider.getProvince(),
                  onChange: (value) {
                    provider.setProvince(value);
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Checkbox(
                      checkColor: Colors.white,
                      fillColor: MaterialStateProperty.resolveWith(getColor),
                      value: provider.getChargeCheck(),
                      onChanged: (value) {
                        setState(() {
                          _isAdditionalChargeChecked =
                              !_isAdditionalChargeChecked;
                        });
                        provider.setChargeCheck(_isAdditionalChargeChecked);
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
                      value: provider.getPDFCheck(),
                      onChanged: (value) {
                        setState(() {
                          _isPDFChecked = !_isPDFChecked;
                        });
                        provider.setPDFCheck(_isPDFChecked);
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
