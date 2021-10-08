import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:uuid/uuid.dart';

class AppointmentProvider extends ChangeNotifier {
  // PATIENT INFORMATION
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

  // constants
  final double hospitalPrice = 400.0;
  final double refundChage = 250.0;
  final double bookingCharge = 99.0;
  double doctorCharge;

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
