import 'package:dialog_doc990_mobile/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';

class UnderlineDatePickerField extends StatefulWidget {
  final ValueChanged<DateTime> onChange;
  final String text;
  final String iconText;
  final bool isRequiredFeild;

  const UnderlineDatePickerField({
    Key key,
    this.onChange,
    this.text,
    this.iconText,
    this.isRequiredFeild,
  });

  @override
  _UnderlineDatePickerFieldState createState() =>
      _UnderlineDatePickerFieldState(
        onChange: onChange,
        text: text,
        iconText: iconText,
        isRequiredFeild: isRequiredFeild,
      );
}

class _UnderlineDatePickerFieldState extends State<UnderlineDatePickerField> {
  final ValueChanged<DateTime> onChange;
  final String text;
  final String iconText;
  final bool isRequiredFeild;
  var date = '';

  _UnderlineDatePickerFieldState({
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
            initialValue: date,
            style: TextStyle(fontFamily: FONT_FAMILY_PRIMARY),
            decoration: InputDecoration(
              hintText: date != ''
                  ? Text(
                      date,
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ).data.toString()
                  : text,
              hintStyle: date != ''
                  ? TextStyle(color: Colors.black)
                  : TextStyle(color: Colors.grey),
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
            onTap: () {
              FocusScope.of(context).requestFocus(new FocusNode());
              DatePicker.showDatePicker(context,
                  showTitleActions: true,
                  onChanged: (data) {}, onConfirm: (selectedDate) {
                onChange(selectedDate);
                setState(() {
                  date = DateFormat('yyyy-MM-dd').format(selectedDate);
                });
              });
            },
          ),
        ],
      ),
    );
  }
}
