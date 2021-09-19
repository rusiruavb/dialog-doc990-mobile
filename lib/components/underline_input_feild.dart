import 'package:dialog_doc990_mobile/constants.dart';
import 'package:flutter/material.dart';

class UnderLineTextFeild extends StatefulWidget {
  final ValueChanged<String> onChange;
  final String text;
  final String iconText;
  final bool isRequiredFeild;

  const UnderLineTextFeild({
    Key key,
    this.onChange,
    this.text,
    this.iconText,
    this.isRequiredFeild,
  });

  @override
  _UnderLineTextFeildState createState() => _UnderLineTextFeildState(
        onChange: onChange,
        text: text,
        iconText: iconText,
        isRequiredFeild: isRequiredFeild,
      );
}

class _UnderLineTextFeildState extends State<UnderLineTextFeild> {
  final ValueChanged<String> onChange;
  final String text;
  final String iconText;
  final bool isRequiredFeild;

  _UnderLineTextFeildState({
    this.onChange,
    this.text,
    this.iconText,
    this.isRequiredFeild,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      child: Stack(
        children: <Widget>[
          TextFormField(
            autofocus: true,
            style: TextStyle(fontFamily: FONT_FAMILY_PRIMARY),
            decoration: InputDecoration(
              hintText: text,
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
                left: 2,
                top: 20,
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
        ],
      ),
    );
  }
}
