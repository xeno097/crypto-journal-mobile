import 'package:crypto_journal_mobile/shared/widgets/containers/default_container.dart';
import "package:flutter/material.dart";

class BaseTileWidget extends StatelessWidget {
  final double? padding;
  final Widget? leading;
  final Widget? trailing;

  const BaseTileWidget({
    Key? key,
    this.leading,
    this.trailing,
    required this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultContainer(
      padding: padding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          this.leading ?? Container(),
          Expanded(
            child: Container(),
          ),
          this.trailing ?? Container(),
        ],
      ),
    );
  }
}
