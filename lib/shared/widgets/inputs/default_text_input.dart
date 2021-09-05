import 'package:crypto_journal_mobile/shared/theme/colors.dart';
import 'package:crypto_journal_mobile/shared/theme/constants.dart';
import 'package:crypto_journal_mobile/shared/theme/text_styles.dart';
import 'package:crypto_journal_mobile/shared/widgets/containers/base_layout_container.dart';
import 'package:crypto_journal_mobile/shared/widgets/containers/default_container.dart';
import "package:flutter/material.dart";

class DefaultTextBoxInput extends StatelessWidget {
  final TextInputType textInputType;
  final void Function(String value)? onChanged;
  final String? Function(String? value)? validator;
  final String? hintText;

  const DefaultTextBoxInput({
    Key? key,
    this.hintText,
    this.textInputType = TextInputType.text,
    this.validator,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseLayoutContainer(
      builder: (context, size) {
        final height = size.height;

        return DefaultContainer(
          child: TextFormField(
            validator: this.validator,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(0),
              border: InputBorder.none,
              hintText: this.hintText,
              hintStyle: defaultTextStyleSecondary.copyWith(
                fontSize: height * subTitleTextStyleSize / defaultHeight,
              ),
            ),
            onChanged: this.onChanged,
            cursorColor: textColorPrimary,
            style: defaultTextStyle.copyWith(
              fontSize: height * subTitleTextStyleSize / defaultHeight,
            ),
          ),
        );
      },
    );
  }
}
