import 'package:dialog_doc990_mobile/components/rounded_button.dart';
import 'package:dialog_doc990_mobile/components/rounded_input_field.dart';
import 'package:dialog_doc990_mobile/constants.dart';
import 'package:dialog_doc990_mobile/screen_keys.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  String phoneNumber;
  String password;
  GlobalKey<FormState> _formKey =
      GlobalKey<FormState>(debugLabel: '_loginFormKey');
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
      key: WidgetKeys.loginFormKey,
      height: size.height * 0.5,
      width: size.width,
      child: Padding(
        padding: EdgeInsets.only(top: 30, left: 25, right: 25),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              RoundedTextFeild(
                isRequiredFeild: true,
                isPassword: false,
                isNumber: true,
                isPhoneNumber: true,
                text: 'Phone Number',
                icon: Icons.phone,
                onChange: (text) {
                  phoneNumber = text;
                },
              ),
              RoundedTextFeild(
                isRequiredFeild: true,
                isPassword: true,
                isNumber: false,
                isPhoneNumber: false,
                icon: Icons.password,
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
                  width: size.width,
                  icon: Icons.near_me,
                ),
              ),
              SizedBox(
                height: size.height * 0.025,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Create new Account?',
                    style: TextStyle(
                      fontFamily: FONT_FAMILY_PRIMARY,
                      fontSize: 16,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/signup');
                    },
                    child: Text(
                      ' Sign Up',
                      style: TextStyle(
                        fontFamily: FONT_FAMILY_PRIMARY,
                        fontSize: 16,
                        color: Color(COLOR_PRIMARY),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: size.height * 0.010,
              ),
              Align(
                child: Text(
                  'Forgot Password?',
                  style: TextStyle(
                    fontFamily: FONT_FAMILY_PRIMARY,
                    fontSize: 16,
                  ),
                ),
                alignment: Alignment.center,
              )
            ],
          ),
        ),
      ),
    );
  }
}
