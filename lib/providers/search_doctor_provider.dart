import 'dart:convert';

import 'package:dialog_doc990_mobile/models/doctor_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../api_endpoints.dart';

class SearchDoctorProvider with ChangeNotifier {
  List<Doctor> _filteredDoctors = [];

  void sendDotorSearchData(
      doctorName, specilization, selectedDate, hospitalName) async {
    _filteredDoctors = [];
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
      print('THis is testing number 1');
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
        );
        _filteredDoctors.add(doctorInstance);
      }
    } else {
      print('No data');
    }
  }

  List<Doctor> getSearchedDoctors() {
    if (_filteredDoctors.length > 0) {
      return _filteredDoctors;
    }
  }
}
