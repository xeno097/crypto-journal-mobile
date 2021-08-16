import 'package:crypto_journal_mobile/shared/theme/text_styles.dart';
import "package:flutter/material.dart";

class DatePickerInput extends StatefulWidget {
  final Function(DateTime) onChanged;

  const DatePickerInput({
    Key? key,
    required this.onChanged,
  }) : super(key: key);

  @override
  _DatePickerInputState createState() => _DatePickerInputState();
}

class _DatePickerInputState extends State<DatePickerInput> {
  DateTime _selectedDate = DateTime.now();

  void _showDatePicker(BuildContext context) async {
    final DateTime? date = await showDatePicker(
      context: context,
      initialDate: this._selectedDate, // Refer step 1
      firstDate: DateTime(2008),
      lastDate: DateTime.now(),
    );

    this._setDate(date);
  }

  void _setDate(DateTime? date) {
    if (date != null && date != _selectedDate)
      setState(
        () {
          this._selectedDate = date;
          this.widget.onChanged(this._selectedDate);
        },
      );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async => this._showDatePicker(context),
      child: Text(
        "${_selectedDate.day}/${_selectedDate.month}/${_selectedDate.year}",
        style: defaultTextStyle,
      ),
    );
  }
}
