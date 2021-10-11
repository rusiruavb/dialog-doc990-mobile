import 'package:dialog_doc990_mobile/components/common/rounded_button.dart';
import 'package:dialog_doc990_mobile/components/common/rounded_input_field.dart';
import 'package:dialog_doc990_mobile/providers/refund_provider.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import '../../constants.dart';

class MobileRefundForm extends StatefulWidget {
  @override
  _MobileRefundFormState createState() => _MobileRefundFormState();
}

class _MobileRefundFormState extends State<MobileRefundForm> {
  void validateAndSubmit() {
    final provider = context.read<RefundProvider>();

    if (provider.isMobileRefund &&
        provider.phoneNumber != null &&
        provider.referenceNo != null &&
        provider.refundRemarks != null) {
      provider.createMobileRefund(context);
    } else {
      Fluttertoast.showToast(msg: 'Please enter required fields');
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final provider = context.read<RefundProvider>();

    return Container(
      width: size.width,
      child: Padding(
        padding: EdgeInsets.only(
          top: 30,
          left: 25,
          right: 25,
        ),
        child: Form(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              RoundedTextFeild(
                isRequiredFeild: true,
                isPassword: false,
                isNumber: false,
                isPhoneNumber: false,
                icon: Icons.local_offer,
                text: 'Reference No.',
                value: '',
                onChange: (text) {
                  provider.referenceNo = text;
                },
              ),
              RoundedTextFeild(
                isRequiredFeild: true,
                isPassword: false,
                isNumber: true,
                isPhoneNumber: true,
                icon: Icons.monetization_on,
                text: 'Amount (Rs.)',
                value: '',
                onChange: (text) {
                  provider.refundAmount = text;
                },
              ),
              RoundedTextFeild(
                isRequiredFeild: true,
                isPassword: false,
                isNumber: true,
                isPhoneNumber: true,
                icon: Icons.phone,
                text: 'Mobile/ CDMA No.',
                value: '',
                onChange: (text) {
                  provider.phoneNumber = text;
                },
              ),
              RoundedTextFeild(
                isRequiredFeild: true,
                isPassword: false,
                isNumber: false,
                isPhoneNumber: false,
                icon: Icons.view_headline_rounded,
                text: 'Refund Remarks',
                value: '',
                onChange: (text) {
                  provider.refundRemarks = text;
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(right: 13),
                    child: RoundedButton(
                      text: 'CANCEL',
                      color: Color(COLOR_SECONDARY),
                      textColor: Colors.black,
                      action: () {
                        provider.resetRefundState();
                        Navigator.pushNamedAndRemoveUntil(
                            context, '/home', (route) => false);
                      },
                      height: 50,
                      fontSize: 15,
                      width: size.width * 0.4,
                      icon: Icons.send,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 13),
                    child: RoundedButton(
                      text: 'SUBMIT',
                      color: Color(COLOR_PRIMARY),
                      textColor: Colors.white,
                      action: validateAndSubmit,
                      height: 50,
                      fontSize: 15,
                      width: size.width * 0.4,
                      icon: Icons.send,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              )
            ],
          ),
        ),
      ),
    );
  }
}
