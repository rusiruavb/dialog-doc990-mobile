import 'package:flutter/material.dart';

class PaymentProvider with ChangeNotifier {
  // default valus
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

  setPaymentLoading(bool value) {
    notifyListeners();
    isPaymentLoading = value;
  }

  getPaymentLoading() {
    return this.isPaymentLoading;
  }

  void resetState() {
    cardNumber = "0000 0000 0000 0000";
    cardHolderName = "Card Holder Name";
    cvc = "000";
    expireDate = "00/00";
    isPaymentLoading = false;
  }
}
