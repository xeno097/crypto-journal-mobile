import 'package:crypto_journal_mobile/shared/theme/text_styles.dart';
import "package:flutter/material.dart";

class BaseRow extends StatelessWidget {
  const BaseRow({
    Key? key,
    this.last,
    required this.label,
    required this.middle,
  }) : super(key: key);

  final String label;
  final Widget? last;
  final Widget middle;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Center(
            child: Text(
              this.label,
              style: defaultTextStyle,
            ),
          ),
        ),
        Expanded(
          flex: this.last == null ? 2 : 1,
          child: Container(),
        ),
        Expanded(
          child: this.middle,
        ),
        this.last == null
            ? Container()
            : Expanded(
                child: this.last!,
              ),
      ],
    );
  }
}
