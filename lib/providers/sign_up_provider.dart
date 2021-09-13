import 'package:flutter/material.dart';

class SignUpProvider with ChangeNotifier {
  String _email = '';
  String _phoneNumber = '';
  String _country = '';
  String _title = '';
  String _name = '';
  String _nic = '';
  String _password = '';

  void setEmail(String email) {
    _email = email;
    notifyListeners();
  }

  void setPhoneNumber(String phoneNumber) {
    _phoneNumber = phoneNumber;
    notifyListeners();
  }

  void setCountry(String country) {
    // var countryData = country.split(' ');
    _country = country;
    notifyListeners();
  }

  void setTitle(String title) {
    _title = title;
    notifyListeners();
  }

  void setName(String name) {
    _name = name;
    notifyListeners();
  }

  void setNIC(String nic) {
    _nic = nic;
    notifyListeners();
  }

  void setPassword(String password) {
    _password = password;
    notifyListeners();
  }

  String getEmail() {
    return _email;
  }

  String getPhoneNumber() {
    return _phoneNumber;
  }

  String getCountry() {
    return _country;
  }

  String getTitle() {
    return _title;
  }

  String getName() {
    return _name;
  }

  String getNIC() {
    return _nic;
  }

  String getPassword() {
    return _password;
  }

  void resetValues() {
    _email = '';
    _country = '';
    _phoneNumber = '';
    _nic = '';
    _title = '';
    _password = '';
    _name = '';
  }
}
