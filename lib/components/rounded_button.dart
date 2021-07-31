import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final Function action;
  final Color color = Colors.red;
  final Color textColor = Colors.white;

  const RoundedButton({Key key, this.text, this.action}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 0),
      height: MediaQuery.of(context).size.height * 0.072,
      width: MediaQuery.of(context).size.width * 0.4,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: FlatButton(
          padding: EdgeInsets.symmetric(vertical: 18, horizontal: 20),
          color: color,
          onPressed: action,
          child: Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(right: 10),
                child: Text(
                  text,
                  style: TextStyle(
                      color: textColor,
                      fontFamily: 'Larsseit',
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Icon(
                Icons.near_me,
                color: Colors.white,
                size: 28,
              )
            ],
          ),
        ),
      ),
    );
  }
}
