import 'package:crypto_journal_mobile/shared/theme/constants.dart';
import 'package:crypto_journal_mobile/shared/theme/text_styles.dart';
import 'package:flutter/material.dart';

enum TitleStyle {
  Primary,
  Secondary,
}

class SectionHeader extends StatelessWidget {
  final String title;
  final TitleStyle? titleStyle;

  const SectionHeader({
    Key? key,
    this.titleStyle = TitleStyle.Primary,
    required this.title,
  }) : super(key: key);

  TextStyle _titleStyleBuilder(double containerHeigth) {
    switch (this.titleStyle) {
      case TitleStyle.Primary:
        return boldPageTitleTextStyle.copyWith(
          fontSize: (containerHeigth * pageTitleTextStyleSize / defaultHeight),
        );
      case TitleStyle.Secondary:
        return pageTitleTextStyle.copyWith(
          fontSize: (containerHeigth * pageTitleTextStyleSize / defaultHeight),
        );

      default:
        return pageTitleTextStyle.copyWith(
          fontSize: (containerHeigth * pageTitleTextStyleSize / defaultHeight),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: defaultContainerPadding,
      ),
      child: AspectRatio(
        aspectRatio: defaultWidth / defaultHeight,
        child: LayoutBuilder(
          builder: (
            BuildContext context,
            BoxConstraints constraints,
          ) {
            final currHeight = constraints.maxHeight;

            return Container(
              alignment: Alignment.centerLeft,
              child: Text(
                this.title,
                style: this._titleStyleBuilder(currHeight),
              ),
            );
          },
        ),
      ),
    );
  }
}
