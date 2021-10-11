import 'package:dialog_doc990_mobile/providers/refund_provider.dart';
import 'package:dialog_doc990_mobile/screen_keys.dart';
import 'package:dialog_doc990_mobile/screens/refund_request/mobile_refund.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants.dart';
import 'bank_refund.dart';

class RefundPage extends StatefulWidget {
  @override
  _RefundPageState createState() => _RefundPageState();
}

class _RefundPageState extends State<RefundPage> {
  bool _isBankRefundClick = true;
  bool _isMobileRefundClick = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final provider = context.read<RefundProvider>();

    return SingleChildScrollView(
      child: Container(
        color: Colors.white,
        key: WidgetKeys.bankRefundFormKey,
        width: size.width,
        child: Padding(
          padding: EdgeInsets.only(
            top: 100,
          ),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(right: 0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                      ),
                      child: FlatButton(
                        padding: EdgeInsets.symmetric(
                            vertical: 17.5, horizontal: 33),
                        color: _isBankRefundClick
                            ? Color(COLOR_PRIMARY)
                            : Color(COLOR_SECONDARY),
                        onPressed: () {
                          provider.isBankRefund = true;
                          provider.isMobileRefund = false;
                          setState(() {
                            _isBankRefundClick = true;
                            _isMobileRefundClick = false;
                          });
                        },
                        child: Text(
                          'BANK REFUND',
                          style: TextStyle(
                            color: _isBankRefundClick
                                ? Colors.white
                                : Colors.black,
                            fontFamily: FONT_FAMILY_PRIMARY,
                            fontSize: 16,
                            fontWeight: FontWeight.w100,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                      child: FlatButton(
                        padding: EdgeInsets.symmetric(
                            vertical: 17.5, horizontal: 33),
                        color: _isMobileRefundClick
                            ? Color(COLOR_PRIMARY)
                            : Color(COLOR_SECONDARY),
                        onPressed: () {
                          provider.isBankRefund = false;
                          provider.isMobileRefund = true;
                          setState(() {
                            _isMobileRefundClick = true;
                            _isBankRefundClick = false;
                          });
                        },
                        child: Text(
                          'MOBILE REFUND',
                          style: TextStyle(
                            color: _isMobileRefundClick
                                ? Colors.white
                                : Colors.black,
                            fontFamily: FONT_FAMILY_PRIMARY,
                            fontSize: 16,
                            fontWeight: FontWeight.w100,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(
                      left: 20,
                      top: 10,
                    ),
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            SizedBox(
                              width: size.width * 0.9,
                              child: Text(
                                '"Your refund will be arranged to the same payment mode used for making the appointment."',
                                style: TextStyle(
                                  fontFamily: FONT_FAMILY_PRIMARY,
                                  color: Color(COLOR_PRIMARY),
                                  fontSize: 13,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            SizedBox(
                              width: size.width * 0.9,
                              child: Text(
                                'Example - Mobile bill/reload refund will be arranged for Add to bill transactions and bank deposits for card payment transactions.',
                                style: TextStyle(
                                  fontFamily: FONT_FAMILY_PRIMARY,
                                  color: Color(COLOR_PRIMARY),
                                  fontSize: 13,
                                ),
                                textAlign: TextAlign.start,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  _isBankRefundClick ? BankRefundForm() : Text(''),
                  _isMobileRefundClick ? MobileRefundForm() : Text(''),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
