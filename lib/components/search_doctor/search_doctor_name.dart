import 'package:dialog_doc990_mobile/constants.dart';
import 'package:flutter/material.dart';

class SearchDoctorTextField extends StatefulWidget {
  final ValueChanged<String> onChange;
  final String text;
  final String value;
  final bool isRequiredFeild;
  const SearchDoctorTextField({
    Key key,
    this.onChange,
    this.value,
    this.text,
    this.isRequiredFeild,
  }) : super(key: key);
  @override
  _SearchDoctorTextFieldState createState() => _SearchDoctorTextFieldState(
        onChange: onChange,
        text: text,
        value: value,
        isRequiredFeild: isRequiredFeild,
      );
}

class _SearchDoctorTextFieldState extends State<SearchDoctorTextField> {
  final ValueChanged<String> onChange;
  final String text;
  final String value;
  final bool isRequiredFeild;
  bool _isFieldValid;
  _SearchDoctorTextFieldState({
    Key key,
    this.onChange,
    this.value,
    this.text,
    this.isRequiredFeild,
  });
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text,
            style: TextStyle(
              fontFamily: FONT_FAMILY_PRIMARY,
              fontSize: 14,
              fontWeight: FontWeight.normal,
            ),
            textAlign: TextAlign.left,
          ),
          SizedBox(
            height: size.height * 0.005,
          ),
          SearchDoctorTextFieldContainer(
            child: TextFormField(
              initialValue: value,
              validator: (value) {
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
              maxLength: 100,
              keyboardType: TextInputType.text,
              style: TextStyle(
                fontFamily: FONT_FAMILY_PRIMARY,
                fontSize: 16,
              ),
              onChanged: onChange,
              decoration: InputDecoration(
                border: InputBorder.none,
                counterText: '',
              ),
            ),
          ),
          isRequiredFeild != null &&
                  isRequiredFeild &&
                  _isFieldValid != null &&
                  !_isFieldValid
              ? Padding(
                  padding: EdgeInsets.only(left: 5),
                  child: Text(
                    text + ' is required.',
                    style: TextStyle(
                      color: Colors.red[800],
                      fontFamily: FONT_FAMILY_PRIMARY,
                      fontSize: 15,
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

class SearchDoctorTextFieldContainer extends StatelessWidget {
  final Widget child;
  const SearchDoctorTextFieldContainer({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
