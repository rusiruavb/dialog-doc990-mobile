import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:flutter/material.dart';

class RoundedDropDownFeild extends StatefulWidget {
  final ValueChanged<String> onChange;
  final String text;
  final bool isRequiredFeild;

  const RoundedDropDownFeild({
    Key key,
    this.isRequiredFeild,
    this.onChange,
    this.text,
  });

  @override
  _RoundedDropDownFeildState createState() => _RoundedDropDownFeildState(
        isRequiredFeild: isRequiredFeild,
        onChange: onChange,
        text: text,
      );
}

class _RoundedDropDownFeildState extends State<RoundedDropDownFeild> {
  final ValueChanged<String> onChange;
  final String text;
  final bool isRequiredFeild;
  String _country = 'Sri Lanka';

  _RoundedDropDownFeildState({
    Key key,
    this.isRequiredFeild,
    this.onChange,
    this.text,
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
              fontFamily: 'Larsseit',
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.left,
          ),
          SizedBox(
            height: size.height * 0.005,
          ),
          DropDownContainer(
            child: DropdownButtonFormField<String>(
              items: data
                  .map(
                    (item) => DropdownMenuItem(
                      child: Text(
                        item,
                        style: TextStyle(
                          fontFamily: 'Larsseit',
                          fontSize: 20,
                        ),
                      ),
                      value: item,
                    ),
                  )
                  .toList(),
              hint: Text('Select your country'),
              decoration: InputDecoration(
                border: InputBorder.none,
              ),
              onChanged: (value) {
                print(value);
              },
            ),
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
      margin: EdgeInsets.symmetric(vertical: 1),
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 3),
      width: size.width * 0.9,
      decoration: BoxDecoration(
          color: Colors.grey[300], borderRadius: BorderRadius.circular(30)),
      child: child,
    );
  }
}

List<String> data = ['Sri Lanka', 'India'];
