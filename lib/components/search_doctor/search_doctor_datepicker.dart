import 'package:dialog_doc990_mobile/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';

class SearchDoctorDatePickerField extends StatefulWidget {
  final ValueChanged<DateTime> onChange;
  final String text;
  final bool isRequiredFeild;

  const SearchDoctorDatePickerField({
    Key key,
    this.onChange,
    this.text,
    this.isRequiredFeild,
  });

  @override
  _SearchDoctorDatePickerFieldState createState() =>
      _SearchDoctorDatePickerFieldState(
        onChange: onChange,
        text: text,
        isRequiredFeild: isRequiredFeild,
      );
}

class _SearchDoctorDatePickerFieldState
    extends State<SearchDoctorDatePickerField> {
  final ValueChanged<DateTime> onChange;
  final String text;
  final bool isRequiredFeild;
  var date = '';

  _SearchDoctorDatePickerFieldState({
    this.onChange,
    this.text,
    this.isRequiredFeild,
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
              fontFamily: FONT_FAMILY_PRIMARY,
              fontSize: 14,
              fontWeight: FontWeight.normal,
            ),
            textAlign: TextAlign.left,
          ),
          SizedBox(
            height: size.height * 0.005,
          ),
          SearchDoctorDateContainer(
            child: TextFormField(
              initialValue: date,
              style: TextStyle(fontFamily: FONT_FAMILY_PRIMARY),
              onTap: () {
                FocusScope.of(context).requestFocus(new FocusNode());
                DatePicker.showDatePicker(
                  context,
                  showTitleActions: true,
                  onChanged: (data) {},
                  onConfirm: (selectedDate) {
                    onChange(selectedDate);
                    setState(() {
                      date = DateFormat('yyyy-MM-dd').format(selectedDate);
                    });
                  },
                );
              },
              decoration: InputDecoration(
                hintText: date != ''
                    ? Text(
                        date,
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ).data.toString()
                    : Text(
                        'Any Date',
                        style: TextStyle(
                          fontFamily: FONT_FAMILY_PRIMARY,
                          fontSize: 18,
                          color: Colors.grey[600],
                        ),
                      ).data.toString(),
                hintStyle: date != ''
                    ? TextStyle(color: Colors.black)
                    : TextStyle(color: Colors.grey),
                contentPadding: EdgeInsets.only(
                  left: 2,
                  top: 2,
                ),
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SearchDoctorDateContainer extends StatelessWidget {
  final Widget child;
  const SearchDoctorDateContainer({Key key, this.child}) : super(key: key);

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
