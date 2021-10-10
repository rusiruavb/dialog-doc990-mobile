import 'dart:convert';

import 'package:dialog_doc990_mobile/api_endpoints.dart';
import 'package:dialog_doc990_mobile/models/appointment_model.dart';
import 'package:dialog_doc990_mobile/providers/payment_provider.dart';
import 'package:dialog_doc990_mobile/providers/search_doctor_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

class AppointmentProvider extends ChangeNotifier {
  // Patient Information
  String selectTime;
  String patientName;
  String patientTitle;
  String email;
  String phoneNumber;
  String nic;
  String address;
  String city;
  String province;
  String referenceNo;
  String hospitalName;
  String date;
  double totalPrice;
  bool isServiceChargeChecked = false;
  bool isPDFReceiptChecked = false;

  // Constants
  final double hospitalPrice = 400.0;
  final double refundChage = 250.0;
  final double bookingCharge = 99.0;
  double doctorCharge;

  List<AppointmentModel> appointments = [];
  int noOfAppointments = 0;

  void createAppointment(BuildContext context) async {
    final paymentProvider =
        Provider.of<PaymentProvider>(context, listen: false);
    final doctorProvider =
        Provider.of<SearchDoctorProvider>(context, listen: false);

    if (selectTime != null &&
        patientName != null &&
        patientTitle != null &&
        email != null &&
        phoneNumber != null &&
        nic != null &&
        address != null &&
        city != null &&
        province != null &&
        referenceNo != null &&
        hospitalName != null &&
        date != null &&
        paymentProvider.enteredCardNumber != null &&
        paymentProvider.enteredExpireDate != null &&
        doctorProvider.selectedDoctor.name != null &&
        doctorProvider.selectedDoctor.specialization != null) {
      final response = await http.post(
        Uri.parse(CREATE_APPOINTMENT),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
        body: jsonEncode(
          <String, dynamic>{
            "time": selectTime,
            "name": patientName,
            "email": email,
            "address": address,
            "city": city,
            "province": province,
            "phoneNumber": phoneNumber,
            "nic": nic,
            "isChargeChecked": isServiceChargeChecked,
            "isPDFChecked": isPDFReceiptChecked,
            "referenceNo": referenceNo,
            "hospitalName": hospitalName,
            "date": date,
            "totalAmount": calculateTotalPrice(),
            "cardNumber": paymentProvider.enteredCardNumber,
            "cardExpireDate": paymentProvider.enteredExpireDate,
            "doctorName": doctorProvider.selectedDoctor.name,
            "specialization": doctorProvider.selectedDoctor.specialization,
          },
        ),
      );

      if (response.statusCode == 200) {
        Fluttertoast.showToast(msg: 'Appointment created succussfully');
        await FlutterSecureStorage().delete(key: 'phoneNumber');
        await FlutterSecureStorage()
            .write(key: 'phoneNumber', value: phoneNumber);
        notifyListeners();
        Navigator.pushNamed(context, '/home');
      } else {
        Fluttertoast.showToast(msg: 'Error with create appointment');
        notifyListeners();
      }
    } else {
      Fluttertoast.showToast(msg: 'Please provide necessary infromation');
      notifyListeners();
    }
  }

  Future<List<AppointmentModel>> getUserAppointments() async {
    appointments.clear();
    final phoneNumber = await FlutterSecureStorage().read(key: 'phoneNumber');

    if (phoneNumber != null) {
      final response = await http.get(
        Uri.parse(GET_APPOINTMENTS),
        headers: {'phonenumber': phoneNumber},
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body) as List;
        noOfAppointments = data.length;
        for (Map<String, dynamic> appointment in data) {
          appointments.add(AppointmentModel.fromJson(appointment));
        }
        return appointments;
      } else {
        Fluttertoast.showToast(msg: 'Error with fetch appointments');
        notifyListeners();
        return null;
      }
    } else {
      Fluttertoast.showToast(msg: 'Please Login');
      notifyListeners();
      return null;
    }
  }

  double calculateTotalPrice() {
    if (doctorCharge != null) {
      totalPrice = hospitalPrice + refundChage + bookingCharge + doctorCharge;
      return totalPrice;
    } else {
      Fluttertoast.showToast(msg: 'Doctor charge is not found');
      return 0.0;
    }
  }

  String generateReferenceNo() {
    var uniqueToken = Uuid();
    var referenceNumber = uniqueToken.v1();
    print(referenceNumber);
    referenceNo = referenceNumber.split('-')[0].toUpperCase();
    return referenceNumber.split('-')[0].toUpperCase();
  }

  double calculateTotalPayment() {
    if (doctorCharge != null) {
      double totalPrice =
          doctorCharge + hospitalPrice + refundChage + bookingCharge;
      return totalPrice;
    } else {
      return 0.0;
    }
  }
}
