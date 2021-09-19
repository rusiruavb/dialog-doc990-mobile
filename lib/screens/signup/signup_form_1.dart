import 'package:dialog_doc990_mobile/components/common/rounded_button.dart';
import 'package:dialog_doc990_mobile/components/common/rounded_input_field.dart';
import 'package:dialog_doc990_mobile/constants.dart';
import 'package:dialog_doc990_mobile/providers/sign_up_provider.dart';
import 'package:dialog_doc990_mobile/screen_keys.dart';
import 'package:dialog_doc990_mobile/screens/signup/signup_screen_2.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class SignUpForm1 extends StatefulWidget {
  @override
  _SignUpForm1State createState() => _SignUpForm1State();
}

class _SignUpForm1State extends State<SignUpForm1> {
  GlobalKey<FormState> _signUpFrom1Key =
      GlobalKey<FormState>(debugLabel: '_signFrom1Key');

  void submitAndNavigateTo2ndScreen() {
    if (_signUpFrom1Key.currentState.validate() &&
        context.read<SignUpProvider>().getEmail() != '' &&
        context.read<SignUpProvider>().getPhoneNumber() != '') {
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
      height: size.height * 0.6,
      width: size.width,
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
                  fontFamily: FONT_FAMILY_SECONDARY,
                  fontSize: 25,
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
                icon: Icons.email,
                text: 'Email Address',
                value: context.read<SignUpProvider>().getEmail(),
                onChange: (text) {
                  context.read<SignUpProvider>().setEmail(text);
                },
              ),
              RoundedTextFeild(
                isRequiredFeild: true,
                isPassword: false,
                isNumber: true,
                isPhoneNumber: true,
                icon: Icons.phone,
                text: 'Your Phone Number',
                value: context.read<SignUpProvider>().getPhoneNumber(),
                onChange: (text) {
                  context.read<SignUpProvider>().setPhoneNumber(text);
                },
              ),
              SizedBox(
                height: size.height * 0.010,
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: RoundedButton(
                  text: 'CONTINUE',
                  color: Color(COLOR_PRIMARY),
                  textColor: Colors.white,
                  action: submitAndNavigateTo2ndScreen,
                  height: size.height * 0.072,
                  icon: Icons.navigate_next,
                  iconSize: 21,
                  fontSize: 15,
                  width: size.width,
                ),
              ),
              SizedBox(
                height: size.height * 0.025,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already registered?',
                    style: TextStyle(
                      fontFamily: FONT_FAMILY_PRIMARY,
                      fontSize: 16,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/login');
                    },
                    child: Text(
                      ' Sign In',
                      style: TextStyle(
                        fontFamily: FONT_FAMILY_PRIMARY,
                        fontSize: 16,
                        color: Color(COLOR_PRIMARY),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
