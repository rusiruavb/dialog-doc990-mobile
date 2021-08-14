import 'package:flutter/material.dart';

class SeachDoctorFormScreen extends StatefulWidget {
  @override
  _SeachDoctorFormScreenState createState() => _SeachDoctorFormScreenState();
}

class _SeachDoctorFormScreenState extends State<SeachDoctorFormScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      child: Text('Search Form Widget'),
    );
  }
}
