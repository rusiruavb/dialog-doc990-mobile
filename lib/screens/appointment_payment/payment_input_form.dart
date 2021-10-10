import 'package:dialog_doc990_mobile/components/common/rounded_input_field.dart';
import 'package:dialog_doc990_mobile/components/payment_input_fields/card_expire_field.dart';
import 'package:dialog_doc990_mobile/components/payment_input_fields/card_number.dart';
import 'package:dialog_doc990_mobile/components/payment_input_fields/cvc_input_field.dart';
import 'package:dialog_doc990_mobile/constants.dart';
import 'package:dialog_doc990_mobile/providers/appointment_provider.dart';
import 'package:dialog_doc990_mobile/providers/payment_provider.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class CardInputForm extends StatefulWidget {
  @override
  _CardDataInputFomrState createState() => _CardDataInputFomrState();
}

class _CardDataInputFomrState extends State<CardInputForm> {
  GlobalKey<FormState> _cardInputFormKey =
      GlobalKey<FormState>(debugLabel: '_paymentFormKey');
  final fieldKey = new GlobalKey();

  void initState() {
    super.initState();
    print('called');
    context.read<PaymentProvider>().resetState();
  }

  void validateAndSubmit() {
    if (_cardInputFormKey.currentState.validate()) {
      final paymentProvider = context.read<PaymentProvider>();
      final appointmentProvider = context.read<AppointmentProvider>();
      String cardNumber = paymentProvider.enteredCardNumber;
      String cvc = paymentProvider.enteredCVC;
      String expireDate = paymentProvider.enteredExpireDate;

      if (cardNumber != null && cvc != null && expireDate != null) {
        context.read<AppointmentProvider>().createAppointment(context);
      } else {
        Fluttertoast.showToast(
          msg: 'Pelase input required data',
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final provider = context.read<PaymentProvider>();

    return Container(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Form(
          key: _cardInputFormKey,
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  RoundedTextFeild(
                    isNumber: false,
                    isPassword: false,
                    isPhoneNumber: false,
                    isRequiredFeild: true,
                    onChange: (value) {
                      provider.cardHolderName = value;
                    },
                    text: 'Card Holder Name',
                    value: provider.enteredCardHolderName,
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  CardNumberTextField(
                    value: provider.cardNumber,
                    isRequiredFeild: true,
                    onChange: (value) {
                      provider.enteredCardNumber = value;
                    },
                    text: 'Card Number',
                  )
                ],
              ),
              Row(
                children: <Widget>[
                  CardExpireDateField(
                    value: provider.expireDate,
                    isRequiredFeild: true,
                    onChange: (value) {
                      provider.enteredExpireDate = value;
                    },
                    text: 'Expire Date',
                  )
                ],
              ),
              Row(
                children: <Widget>[
                  CVCInputField(
                    value: provider.cvc,
                    onChange: (value) {
                      provider.enteredCVC = value;
                    },
                    text: 'CVC',
                    isRequiredFeild: true,
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: <Widget>[
                  Consumer<PaymentProvider>(builder: (context, value, child) {
                    print('########## ' +
                        context
                            .read<PaymentProvider>()
                            .isPaymentLoading
                            .toString());
                    return Container(
                      margin: EdgeInsets.symmetric(vertical: 0),
                      height: 50,
                      width: size.width * 0.9,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: FlatButton(
                          disabledColor: value.isPaymentLoading
                              ? Color(COLOR_PRIMARY_DISABLED)
                              : Color(COLOR_PRIMARY),
                          padding: EdgeInsets.symmetric(
                              vertical: 17.5, horizontal: 22),
                          color: value.isPaymentLoading
                              ? Color(COLOR_PRIMARY_DISABLED)
                              : Color(COLOR_PRIMARY),
                          onPressed:
                              value.isPaymentLoading ? null : validateAndSubmit,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              value.getPaymentLoading()
                                  ? Row(
                                      // Loading animation
                                      children: <Widget>[
                                        SizedBox(
                                          width: 15,
                                          height: 20,
                                          child: CircularProgressIndicator(
                                            color: Colors.white,
                                            strokeWidth: 2,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 10),
                                          child: Text(
                                            'PROCESSING',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontFamily: FONT_FAMILY_PRIMARY,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  : Text(
                                      'PAY',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: FONT_FAMILY_PRIMARY,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                            ],
                          ),
                        ),
                      ),
                    );
                  })
                ],
              ),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}
