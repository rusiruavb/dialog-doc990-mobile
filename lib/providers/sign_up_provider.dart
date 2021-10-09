import 'dart:convert';

import 'package:dialog_doc990_mobile/api_endpoints.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class SignUpProvider with ChangeNotifier {
  String email = '';
  String phoneNumber = '';
  String country = '';
  String title = '';
  String name = '';
  String nic = '';
  String password = '';
  String gender = '';

  void resetValues() {
    email = '';
    country = '';
    phoneNumber = '';
    nic = '';
    title = '';
    password = '';
    name = '';
    gender = '';
  }

  void createUserAccount(BuildContext context) async {
    final response = await http.post(
      Uri.parse(CREATE_USER_ACCOUNT),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8'
      },
      body: jsonEncode(<String, String>{
        'name': title.split(' ')[1] + name,
        'email': email,
        'phoneNumber': phoneNumber,
        'nic': nic,
        'password': password,
        'country': country,
        'gender': gender.split(' ')[1],
      }),
    );

    if (response.statusCode == 200) {
      notifyListeners();
      Fluttertoast.showToast(
        msg: 'Create account success',
      );
      Navigator.pushNamed(context, '/home');
    } else {
      notifyListeners();
      Fluttertoast.showToast(
        msg: 'Problem with creating account',
      );
    }
  }
}
