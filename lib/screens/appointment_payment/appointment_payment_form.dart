import 'package:dialog_doc990_mobile/screens/appointment_payment/payment_input_form.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppointmentPaymentContent extends StatefulWidget {
  @override
  _AppointmentPaymentContentState createState() =>
      _AppointmentPaymentContentState();
}

class _AppointmentPaymentContentState extends State<AppointmentPaymentContent> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      child: CardInputForm(),
    );
  }
}
