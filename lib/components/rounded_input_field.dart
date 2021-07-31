import 'package:flutter/material.dart';

class RoundedTextFeild extends StatelessWidget {
  final ValueChanged<String> onChange;
  final bool isPassword;
  final bool isNumber;
  const RoundedTextFeild(
      {Key key, this.onChange, this.isPassword, this.isNumber})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        obscureText: isPassword,
        keyboardType: isNumber ? TextInputType.number : TextInputType.text,
        style: TextStyle(fontFamily: 'Larsseit', fontSize: 20),
        onChanged: onChange,
        decoration: InputDecoration(border: InputBorder.none),
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
      margin: EdgeInsets.symmetric(vertical: 1),
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 3),
      width: size.width * 0.9,
      decoration: BoxDecoration(
          color: Colors.grey[300], borderRadius: BorderRadius.circular(30)),
      child: child,
    );
  }
}
