import 'package:dialog_doc990_mobile/constants.dart';
import 'package:flutter/material.dart';

class RoundedTextFeild extends StatefulWidget {
  final ValueChanged<String> onChange;
  final bool isPassword;
  final String text;
  final bool isNumber;
  final IconData icon;
  final String value;
  final bool isPhoneNumber;
  final bool isRequiredFeild;
  const RoundedTextFeild({
    Key key,
    this.onChange,
    this.isPassword,
    this.isNumber,
    this.icon,
    this.value,
    this.text,
    this.isPhoneNumber = false,
    this.isRequiredFeild,
  }) : super(key: key);
  @override
  _RoundedTextFeildState createState() => _RoundedTextFeildState(
        isNumber: isNumber,
        icon: icon,
        isPassword: isPassword,
        isPhoneNumber: isPhoneNumber,
        onChange: onChange,
        text: text,
        value: value,
        isRequiredFeild: isRequiredFeild,
      );
}

class _RoundedTextFeildState extends State<RoundedTextFeild> {
  final ValueChanged<String> onChange;
  final bool isPassword;
  final String text;
  final bool isNumber;
  final String value;
  final IconData icon;
  final bool isPhoneNumber;
  final bool isRequiredFeild;
  bool _isFieldValid;
  bool _isObscure = true;
  _RoundedTextFeildState({
    Key key,
    this.onChange,
    this.isPassword,
    this.isNumber,
    this.icon,
    this.value,
    this.text,
    this.isPhoneNumber = false,
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
              fontSize: 18,
              fontWeight: FontWeight.normal,
            ),
            textAlign: TextAlign.left,
          ),
          SizedBox(
            height: size.height * 0.005,
          ),
          TextFieldContainer(
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
              obscureText: isPassword ? _isObscure : false,
              maxLength: isPhoneNumber ? 10 : 200,
              keyboardType:
                  isNumber ? TextInputType.number : TextInputType.text,
              style: TextStyle(fontFamily: FONT_FAMILY_PRIMARY, fontSize: 20),
              onChanged: onChange,
              decoration: InputDecoration(
                border: InputBorder.none,
                counterText: '',
                suffixIcon: isPassword
                    ? IconButton(
                        icon: Align(
                          alignment: Alignment.centerRight,
                          child: Icon(
                            _isObscure
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Color(0xff4a4a4a),
                          ),
                        ),
                        onPressed: () {
                          setState(() {
                            _isObscure = !_isObscure;
                          });
                        },
                      )
                    : IconButton(
                        icon: Align(
                          child: Icon(
                            icon,
                            color: Color(INPUT_ICON_COLOR),
                          ),
                          alignment: Alignment.centerRight,
                        ),
                        onPressed: () {},
                      ),
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

class TextFieldContainer extends StatelessWidget {
  final Widget child;
  const TextFieldContainer({Key key, this.child}) : super(key: key);

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
