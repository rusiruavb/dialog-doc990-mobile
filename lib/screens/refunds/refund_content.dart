import 'package:badges/badges.dart';
import 'package:dialog_doc990_mobile/models/refund_model.dart';
import 'package:dialog_doc990_mobile/providers/refund_provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../constants.dart';

class RefundContent extends StatefulWidget {
  @override
  _RefundContentState createState() => _RefundContentState();
}

class _RefundContentState extends State<RefundContent> {
  Future<List<RefundModel>> refunds;

  @override
  void initState() {
    super.initState();
    refunds = context.read<RefundProvider>().getRefunds();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      child: Column(
        children: <Widget>[
          FutureBuilder<List<RefundModel>>(
            future: refunds,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Container(
                  height: size.height * 0.866,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          'Your Refunds',
                          style: TextStyle(
                            fontFamily: FONT_FAMILY_PRIMARY,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          padding: EdgeInsets.only(top: 0),
                          itemCount: snapshot.data.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Refund(
                              referenceNo: snapshot.data[index].referenceNo,
                              bankName: snapshot.data[index].bankName,
                              branchName: snapshot.data[index].branchName,
                              amount: snapshot.data[index].refundAmount,
                              isBankRefund: snapshot.data[index].isBankRefund,
                              isMobileRefund:
                                  snapshot.data[index].isMobileRefund,
                              createdDateTime: snapshot.data[index].createdAt,
                              phoneNumber: snapshot.data[index].phoneNumber,
                              refundRemarks: snapshot.data[index].refundRemarks,
                              status: snapshot.data[index].status,
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                );
              } else if (snapshot.hasError) {
                return Text('Error with getting Trip information');
              }
              return Container(
                width: 25,
                height: 25,
                child: CircularProgressIndicator(
                  color: Color(COLOR_PRIMARY),
                  strokeWidth: 3,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class Refund extends StatefulWidget {
  final String referenceNo;
  final DateTime createdDateTime;
  final String bankName;
  final String refundRemarks;
  final String branchName;
  final int amount;
  final String phoneNumber;
  final bool isMobileRefund;
  final bool isBankRefund;
  final String status;

  Refund({
    this.referenceNo,
    this.createdDateTime,
    this.bankName,
    this.branchName,
    this.refundRemarks,
    this.amount,
    this.phoneNumber,
    this.isMobileRefund,
    this.isBankRefund,
    this.status,
  });

  @override
  _RefundState createState() => _RefundState(
        referenceNo: referenceNo,
        createdDateTime: createdDateTime,
        bankName: bankName,
        branchName: branchName,
        refundRemarks: refundRemarks,
        phoneNumber: phoneNumber,
        isBankRefund: isBankRefund,
        isMobileRefund: isMobileRefund,
        amount: amount,
        status: status,
      );
}

class _RefundState extends State<Refund> {
  final String referenceNo;
  final DateTime createdDateTime;
  final String bankName;
  final String refundRemarks;
  final String branchName;
  final int amount;
  final String phoneNumber;
  final bool isMobileRefund;
  final bool isBankRefund;
  final String status;

  _RefundState({
    this.referenceNo,
    this.createdDateTime,
    this.bankName,
    this.branchName,
    this.refundRemarks,
    this.amount,
    this.phoneNumber,
    this.isMobileRefund,
    this.isBankRefund,
    this.status,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color(COLOR_SECONDARY),
            blurRadius: 10,
            spreadRadius: -22,
            offset: Offset(5.0, 5.0),
          )
        ],
      ),
      padding: EdgeInsets.all(5),
      child: isBankRefund
          ? Card(
              color: Color(COLOR_SECONDARY),
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Stack(
                children: <Widget>[
                  Positioned(
                    top: 10,
                    right: 5,
                    child: Badge(
                      toAnimate: false,
                      shape: BadgeShape.square,
                      borderRadius: BorderRadius.circular(15),
                      badgeColor: Colors.black,
                      elevation: 0,
                      badgeContent: Text(
                        'BANK REFUND',
                        style: TextStyle(
                          fontFamily: FONT_FAMILY_PRIMARY,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  status != null && status == 'PENDING'
                      ? Positioned(
                          top: 40,
                          right: 5,
                          child: Badge(
                            toAnimate: false,
                            shape: BadgeShape.square,
                            borderRadius: BorderRadius.circular(15),
                            badgeColor: Color(COLOR_YELLOW),
                            elevation: 0,
                            badgeContent: Text(
                              status,
                              style: TextStyle(
                                fontFamily: FONT_FAMILY_PRIMARY,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        )
                      : Badge(
                          toAnimate: false,
                          shape: BadgeShape.square,
                          borderRadius: BorderRadius.circular(15),
                          badgeColor: Color(COLOR_YELLOW),
                          badgeContent: Text(
                            status,
                            style: TextStyle(fontFamily: FONT_FAMILY_PRIMARY),
                          ),
                        ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Icon(
                                  Icons.tag,
                                  size: 18,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 3),
                                  child: Text(
                                    'Reference No: ' + referenceNo,
                                    style: TextStyle(
                                      fontFamily: FONT_FAMILY_PRIMARY,
                                      fontSize: 17,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Icon(
                                  Icons.calendar_today,
                                  size: 18,
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 3, left: 2),
                                  child: Text(
                                    DateFormat('yyyy-MM-dd hh:mm a')
                                        .format(createdDateTime),
                                    style: TextStyle(
                                      fontFamily: FONT_FAMILY_PRIMARY,
                                      fontSize: 17,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Icon(
                                  Icons.location_city,
                                  size: 18,
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 3, left: 2),
                                  child: Text(
                                    bankName + ' - ' + branchName,
                                    style: TextStyle(
                                      fontFamily: FONT_FAMILY_PRIMARY,
                                      fontSize: 17,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Icon(
                                  Icons.create,
                                  size: 18,
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 3, left: 2),
                                  child: Text(
                                    'Refund Remarks: ' + refundRemarks,
                                    style: TextStyle(
                                      fontFamily: FONT_FAMILY_PRIMARY,
                                      fontSize: 17,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Icon(
                                  Icons.money,
                                  size: 26,
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 3, left: 2),
                                  child: Text(
                                    'Refund Amount: Rs.' +
                                        amount.toDouble().toStringAsFixed(2),
                                    style: TextStyle(
                                      fontFamily: FONT_FAMILY_PRIMARY,
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          : Card(
              color: Color(COLOR_SECONDARY),
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Stack(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(0),
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                          top: 10,
                          right: 5,
                          child: Badge(
                            toAnimate: false,
                            shape: BadgeShape.square,
                            borderRadius: BorderRadius.circular(15),
                            badgeColor: Colors.black,
                            elevation: 0,
                            badgeContent: Text(
                              'MOBILE REFUND',
                              style: TextStyle(
                                fontFamily: FONT_FAMILY_PRIMARY,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        status != null && status == 'PENDING'
                            ? Positioned(
                                top: 40,
                                right: 5,
                                child: Badge(
                                  toAnimate: false,
                                  shape: BadgeShape.square,
                                  borderRadius: BorderRadius.circular(15),
                                  badgeColor: Color(COLOR_YELLOW),
                                  elevation: 0,
                                  badgeContent: Text(
                                    status,
                                    style: TextStyle(
                                      fontFamily: FONT_FAMILY_PRIMARY,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              )
                            : Badge(
                                toAnimate: false,
                                shape: BadgeShape.square,
                                borderRadius: BorderRadius.circular(15),
                                badgeColor: Color(COLOR_YELLOW),
                                badgeContent: Text(
                                  status,
                                  style: TextStyle(
                                      fontFamily: FONT_FAMILY_PRIMARY),
                                ),
                              ),
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            children: <Widget>[
                              Column(
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Icon(
                                        Icons.tag,
                                        size: 18,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 3),
                                        child: Text(
                                          'Reference No: ' + referenceNo,
                                          style: TextStyle(
                                            fontFamily: FONT_FAMILY_PRIMARY,
                                            fontSize: 17,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Icon(
                                        Icons.calendar_today,
                                        size: 18,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 3, left: 2),
                                        child: Text(
                                          DateFormat('yyyy-MM-dd hh:mm a')
                                              .format(createdDateTime),
                                          style: TextStyle(
                                            fontFamily: FONT_FAMILY_PRIMARY,
                                            fontSize: 17,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Icon(
                                        Icons.create,
                                        size: 18,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 3, left: 2),
                                        child: Text(
                                          'Refund Remarks: ' + refundRemarks,
                                          style: TextStyle(
                                            fontFamily: FONT_FAMILY_PRIMARY,
                                            fontSize: 17,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Icon(
                                        Icons.money,
                                        size: 26,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 3, left: 2),
                                        child: Text(
                                          'Refund Amount: Rs.' +
                                              amount
                                                  .toDouble()
                                                  .toStringAsFixed(2),
                                          style: TextStyle(
                                            fontFamily: FONT_FAMILY_PRIMARY,
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
