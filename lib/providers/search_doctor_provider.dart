import 'dart:convert';

import 'package:dialog_doc990_mobile/models/doctor_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../api_endpoints.dart';

class SearchDoctorProvider with ChangeNotifier {
  List<Doctor> filteredDoctors = [];
  List<Doctor> doctors = [];
  Future<List<Doctor>> searchedDoctors;
  Doctor selectedDoctor;
  int noOfCartItem = 0;

  void setSelectedDoctor(Doctor doctor) {
    this.selectedDoctor = doctor;
    print('##### Doctor: ' + selectedDoctor.name);
  }

  Doctor getSelectedDoctor() {
    return this.selectedDoctor;
  }

  void setDoctors(List<Doctor> doctors) {
    print('DATA: ' + doctors.length.toString());
    this.doctors = doctors;
  }

  List<Doctor> getDoctors() {
    return this.doctors;
  }

  Future<List<Doctor>> sendDotorSearchData(doctorName, specilization,
      selectedDate, hospitalName, BuildContext context) async {
    filteredDoctors = [];
    final responseData = await http.post(Uri.parse(GET_SEARCHED_DOCTORS),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'name': doctorName,
          'specialization': specilization,
          'date': selectedDate,
          'hospital': hospitalName,
        }));

    if (responseData.statusCode == 200) {
      notifyListeners();
      final doctors = jsonDecode(responseData.body)['data']['doctors'] as List;

      for (var doctor in doctors) {
        var newDoctor = Doctor.fromJson(doctor);
        var doctorInstance = Doctor(
          name: newDoctor.name,
          appointments: newDoctor.appointments,
          availableDetails: newDoctor.availableDetails,
          notes: newDoctor.notes,
          specialization: newDoctor.specialization,
          imageUrl: newDoctor.imageUrl,
        );
        filteredDoctors.add(doctorInstance);
      }
      Navigator.pushNamed(context, '/searched-doctors');
      return filteredDoctors;
    } else {
      print('No data');
      return null;
    }
  }

  Future<List<Doctor>> getSearchedDoctors() {
    if (filteredDoctors.length > 0) {
      return filteredDoctors as Future<List<Doctor>>;
    } else {
      return null;
    }
  }

  void incrementCardItem() {
    this.noOfCartItem += 1;
  }
}
