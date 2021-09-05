import 'package:crypto_journal_mobile/shared/theme/constants.dart';
import 'package:crypto_journal_mobile/shared/theme/text_styles.dart';
import 'package:crypto_journal_mobile/shared/widgets/containers/base_layout_container.dart';
import 'package:crypto_journal_mobile/shared/widgets/containers/default_container.dart';
import "package:flutter/material.dart";

class DefaultDatePicker extends StatefulWidget {
  final void Function(DateTime) onChanged;

  const DefaultDatePicker({
    Key? key,
    required this.onChanged,
  }) : super(key: key);

  @override
  _DefaultDatePickerState createState() => _DefaultDatePickerState();
}

class _DefaultDatePickerState extends State<DefaultDatePicker> {
  DateTime? _selectedDate;

  void _showDatePicker(BuildContext context) async {
    final DateTime? date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
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
          this.widget.onChanged(this._selectedDate!);
        },
      );
  }

  Widget _dateTextBuilder(double height) {
    print(this._selectedDate);
    if (this._selectedDate != null) {
      return Text(
        "${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}",
        style: defaultTextStyle.copyWith(
          fontSize: height * subTitleTextStyleSize / defaultHeight,
        ),
      );
    }

    return Text(
      "Date",
      style: defaultTextStyleSecondary.copyWith(
        fontSize: height * subTitleTextStyleSize / defaultHeight,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BaseLayoutContainer(
      builder: (context, size) {
        final height = size.height;

        return GestureDetector(
          onTap: () async => this._showDatePicker(context),
          child: DefaultContainer(
            child: Container(
              alignment: Alignment.centerLeft,
              child: this._dateTextBuilder(height),
            ),
          ),
        );
      },
    );
  }
}
