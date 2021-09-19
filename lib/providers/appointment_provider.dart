import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AppointmentProvider with ChangeNotifier {
  String time;
  String title;
  String name;
  String emailAddress;
  String phoneNumber;
  String nic;
  String address;
  String city;
  String province;
  bool isServiceChargeChecked = false;
  bool isPDFReceiptChecked = false;

  // Setters and Getters implementation - Start
  void setTime(String time) {
    this.time = time;
  }

  String getTime() {
    return this.time;
  }

  void setTitle(String title) {
    this.title = title.split(' ')[1];
  }

  String getTitle() {
    return this.title;
  }

  void setName(String name) {
    this.name = name;
  }

  String getName() {
    return this.name;
  }

  void setEmail(String email) {
    this.emailAddress = email;
  }

  String getEmail() {
    return this.emailAddress;
  }

  void setPhoneNumber(String phone) {
    this.phoneNumber = phone;
  }

  String getPhoneNumber() {
    return this.phoneNumber;
  }

  void setNIC(String nic) {
    this.nic = nic;
  }

  String getNIC() {
    return this.nic;
  }

  void setAddress(String address) {
    this.address = address;
  }

  String getAddress() {
    return this.address;
  }

  void setCity(String city) {
    this.city = city;
  }

  String getCity() {
    return this.city;
  }

  void setProvince(String province) {
    this.province = province;
  }

  String getProvince() {
    return this.province;
  }

  void setChargeCheck(bool value) {
    this.isServiceChargeChecked = value;
  }

  bool getChargeCheck() {
    return this.isServiceChargeChecked;
  }

  void setPDFCheck(bool value) {
    this.isPDFReceiptChecked = value;
  }

  bool getPDFCheck() {
    return this.isPDFReceiptChecked;
  }
  // Setters and Getters implementation - End

  void resetState() {}
}
