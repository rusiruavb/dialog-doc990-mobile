import 'package:dialog_doc990_mobile/components/common/rounded_button.dart';
import 'package:dialog_doc990_mobile/components/common/rounded_input_field.dart';
import 'package:dialog_doc990_mobile/components/refund/bank_branch_dropdown.dart';
import 'package:dialog_doc990_mobile/components/refund/bank_dropdown.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';

class BankRefundForm extends StatefulWidget {
  @override
  _BankRefundFormState createState() => _BankRefundFormState();
}

class _BankRefundFormState extends State<BankRefundForm> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

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
                  print(text);
                },
              ),
              RoundedTextFeild(
                isRequiredFeild: true,
                isPassword: false,
                isNumber: false,
                isPhoneNumber: false,
                icon: Icons.person,
                text: 'Bank Account Holder Name',
                value: '',
                onChange: (text) {
                  print(text);
                },
              ),
              RoundedTextFeild(
                isRequiredFeild: true,
                isPassword: false,
                isNumber: false,
                isPhoneNumber: false,
                icon: Icons.credit_card,
                text: 'Bank Account No.',
                value: '',
                onChange: (text) {
                  print(text);
                },
              ),
              RoundedBankDropDown(
                isRequiredFeild: true,
                text: 'Bank Name',
                onChange: (value) {
                  print(value);
                },
                value: '',
              ),
              RoundedBranchDropdown(
                isRequiredFeild: true,
                text: 'Branch Name',
                onChange: (value) {
                  print(value);
                },
                value: '',
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
                  print(text);
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
                      fontSize: 15,
                      action: () {
                        print('object');
                      },
                      height: 50,
                      width: size.width * 0.4,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 13),
                    child: RoundedButton(
                      text: 'SUBMIT',
                      color: Color(COLOR_PRIMARY),
                      textColor: Colors.white,
                      action: () {
                        print('object');
                      },
                      height: 50,
                      fontSize: 15,
                      width: size.width * 0.4,
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
