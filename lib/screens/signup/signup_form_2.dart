import 'package:dialog_doc990_mobile/components/common/rounded_gender_dropdown.dart';
import 'package:dialog_doc990_mobile/components/notification_api.dart';
import 'package:dialog_doc990_mobile/components/common/rounded_button.dart';
import 'package:dialog_doc990_mobile/components/common/rounded_dropdown_feild.dart';
import 'package:dialog_doc990_mobile/components/common/rounded_input_field.dart';
import 'package:dialog_doc990_mobile/components/common/rounded_loading_button.dart';
import 'package:dialog_doc990_mobile/constants.dart';
import 'package:dialog_doc990_mobile/providers/sign_up_provider.dart';
import 'package:dialog_doc990_mobile/screen_keys.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUpForm2 extends StatefulWidget {
  @override
  _SignUpForm2State createState() => _SignUpForm2State();
}

class _SignUpForm2State extends State<SignUpForm2> {
  GlobalKey<FormState> _signUpForm2Key =
      GlobalKey<FormState>(debugLabel: '_signFrom2Key');
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    NotificationAPI.init();
  }

  void validateAndSubmitForm() {
    if (_signUpForm2Key.currentState.validate()) {
      final provider = context.read<SignUpProvider>();
      // send data to backend
      provider.createUserAccount(context);

      NotificationAPI.showNotification(
        title: 'Hi, ${provider.name}',
        body: 'Your account has been created sucessfully.',
      );
      // navigate to the home screen
      // reset sign up state values
      context.read<SignUpProvider>().resetValues();
      Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final userProvider = context.read<SignUpProvider>();

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
                value: userProvider.country,
                isRequiredFeild: true,
                onChange: (value) {
                  userProvider.country = value;
                },
              ),
              RoundedDropDownFeild(
                isRequiredFeild: true,
                isCountry: false,
                text: 'Your Title',
                value: userProvider.title,
                onChange: (value) {
                  userProvider.title = value;
                },
              ),
              GenderDropdown(
                text: 'Your Gender',
                onChange: (value) {
                  userProvider.gender = value;
                },
                isRequiredFeild: true,
                value: userProvider.gender,
              ),
              RoundedTextFeild(
                isRequiredFeild: true,
                isPassword: false,
                isNumber: false,
                icon: Icons.person,
                isPhoneNumber: false,
                value: userProvider.name,
                text: 'Your Name',
                onChange: (text) {
                  userProvider.name = text;
                },
              ),
              RoundedTextFeild(
                isRequiredFeild: true,
                isPassword: false,
                isNumber: true,
                icon: Icons.credit_card,
                isPhoneNumber: false,
                value: userProvider.nic,
                text: 'NIC/ Passport Number',
                onChange: (text) {
                  userProvider.nic = text;
                },
              ),
              RoundedTextFeild(
                isRequiredFeild: true,
                isPassword: true,
                isNumber: false,
                icon: Icons.password,
                isPhoneNumber: false,
                text: 'Password',
                value: userProvider.password,
                onChange: (text) {
                  userProvider.password = text;
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(right: 5),
                        child: RoundedButton(
                          text: 'BACK',
                          color: Color(COLOR_SECONDARY),
                          textColor: Colors.black,
                          action: () {
                            Navigator.of(context).pop();
                          },
                          height: size.height * 0.072,
                          width: size.width * 0.4,
                          icon: Icons.send,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(left: 5),
                        child: isLoading
                            ? RoundedLoadingButton(
                                text: 'REGISTER',
                                action: null,
                                height: size.height * 0.072,
                                width: size.width * 0.4,
                                icon: Icons.send,
                              )
                            : RoundedButton(
                                text: 'REGISTER',
                                color: Color(COLOR_PRIMARY),
                                textColor: Colors.white,
                                action: validateAndSubmitForm,
                                height: size.height * 0.072,
                                width: size.width * 0.4,
                                icon: Icons.send,
                              ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
