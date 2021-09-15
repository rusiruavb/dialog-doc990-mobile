import 'package:dialog_doc990_mobile/constants.dart';
import 'package:flutter/material.dart';

class UnderLineSpecializationDropDownFeild extends StatefulWidget {
  final ValueChanged<String> onChange;
  final String text;
  final String iconText;
  final bool isRequiredFeild;

  const UnderLineSpecializationDropDownFeild({
    Key key,
    this.onChange,
    this.text,
    this.iconText,
    this.isRequiredFeild,
  });

  @override
  _UnderLineSpecializationDropDownFeildState createState() =>
      _UnderLineSpecializationDropDownFeildState(
        onChange: onChange,
        text: text,
        iconText: iconText,
        isRequiredFeild: isRequiredFeild,
      );
}

class _UnderLineSpecializationDropDownFeildState
    extends State<UnderLineSpecializationDropDownFeild> {
  final ValueChanged<String> onChange;
  final String text;
  final String iconText;
  final bool isRequiredFeild;

  _UnderLineSpecializationDropDownFeildState({
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
          items: specializations
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
              fontFamily: FONT_FAMILY_PRIMARY,
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
