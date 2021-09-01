import 'package:crypto_journal_mobile/shared/theme/constants.dart';
import 'package:flutter/material.dart';

class BaseLayoutContainer extends StatelessWidget {
  final Widget Function(BuildContext, double)? builder;
  final Widget? child;

  const BaseLayoutContainer({
    Key? key,
    this.builder,
    this.child,
  }) : super(key: key);

  Widget _build(BuildContext context, double size) {
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
      aspectRatio: defaultWidth / defaultHeight,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final currHeight = constraints.maxHeight;

          return this._build(context, currHeight);
        },
      ),
    );
  }
}
