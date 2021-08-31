import 'package:crypto_journal_mobile/shared/theme/constants.dart';
import 'package:crypto_journal_mobile/shared/theme/container_decoration.dart';
import "package:flutter/material.dart";

class DefaultContainer extends StatelessWidget {
  final Widget child;
  final double? padding;

  const DefaultContainer({
    Key? key,
    this.padding,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: this.padding ?? defaultContainerPadding,
      ),
      child: this.child,
      decoration: defaultContainerDecoration,
    );
  }
}
