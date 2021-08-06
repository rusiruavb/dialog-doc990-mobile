import 'package:flutter/material.dart';

class RoundedButton extends StatefulWidget {
  final String text;
  final Function action;
  final Color color = Colors.red;
  final double height;
  final double width;
  final IconData icon;
  final Color textColor = Colors.white;

  const RoundedButton({
    Key key,
    this.text,
    this.action,
    this.height,
    this.width,
    this.icon,
  }) : super(key: key);
  @override
  _RoundedButtonState createState() => _RoundedButtonState(
        action: action,
        height: height,
        icon: icon,
        text: text,
        width: width,
      );
}

class _RoundedButtonState extends State<RoundedButton> {
  final String text;
  final Function action;
  final Color color = Colors.red;
  final double height;
  final double width;
  final IconData icon;
  final Color textColor = Colors.white;

  _RoundedButtonState({
    Key key,
    this.text,
    this.action,
    this.height,
    this.width,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 0),
      height: height,
      width: width,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: FlatButton(
          padding: EdgeInsets.symmetric(vertical: 17.5, horizontal: 22),
          color: color,
          onPressed: action,
          child: Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(right: 0),
                child: Text(
                  text,
                  style: TextStyle(
                    color: textColor,
                    fontFamily: 'Larsseit',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
