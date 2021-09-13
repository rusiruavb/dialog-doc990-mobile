import 'package:dialog_doc990_mobile/constants.dart';
import 'package:flutter/material.dart';

class UnderLineDropDownFeild extends StatefulWidget {
  final ValueChanged<String> onChange;
  final String text;
  final String iconText;
  final bool isRequiredFeild;
  final bool isHospital;
  final bool isSpecialization;

  const UnderLineDropDownFeild({
    Key key,
    this.onChange,
    this.text,
    this.iconText,
    this.isRequiredFeild,
    this.isHospital,
    this.isSpecialization,
  });

  @override
  _UnderLineDropDownFeildState createState() => _UnderLineDropDownFeildState(
        onChange: onChange,
        text: text,
        iconText: iconText,
        isRequiredFeild: isRequiredFeild,
        isHospital: isHospital,
        isSpecialization: isSpecialization,
      );
}

class _UnderLineDropDownFeildState extends State<UnderLineDropDownFeild> {
  final ValueChanged<String> onChange;
  final String text;
  final String iconText;
  final bool isRequiredFeild;
  final bool isHospital;
  final bool isSpecialization;

  _UnderLineDropDownFeildState({
    this.onChange,
    this.text,
    this.iconText,
    this.isRequiredFeild,
    this.isHospital,
    this.isSpecialization,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          isHospital != null && isHospital
              ? Container(
                  padding: EdgeInsets.only(top: 20),
                  child: UnderlineDropDownContainer(
                    child: DropdownButtonFormField<String>(
                      items: hospitals
                          .map(
                            (item) => DropdownMenuItem(
                              child: Text(
                                item,
                                style: TextStyle(
                                  fontFamily: FONT_FAMILY_PRIMARY,
                                ),
                              ),
                              value: item,
                            ),
                          )
                          .toList(),
                      hint: Text(
                        text,
                        style: TextStyle(
                          fontFamily: 'Larsseit',
                          fontSize: 15,
                          color: Colors.grey[600],
                        ),
                      ),
                      decoration: InputDecoration(
                        prefixIcon: Padding(
                          padding: EdgeInsets.only(
                            top: 14,
                            left: 8,
                            bottom: 0,
                          ),
                          child: Text(
                            iconText,
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ),
                        contentPadding: EdgeInsets.only(
                          left: 0,
                          top: 20,
                          bottom: 0,
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xffe62a29),
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xffe62a29),
                          ),
                        ),
                      ),
                      onChanged: onChange,
                    ),
                  ),
                )
              : Text(''),
          isSpecialization != null && isSpecialization
              ? Container(
                  padding: EdgeInsets.only(top: 0),
                  child: UnderlineDropDownContainer(
                    child: DropdownButtonFormField<String>(
                      items: specializations
                          .map(
                            (item) => DropdownMenuItem(
                              child: Text(
                                item,
                                style: TextStyle(
                                  fontFamily: 'Larsseit',
                                ),
                              ),
                              value: item,
                            ),
                          )
                          .toList(),
                      hint: Text(
                        text,
                        style: TextStyle(
                          fontFamily: 'Larsseit',
                          fontSize: 15,
                          color: Colors.grey[600],
                        ),
                      ),
                      decoration: InputDecoration(
                        prefixIcon: Padding(
                          padding: EdgeInsets.only(
                            top: 14,
                            left: 8,
                          ),
                          child: Text(
                            iconText,
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ),
                        contentPadding: EdgeInsets.only(
                          left: 0,
                          top: 20,
                          bottom: 0,
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xffe62a29),
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xffe62a29),
                          ),
                        ),
                      ),
                      onChanged: onChange,
                    ),
                  ),
                )
              : Text(''),
        ],
      ),
    );
  }
}

class UnderlineDropDownContainer extends StatelessWidget {
  final Widget child;

  const UnderlineDropDownContainer({
    Key key,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
      ),
      child: child,
    );
  }
}

List<String> hospitals = [
  'Any Hospital',
  'Asia Hospital - Kotte',
  'Asia Hospital - Maharagama',
  'Asiri Central Hospital - Colombo 10',
  'Asiri Hospital - Galle',
  'Asiri Hospital - Kandy',
  'Body Doc Medicare - Malabe',
  'CDEM Hospital - Colombo 10',
];

List<String> specializations = [
  'Allergy and immunology',
  'Anesthesiology',
  'Dermatology',
  'Diagnostic radiology',
  'Emergency medicine',
  'Family medicine',
  'Internal medicine',
  'Medical genetics',
  'Neurology',
  'Nuclear medicine',
  'Obstetrics and gynecology',
  'Ophthalmology',
  'Pathology',
  'Pediatrics',
  'Physical medicine and rehabilitation',
  'Preventive medicine',
  'Psychiatry',
  'Radiation oncology',
  'Surgery',
  'Urology',
];
