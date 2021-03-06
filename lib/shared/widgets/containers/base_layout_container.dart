import 'package:crypto_journal_mobile/shared/theme/constants.dart';
import 'package:flutter/material.dart';

class BaseLayoutContainer extends StatelessWidget {
  final Widget Function(BuildContext context, Size size)? builder;
  final Widget? child;
  final double heigthProp;
  final double widthProp;

  const BaseLayoutContainer({
    Key? key,
    this.builder,
    this.child,
    this.heigthProp = defaultHeight,
    this.widthProp = defaultWidth,
  }) : super(key: key);

  Widget _build(BuildContext context, Size size) {
    if (this.builder != null) {
      return this.builder!(context, size);
    }

    if (this.child != null) {
      return this.child!;
    }

    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: this.widthProp / this.heigthProp,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final height = constraints.maxHeight;
          final width = constraints.maxWidth;

          return this._build(context, Size(width, height));
        },
      ),
    );
  }
}
