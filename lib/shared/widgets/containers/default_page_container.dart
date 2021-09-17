import 'package:crypto_journal_mobile/shared/theme/constants.dart';
import "package:flutter/material.dart";

class DefaultPageContainer extends StatelessWidget {
  final Widget child;

  const DefaultPageContainer({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: defaultPagePadding,
        ),
        child: this.child,
      ),
    );
  }
}
