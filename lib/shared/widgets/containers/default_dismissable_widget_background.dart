import 'package:crypto_journal_mobile/shared/theme/colors.dart';
import 'package:crypto_journal_mobile/shared/theme/constants.dart';
import 'package:crypto_journal_mobile/shared/theme/text_styles.dart';
import 'package:crypto_journal_mobile/shared/widgets/containers/base_layout_container.dart';
import "package:flutter/material.dart";

class DefaultDismissableWidgetBackground extends StatelessWidget {
  final String label;
  final Color color;

  const DefaultDismissableWidgetBackground({
    Key? key,
    required this.label,
    this.color = googleButtonBackGroundColor,
  }) : super(key: key);

  Widget _buildLabel(double height) {
    return Text(
      this.label,
      style: defaultTextStyle.copyWith(
        fontSize: height * (primaryTextStyleSize / defaultHeight),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: defaultContainerPadding,
      ),
      child: BaseLayoutContainer(
        builder: (context, size) {
          final height = size.height;

          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              this._buildLabel(height),
              this._buildLabel(height),
            ],
          );
        },
      ),
      color: this.color,
    );
  }
}
