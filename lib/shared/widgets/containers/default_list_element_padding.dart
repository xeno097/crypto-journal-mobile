import 'package:crypto_journal_mobile/shared/theme/constants.dart';
import "package:flutter/material.dart";

class DefaultListElementPadding extends StatelessWidget {
  final Widget child;
  const DefaultListElementPadding({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: defaultListElementPadding,
      ),
      child: this.child,
    );
  }
}
