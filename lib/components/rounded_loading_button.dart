import 'package:dialog_doc990_mobile/constants.dart';
import 'package:flutter/material.dart';

class RoundedLoadingButton extends StatefulWidget {
  final String text;
  final Function action;
  final Color color = Colors.red;
  final double height;
  final double width;
  final IconData icon;
  final Color textColor = Colors.white;

  const RoundedLoadingButton({
    Key key,
    this.text,
    this.action,
    this.height,
    this.width,
    this.icon,
  }) : super(key: key);
  @override
  _RoundedLoadingButtonState createState() => _RoundedLoadingButtonState(
        action: action,
        height: height,
        icon: icon,
        text: text,
        width: width,
      );
}

class _RoundedLoadingButtonState extends State<RoundedLoadingButton> {
  final String text;
  final Function action;
  final Color color = Color(COLOR_PRIMARY);
  final double height;
  final double width;
  final IconData icon;
  final Color textColor = Colors.white;

  _RoundedLoadingButtonState({
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
        borderRadius: BorderRadius.circular(15),
        child: FlatButton(
          disabledColor: Color(COLOR_PRIMARY_DISABLED),
          disabledTextColor: Colors.white,
          padding: EdgeInsets.symmetric(vertical: 17.5, horizontal: 22),
          color: color,
          onPressed: null,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
                height: 20,
                width: 20,
              ),
              Padding(
                padding: EdgeInsets.only(left: 10),
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
            ],
          ),
        ),
      ),
    );
  }
}
