import 'package:crypto_journal_mobile/shared/theme/colors.dart';
import 'package:crypto_journal_mobile/shared/theme/text_styles.dart';
import "package:flutter/material.dart";

class BaseTextBoxInput extends StatelessWidget {
  final String? hint;
  final void Function(double) onChanged;

  const BaseTextBoxInput({
    Key? key,
    this.hint,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.number,
      textAlign: TextAlign.center,
      cursorColor: textColorSecondary,
      decoration: InputDecoration(
        isDense: true,
        contentPadding: EdgeInsets.all(0),
        border: InputBorder.none,
        hintText: this.hint,
        hintStyle: defaultTextStyleSecondary,
      ),
      style: defaultTextStyle,
      onChanged: (val) {
        final double value = num.tryParse(val)?.toDouble() ?? 0;

        this.onChanged(value);
      },
    );
  }
}
