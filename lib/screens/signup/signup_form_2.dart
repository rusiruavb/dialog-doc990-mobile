import 'package:dialog_doc990_mobile/components/rounded_button.dart';
import 'package:dialog_doc990_mobile/components/rounded_dropdown_feild.dart';
import 'package:dialog_doc990_mobile/components/rounded_input_field.dart';
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
  final _formKey = GlobalKey<FormState>();

  _SignUpForm2State({
    this.title,
    this.name,
    this.country,
    this.nic,
    this.password,
  });

  void validateAndSubmitForm() {
    if (_formKey.currentState.validate()) {
      print('Form validated');
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.92,
      width: size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(50.0), topLeft: Radius.circular(50.0)),
        color: Colors.white,
      ),
      child: Padding(
        padding: EdgeInsets.only(top: 30, left: 25, right: 25),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Personal Info',
                style: TextStyle(
                  fontFamily: 'Larsseit',
                  fontSize: 30,
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
                isPhoneNumber: false,
                text: 'Password',
                onChange: (text) {
                  print(text);
                },
              ),
              SizedBox(
                height: size.height * 0.010,
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: RoundedButton(
                  text: 'SUBMIT',
                  action: validateAndSubmitForm,
                  height: size.height * 0.072,
                  width: size.width * 0.4,
                  icon: Icons.send,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
