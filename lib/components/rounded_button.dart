import 'package:dialog_doc990_mobile/constants.dart';
import 'package:flutter/material.dart';

class RoundedButton extends StatefulWidget {
  final String text;
  final Function action;
  final Color color;
  final double height;
  final double width;
  final IconData icon;
  final Color textColor;

  const RoundedButton({
    Key key,
    this.text,
    this.action,
    this.height,
    this.width,
    this.color,
    this.textColor,
    this.icon,
  }) : super(key: key);
  @override
  _RoundedButtonState createState() => _RoundedButtonState(
        action: action,
        height: height,
        icon: icon,
        text: text,
        textColor: textColor,
        width: width,
        color: color,
      );
}

class _RoundedButtonState extends State<RoundedButton> {
  final String text;
  final Function action;
  final Color color;
  final double height;
  final double width;
  final IconData icon;
  final Color textColor;

  _RoundedButtonState({
    this.text,
    this.action,
    this.height,
    this.width,
    this.icon,
    this.textColor,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 0),
      height: height,
      width: width,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: FlatButton(
          padding: EdgeInsets.symmetric(vertical: 17.5, horizontal: 22),
          color: color,
          onPressed: action,
          child: Text(
            text,
            style: TextStyle(
              color: textColor,
              fontFamily: FONT_FAMILY_PRIMARY,
              fontSize: 20,
              fontWeight: FontWeight.w100,
            ),
          ),
        ),
      ),
    );
  }
}
