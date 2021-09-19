import 'package:dialog_doc990_mobile/constants.dart';
import 'package:flutter/material.dart';

class SelectTimeDropdown extends StatefulWidget {
  final ValueChanged<String> onChange;
  final String text;
  final bool isRequiredFeild;
  final String value;

  const SelectTimeDropdown({
    Key key,
    this.isRequiredFeild,
    this.onChange,
    this.text,
    this.value,
  }) : super(key: key);

  @override
  _SelectTimeDropdownState createState() => _SelectTimeDropdownState(
        isRequiredFeild: isRequiredFeild,
        onChange: onChange,
        text: text,
        value: value,
      );
}

class _SelectTimeDropdownState extends State<SelectTimeDropdown> {
  final ValueChanged<String> onChange;
  final String text;
  final bool isRequiredFeild;
  final String value;
  bool _isFieldValid;

  _SelectTimeDropdownState({
    Key key,
    this.isRequiredFeild,
    this.onChange,
    this.text,
    this.value,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            text,
            style: TextStyle(
              fontFamily: FONT_FAMILY_PRIMARY,
              fontSize: 15,
              fontWeight: FontWeight.normal,
            ),
            textAlign: TextAlign.left,
          ),
          SizedBox(
            height: size.height * 0.005,
          ),
          DropDownContainer(
            child: DropdownButtonFormField<String>(
              validator: (value) {
                if (value == null) {
                  value = '';
                }
                if (value.isEmpty) {
                  setState(() {
                    _isFieldValid = false;
                  });
                  return null;
                } else {
                  setState(() {
                    _isFieldValid = true;
                  });
                  return null;
                }
              },
              items: times
                  .map(
                    (item) => DropdownMenuItem(
                      child: Text(
                        item,
                        style: TextStyle(
                          fontFamily: FONT_FAMILY_PRIMARY,
                          fontSize: 18,
                        ),
                      ),
                      value: item,
                    ),
                  )
                  .toList(),
              hint: Text(
                'Select your time',
                style: TextStyle(
                  fontFamily: FONT_FAMILY_PRIMARY,
                  fontSize: 18,
                  color: Colors.grey[600],
                ),
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
              ),
              onChanged: onChange,
            ),
          ),
          isRequiredFeild != null &&
                  isRequiredFeild &&
                  _isFieldValid != null &&
                  !_isFieldValid
              ? Padding(
                  padding: EdgeInsets.only(left: 5),
                  child: Text(
                    text + ' is required!',
                    style: TextStyle(
                      color: Colors.red[800],
                      fontFamily: FONT_FAMILY_PRIMARY,
                      fontSize: 12,
                    ),
                  ),
                )
              : Text(''),
          SizedBox(
            height: size.height * 0.010,
          ),
        ],
      ),
    );
  }
}

class DropDownContainer extends StatelessWidget {
  final Widget child;

  const DropDownContainer({
    Key key,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 18, vertical: 1.5),
      width: size.width * 0.9,
      height: 50,
      decoration: BoxDecoration(
          color: Colors.grey[300], borderRadius: BorderRadius.circular(8)),
      child: child,
    );
  }
}

List<String> times = [
  '8.00 AM',
  '8.30 AM',
  '9.00 AM',
  '9.30 AM',
  '10.00 AM',
  '10.30 AM',
  '11.00 AM',
  '11.30 AM',
  '12.00 PM',
  '12.30 PM',
  '1.00 PM',
  '1.30 PM',
  '2.00 PM',
  '2.30 PM',
  '3.00 PM',
  '3.30 PM',
  '4.00 PM',
  '4.30 PM',
  '5.00 PM',
  '5.30 PM'
];
