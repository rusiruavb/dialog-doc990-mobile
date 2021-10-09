import 'package:dialog_doc990_mobile/models/doctor_model.dart';
import 'package:dialog_doc990_mobile/providers/appointment_provider.dart';
import 'package:dialog_doc990_mobile/providers/search_doctor_provider.dart';
import 'package:dialog_doc990_mobile/screens/appointment_payment/payment_input_form.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants.dart';

class AppointmentPaymentContent extends StatefulWidget {
  @override
  _AppointmentPaymentContentState createState() =>
      _AppointmentPaymentContentState();
}

class _AppointmentPaymentContentState extends State<AppointmentPaymentContent> {
  Doctor doctor;
  @override
  void initState() {
    super.initState();
    doctor = context.read<SearchDoctorProvider>().getSelectedDoctor();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final provider = context.read<AppointmentProvider>();

    return Container(
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(bottom: 10),
                color: Colors.white,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Row(
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.network(
                                  doctor.imageUrl,
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'Dr. ' + doctor.name,
                                  style: TextStyle(
                                    fontFamily: FONT_FAMILY_PRIMARY,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  doctor.specialization,
                                  style: TextStyle(
                                    fontFamily: FONT_FAMILY_PRIMARY,
                                    fontSize: 15,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      doctor.availableDetails[0].hospitalName,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                      softWrap: false,
                                      style: TextStyle(
                                        fontFamily: FONT_FAMILY_PRIMARY,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  doctor.availableDetails[0].dateTime
                                      .split("T")[0],
                                  style: TextStyle(
                                    fontFamily: FONT_FAMILY_PRIMARY,
                                    fontSize: 17,
                                  ),
                                ),
                                Text(
                                  'Active Appointments: ' +
                                      doctor.appointments.toString(),
                                  style: TextStyle(
                                    fontFamily: FONT_FAMILY_PRIMARY,
                                    fontSize: 17,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(left: 5, right: 20, top: 8),
                width: size.width * 0.974,
                child: Card(
                  color: Color(COLOR_SECONDARY),
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 5, bottom: 5, top: 5),
                          child: Row(
                            // Reference No.
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.monetization_on,
                                      size: 20,
                                    ),
                                    Text(
                                      'Doctor Charge: ',
                                      style: TextStyle(
                                        fontFamily: FONT_FAMILY_PRIMARY,
                                        fontSize: 17,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Text(
                                'Rs.' +
                                    provider.doctorCharge.toStringAsFixed(2),
                                style: TextStyle(
                                  fontFamily: FONT_FAMILY_PRIMARY,
                                  fontSize: 17,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 5, bottom: 5, top: 5),
                          child: Row(
                            // Reference No.
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.monetization_on,
                                      size: 20,
                                    ),
                                    Text(
                                      'Hospitl Charge: ',
                                      style: TextStyle(
                                        fontFamily: FONT_FAMILY_PRIMARY,
                                        fontSize: 17,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Text(
                                'Rs.' +
                                    provider.hospitalPrice.toStringAsFixed(2),
                                style: TextStyle(
                                  fontFamily: FONT_FAMILY_PRIMARY,
                                  fontSize: 17,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 5, bottom: 5, top: 5),
                          child: Row(
                            // Reference No.
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.monetization_on,
                                      size: 20,
                                    ),
                                    Text(
                                      'Refund Charge: ',
                                      style: TextStyle(
                                        fontFamily: FONT_FAMILY_PRIMARY,
                                        fontSize: 17,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Text(
                                'Rs.' + provider.refundChage.toStringAsFixed(2),
                                style: TextStyle(
                                  fontFamily: FONT_FAMILY_PRIMARY,
                                  fontSize: 17,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 5, bottom: 5, top: 5),
                          child: Row(
                            // Reference No.
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.monetization_on,
                                      size: 20,
                                    ),
                                    Text(
                                      'Booking Charge: ',
                                      style: TextStyle(
                                        fontFamily: FONT_FAMILY_PRIMARY,
                                        fontSize: 17,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Text(
                                'Rs.' +
                                    provider.bookingCharge.toStringAsFixed(2),
                                style: TextStyle(
                                  fontFamily: FONT_FAMILY_PRIMARY,
                                  fontSize: 17,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Divider(),
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 5, bottom: 5, top: 5),
                          child: Row(
                            // Reference No.
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.local_atm,
                                      size: 28,
                                    ),
                                    Text(
                                      'Total Charge: ',
                                      style: TextStyle(
                                        fontFamily: FONT_FAMILY_PRIMARY,
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Text(
                                'Rs.' +
                                    provider
                                        .calculateTotalPayment()
                                        .toStringAsFixed(2),
                                style: TextStyle(
                                  fontFamily: FONT_FAMILY_PRIMARY,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 10),
                child: Text(
                  'Make Your Payment',
                  style: TextStyle(
                    fontFamily: FONT_FAMILY_PRIMARY,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              CardInputForm(),
            ],
          ),
        ],
      ),
    );
  }
}
