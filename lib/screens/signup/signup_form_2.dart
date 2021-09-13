import 'package:dialog_doc990_mobile/components/rounded_button.dart';
import 'package:dialog_doc990_mobile/components/rounded_dropdown_feild.dart';
import 'package:dialog_doc990_mobile/components/rounded_input_field.dart';
import 'package:dialog_doc990_mobile/constants.dart';
import 'package:dialog_doc990_mobile/screen_keys.dart';
import 'package:flutter/material.dart';

class SignUpForm2 extends StatefulWidget {
  @override
  _SignUpForm2State createState() => _SignUpForm2State();
}

class _SignUpForm2State extends State<SignUpForm2> {
  String title;
  String name;
  String country;
  String nic;
  String password;
  GlobalKey<FormState> _signUpForm2Key =
      GlobalKey<FormState>(debugLabel: '_signFrom2Key');

  _SignUpForm2State({
    this.title,
    this.name,
    this.country,
    this.nic,
    this.password,
  });

  void validateAndSubmitForm() {
    if (_signUpForm2Key.currentState.validate()) {
      print('Form validated');
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      key: WidgetKeys.signUpForm2Key,
      height: size.height * 2,
      width: size.width,
      child: Padding(
        padding: EdgeInsets.only(
          top: 0,
          left: 25,
          right: 25,
        ),
        child: Form(
          key: _signUpForm2Key,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Personal Info',
                style: TextStyle(
                  fontFamily: FONT_FAMILY_SECONDARY,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.left,
              ),
              SizedBox(
                height: size.height * 0.025,
              ),
              RoundedDropDownFeild(
                text: 'Your Country',
                isCountry: true,
                isRequiredFeild: true,
                onChange: (value) {
                  print('Country ' + value);
                },
              ),
              RoundedDropDownFeild(
                isRequiredFeild: true,
                isCountry: false,
                text: 'Your Title',
                onChange: (value) {
                  print('Title ' + value);
                },
              ),
              RoundedTextFeild(
                isRequiredFeild: true,
                isPassword: false,
                isNumber: false,
                icon: Icons.phone,
                isPhoneNumber: false,
                text: 'Your Name',
                onChange: (text) {
                  print(text);
                },
              ),
              RoundedTextFeild(
                isRequiredFeild: true,
                isPassword: false,
                isNumber: true,
                icon: Icons.credit_card,
                isPhoneNumber: false,
                text: 'NIC/ Passport Number',
                onChange: (text) {
                  print(text);
                },
              ),
              RoundedTextFeild(
                isRequiredFeild: true,
                isPassword: true,
                isNumber: false,
                icon: Icons.password,
                isPhoneNumber: false,
                text: 'Password',
                onChange: (text) {
                  print(text);
                },
              ),
              SizedBox(
                height: size.height * 0.010,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'By clicking "Register", I agree to the',
                    style: TextStyle(
                      fontFamily: FONT_FAMILY_PRIMARY,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Terms',
                    style: TextStyle(
                      fontFamily: FONT_FAMILY_PRIMARY,
                      fontSize: 15,
                      color: Color(COLOR_PRIMARY),
                    ),
                  ),
                  Text(
                    ' and ',
                    style: TextStyle(
                      fontFamily: FONT_FAMILY_PRIMARY,
                      fontSize: 15,
                    ),
                  ),
                  Text(
                    'Conditions',
                    style: TextStyle(
                      fontFamily: FONT_FAMILY_PRIMARY,
                      fontSize: 15,
                      color: Color(COLOR_PRIMARY),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.025,
              ),
              RoundedButton(
                text: 'SUBMIT',
                action: validateAndSubmitForm,
                height: size.height * 0.072,
                width: size.width,
                icon: Icons.send,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
