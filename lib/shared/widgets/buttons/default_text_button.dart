import 'package:crypto_journal_mobile/shared/theme/constants.dart';
import 'package:crypto_journal_mobile/shared/theme/text_styles.dart';
import 'package:crypto_journal_mobile/shared/widgets/buttons/base_button.dart';
import "package:flutter/material.dart";

class DefaultTextButton extends StatelessWidget {
  final void Function()? onTap;
  final String text;
  final ButtonWidth width;
  final TextStyle? textStyle;
  final Color? color;
  final bool hasDecoration;
  final double fontSizeProp;

  const DefaultTextButton({
    Key? key,
    this.onTap,
    this.textStyle,
    this.color,
    this.width = ButtonWidth.Half,
    this.hasDecoration = true,
    this.fontSizeProp = primaryTextStyleSize,
    required this.text,
  }) : super(key: key);

  TextStyle _textStyleBuilder(double height) {
    final style = this.textStyle ?? defaultTextStyle;

    return style.copyWith(
      fontSize: height * this.fontSizeProp / defaultHeight,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BaseButton(
      color: this.color,
      hasDecoration: this.hasDecoration,
      key: this.key,
      onTap: this.onTap,
      width: this.width,
      builder: (context, size) {
        final height = size.height;

        return Center(
          child: Text(
            this.text,
            style: this._textStyleBuilder(
              height,
            ),
          ),
        );
      },
    );
  }
}
