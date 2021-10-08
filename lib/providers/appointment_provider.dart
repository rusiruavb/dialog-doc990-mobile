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
  bool isServiceChargeChecked = false;
  bool isPDFReceiptChecked = false;
  // PAYMETN INFORMATION
  // default valus
  double totalPrice = 0.0;
  String cardNumber = "0000 0000 0000 0000";
  String cardHolderName = "Card Holder Name";
  String cvc = "000";
  String expireDate = "00/00";
  bool isPaymentLoading = false;
  // entered valus
  String enteredCardNumber;
  String enteredCardHolderName;
  String enteredCVC;
  String enteredExpireDate;
  // constants
  final double hospitalPrice = 400.0;
  final double refundChage = 250.0;
  final double bookingCharge = 99.0;
  double doctorCharge;

  void resetState() {
    totalPrice = 0.0;
    cardNumber = "0000 0000 0000 0000";
    cardHolderName = "Card Holder Name";
    cvc = "000";
    expireDate = "00/00";
    isPaymentLoading = false;
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
