import 'package:dialog_doc990_mobile/components/notification_api.dart';
import 'package:dialog_doc990_mobile/components/rounded_button.dart';
import 'package:dialog_doc990_mobile/components/rounded_dropdown_feild.dart';
import 'package:dialog_doc990_mobile/components/rounded_input_field.dart';
import 'package:dialog_doc990_mobile/components/rounded_loading_button.dart';
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
      String email = context.read<SignUpProvider>().getEmail();
      String phoneNumber = context.read<SignUpProvider>().getPhoneNumber();
      String country =
          context.read<SignUpProvider>().getCountry().split(' ')[1];
      String title = context.read<SignUpProvider>().getTitle().split(' ')[1];
      String name = context.read<SignUpProvider>().getName();
      String nic = context.read<SignUpProvider>().getNIC();
      String password = context.read<SignUpProvider>().getPassword();

      var userData = {
        'email': email,
        'phoneNumber': phoneNumber,
        'country': country,
        'title': title,
        'name': name,
        'nic': nic,
        'password': password,
      };

      print(userData);

      // send data to backend

      // reset sign up state values
      context.read<SignUpProvider>().resetValues();

      NotificationAPI.showNotification(
        title: 'Hi, ${name}',
        body: 'Your account has been created sucessfully.',
        payload: 'Heeeee',
      );
      // navigate to the home screen
      Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
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
                value: context.read<SignUpProvider>().getCountry(),
                isRequiredFeild: true,
                onChange: (value) {
                  context.read<SignUpProvider>().setCountry(value);
                  print('Country ' + value);
                },
              ),
              RoundedDropDownFeild(
                isRequiredFeild: true,
                isCountry: false,
                text: 'Your Title',
                value: context.read<SignUpProvider>().getTitle(),
                onChange: (value) {
                  context.read<SignUpProvider>().setTitle(value);
                  print('Title ' + value);
                },
              ),
              RoundedTextFeild(
                isRequiredFeild: true,
                isPassword: false,
                isNumber: false,
                icon: Icons.person,
                isPhoneNumber: false,
                value: context.read<SignUpProvider>().getName(),
                text: 'Your Name',
                onChange: (text) {
                  context.read<SignUpProvider>().setName(text);
                },
              ),
              RoundedTextFeild(
                isRequiredFeild: true,
                isPassword: false,
                isNumber: true,
                icon: Icons.credit_card,
                isPhoneNumber: false,
                value: context.read<SignUpProvider>().getNIC(),
                text: 'NIC/ Passport Number',
                onChange: (text) {
                  context.read<SignUpProvider>().setNIC(text);
                },
              ),
              RoundedTextFeild(
                isRequiredFeild: true,
                isPassword: true,
                isNumber: false,
                icon: Icons.password,
                isPhoneNumber: false,
                text: 'Password',
                value: context.read<SignUpProvider>().getPassword(),
                onChange: (text) {
                  context.read<SignUpProvider>().setPassword(text);
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
