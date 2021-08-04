import 'package:dialog_doc990_mobile/components/rounded_button.dart';
import 'package:dialog_doc990_mobile/components/rounded_input_field.dart';
import 'package:dialog_doc990_mobile/screen_keys.dart';
import 'package:dialog_doc990_mobile/screens/signup/signup_screen_2.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class SignUpForm1 extends StatefulWidget {
  @override
  _SignUpForm1State createState() => _SignUpForm1State();
}

class _SignUpForm1State extends State<SignUpForm1> {
  String phoneNumber;
  String emailAddress;
  GlobalKey<FormState> _signUpFrom1Key =
      GlobalKey<FormState>(debugLabel: '_signFrom1Key');
  _SignUpForm1State({
    this.phoneNumber,
    this.emailAddress,
  });

  void submitAndNavigateTo2ndScreen() {
    if (_signUpFrom1Key.currentState.validate() &&
        phoneNumber != null &&
        phoneNumber != null) {
      Navigator.push(
        context,
        PageTransition(
          child: SignUpScreen2(),
          type: PageTransitionType.rightToLeft,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      key: WidgetKeys.signUpForm1Key,
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
          key: _signUpFrom1Key,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Contact Info',
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
                isNumber: false,
                isPhoneNumber: false,
                text: 'Email Address',
                onChange: (text) {
                  emailAddress = text;
                },
              ),
              RoundedTextFeild(
                isRequiredFeild: true,
                isPassword: false,
                isNumber: true,
                isPhoneNumber: true,
                text: 'Your Phone Number',
                onChange: (text) {
                  phoneNumber = text;
                },
              ),
              SizedBox(
                height: size.height * 0.010,
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: RoundedButton(
                  text: 'NEXT',
                  action: submitAndNavigateTo2ndScreen,
                  height: size.height * 0.072,
                  width: size.width * 0.34,
                  icon: Icons.arrow_forward,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
