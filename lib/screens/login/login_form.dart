import 'package:dialog_doc990_mobile/components/rounded_button.dart';
import 'package:dialog_doc990_mobile/components/rounded_input_field.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  String phoneNumber;
  String password;
  final _formKey = GlobalKey<FormState>();
  _LoginFormState({
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
              RoundedTextFeild(
                isRequiredFeild: true,
                isPassword: false,
                isNumber: true,
                isPhoneNumber: true,
                text: 'Phone Number',
                onChange: (text) {
                  phoneNumber = text;
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
