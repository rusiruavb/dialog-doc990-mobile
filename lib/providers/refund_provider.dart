import 'dart:convert';

import 'package:dialog_doc990_mobile/api_endpoints.dart';
import 'package:dialog_doc990_mobile/models/refund_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class RefundProvider with ChangeNotifier {
  String referenceNo = '';
  String bankHolderName;
  String bankAccountNo;
  String bankName;
  String branchName;
  String refundRemarks;
  String phoneNumber;
  bool isBankRefund = true;
  bool isMobileRefund = false;
  int noOfRefunds = 0;
  String refundAmount;
  List<RefundModel> refunds = [];

  void resetRefundState() {
    referenceNo = null;
    bankHolderName = null;
    bankAccountNo = null;
    bankName = null;
    branchName = null;
    refundRemarks = null;
    phoneNumber = null;
    isBankRefund = null;
    isMobileRefund = null;
    refundAmount = null;
  }

  Future<List<RefundModel>> getRefunds() async {
    refunds.clear();
    final phoneNumber = await FlutterSecureStorage().read(key: 'phoneNumber');

    if (phoneNumber != null) {
      final response = await http.get(
        Uri.parse(GET_REFUND_REQUESTS),
        headers: {'phonenumber': phoneNumber},
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body) as List;
        noOfRefunds = data.length;

        for (Map<String, dynamic> refund in data) {
          refunds.add(RefundModel.fromJson(refund));
        }
        return refunds;
      } else {
        Fluttertoast.showToast(
            msg: 'Issue with fetch refund requestes. Please try again');
        notifyListeners();
        return null;
      }
    } else {
      Fluttertoast.showToast(msg: 'Please Login!');
      notifyListeners();
      return null;
    }
  }

  void createBankRefund(BuildContext context) async {
    final response = await http.post(
      Uri.parse(CREATE_REFUND_REQUEST),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8'
      },
      body: jsonEncode(<String, dynamic>{
        'referenceNo': referenceNo,
        'isBankRefund': isBankRefund,
        'isMobileRefund': isMobileRefund,
        'refundRemarks': refundRemarks,
        'phoneNumber': phoneNumber,
        'bankName': bankName,
        'branchName': branchName,
        'amount': refundAmount,
      }),
    );

    if (response.statusCode == 200) {
      Fluttertoast.showToast(msg: 'Refund request created successfully');
      notifyListeners();
      this.resetRefundState();
      Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
    } else {
      Fluttertoast.showToast(
          msg: 'Issue with create refund request. Please try again');
    }
  }

  void createMobileRefund(BuildContext context) async {
    final response = await http.post(
      Uri.parse(CREATE_REFUND_REQUEST),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8'
      },
      body: jsonEncode(<String, dynamic>{
        'referenceNo': referenceNo,
        'isMobileRefund': isMobileRefund,
        'refundRemarks': refundRemarks,
        'phoneNumber': phoneNumber,
        'amount': refundAmount,
      }),
    );

    if (response.statusCode == 200) {
      Fluttertoast.showToast(msg: 'Refund request created successfully');
      notifyListeners();
      this.resetRefundState();
      Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
    } else {
      Fluttertoast.showToast(
          msg: 'Issue with create refund request. Please try again');
    }
  }
}
