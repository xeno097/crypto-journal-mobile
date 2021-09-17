import 'package:crypto_journal_mobile/shared/theme/constants.dart';
import 'package:crypto_journal_mobile/shared/theme/container_decoration.dart';
import "package:flutter/material.dart";

enum PaddingType {
  Vertical,
  Horizontal,
  All,
}

class DefaultContainer extends StatelessWidget {
  final Widget child;
  final double padding;
  final PaddingType paddingType;

  const DefaultContainer({
    Key? key,
    this.padding = defaultContainerPadding,
    this.paddingType = PaddingType.Horizontal,
    required this.child,
  }) : super(key: key);

  EdgeInsets _paddingBuilder() {
    switch (this.paddingType) {
      case PaddingType.Horizontal:
        return EdgeInsets.symmetric(
          horizontal: this.padding,
        );
      case PaddingType.Vertical:
        return EdgeInsets.symmetric(
          vertical: this.padding,
        );
      case PaddingType.All:
        return EdgeInsets.all(
          this.padding,
        );
      default:
        return EdgeInsets.all(
          this.padding,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: this._paddingBuilder(),
      child: this.child,
      decoration: defaultContainerDecoration,
    );
  }
}
