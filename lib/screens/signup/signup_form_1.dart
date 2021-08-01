import 'package:dialog_doc990_mobile/components/rounded_button.dart';
import 'package:dialog_doc990_mobile/components/rounded_dropdown_feild.dart';
import 'package:dialog_doc990_mobile/components/rounded_input_field.dart';
import 'package:flutter/material.dart';

class SignUpForm1 extends StatefulWidget {
  @override
  _SignUpForm1State createState() => _SignUpForm1State();
}

class _SignUpForm1State extends State<SignUpForm1> {
  String phoneNumber;
  String password;
  final _formKey = GlobalKey<FormState>();
  _SignUpForm1State({
    this.phoneNumber,
    this.password,
  });

  void submitForm() {
    if (_formKey.currentState.validate()) {
      print('Sign Up clicked ' + phoneNumber + ' ' + password);
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.5,
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
                'Sign Up',
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
                isRequiredFeild: false,
                onChange: (text) {
                  print('this is test');
                },
              ),
              RoundedTextFeild(
                isRequiredFeild: true,
                isPassword: true,
                isNumber: false,
                isPhoneNumber: false,
                text: 'Password',
                onChange: (text) {
                  password = text;
                },
              ),
              SizedBox(
                height: size.height * 0.010,
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: RoundedButton(
                  text: 'SIGN UP',
                  action: submitForm,
                  height: size.height * 0.072,
                  width: size.width * 0.39,
                  icon: Icons.near_me,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
