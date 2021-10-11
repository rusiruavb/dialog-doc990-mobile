import 'dart:convert';

import 'package:dialog_doc990_mobile/api_endpoints.dart';
import 'package:dialog_doc990_mobile/models/user_auth_model.dart';
import 'package:dialog_doc990_mobile/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class UserProvider with ChangeNotifier {
  String email = '';
  String phoneNumber = '';
  String country = '';
  String title = '';
  String name = '';
  String nic = '';
  String password = '';
  String gender = '';
  String profileImage;
  UserModel userProfile;
  final storage = new FlutterSecureStorage();

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
      final data = jsonDecode(response.body);
      var authData = new UserAuthModel.fromJson(data);
      final token = await storage.read(key: 'user_id');

      if (token != null) {
        await storage.deleteAll();
      }
      await storage.write(key: 'user_id', value: authData.userId);
      await storage.write(key: 'name', value: authData.name);
      await storage.write(key: 'email', value: authData.email);
      await storage.write(key: 'phoneNumber', value: authData.phoneNumber);
      Fluttertoast.showToast(
        msg: 'Create account success',
      );
      notifyListeners();
      this.getUserProfile();
      this.resetValues();
      Navigator.pushNamed(context, '/home');
    } else {
      notifyListeners();
      Fluttertoast.showToast(
        msg: 'Problem with creating account',
      );
    }
  }

  void loginAccount(BuildContext context) async {
    if (phoneNumber != null && password != null) {
      final response = await http.post(
        Uri.parse(LOGIN_USER_ACCOUNT),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
        body: jsonEncode(
          <String, String>{
            'phoneNumber': phoneNumber,
            'password': password,
          },
        ),
      );

      if (response.statusCode == 200) {
        notifyListeners();
        final data = jsonDecode(response.body);
        var authData = new UserAuthModel.fromJson(data);
        final token = await storage.read(key: 'user_id');

        if (token != null) {
          await storage.deleteAll();
        }
        await storage.write(key: 'user_id', value: authData.userId);
        await storage.write(key: 'name', value: authData.name);
        await storage.write(key: 'email', value: authData.email);
        await storage.write(key: 'phoneNumber', value: authData.phoneNumber);
        Fluttertoast.showToast(
          msg: 'Login success',
        );
        notifyListeners();
        this.getUserProfile();
        this.resetValues();
        Navigator.pushNamed(context, '/home');
      } else {
        notifyListeners();
        Fluttertoast.showToast(
          msg: 'Problem with creating account',
        );
      }
    } else {
      Fluttertoast.showToast(
        msg: 'Phone number & Password are required!',
      );
    }
  }

  void logoutAccount(BuildContext context) async {
    await storage.deleteAll();
    userProfile = null;
    profileImage = null;
    Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
  }

  Future<UserModel> getUserProfile() async {
    final phoneNumber = await storage.read(key: 'phoneNumber');

    if (phoneNumber != null) {
      final response = await http.get(
        Uri.parse(GET_USER_PROFILE),
        headers: {'phonenumber': phoneNumber},
      );

      if (response.statusCode == 200) {
        notifyListeners();
        final data = jsonDecode(response.body);
        userProfile = new UserModel.fromJson(data);
        profileImage = userProfile.imageUrl;
        return userProfile;
      } else if (response.statusCode == 500) {
        Fluttertoast.showToast(
          msg: response.body.toString(),
        );
        return null;
      } else {
        Fluttertoast.showToast(
          msg: 'Problem with getting account',
        );
        return null;
      }
    } else {
      notifyListeners();
      return null;
    }
  }

  UserModel getProfile() {
    return this.userProfile;
  }
}
