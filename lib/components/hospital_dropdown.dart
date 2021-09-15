import 'package:dialog_doc990_mobile/constants.dart';
import 'package:flutter/material.dart';

class UnderLineHospitalDropDownFeild extends StatefulWidget {
  final ValueChanged<String> onChange;
  final String text;
  final String iconText;
  final bool isRequiredFeild;

  const UnderLineHospitalDropDownFeild({
    Key key,
    this.onChange,
    this.text,
    this.iconText,
    this.isRequiredFeild,
  });

  @override
  _UnderLineHospitalDropDownFeildState createState() =>
      _UnderLineHospitalDropDownFeildState(
        onChange: onChange,
        text: text,
        iconText: iconText,
        isRequiredFeild: isRequiredFeild,
      );
}

class _UnderLineHospitalDropDownFeildState
    extends State<UnderLineHospitalDropDownFeild> {
  final ValueChanged<String> onChange;
  final String text;
  final String iconText;
  final bool isRequiredFeild;

  _UnderLineHospitalDropDownFeildState({
    this.onChange,
    this.text,
    this.iconText,
    this.isRequiredFeild,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
  'hospital 1',
  'Asia Hospital - Kotte',
  'Asia Hospital - Maharagama',
  'Asiri Central Hospital - Colombo 10',
  'Asiri Hospital - Galle',
  'Asiri Hospital - Kandy',
  'Body Doc Medicare - Malabe',
  'CDEM Hospital - Colombo 10',
];
