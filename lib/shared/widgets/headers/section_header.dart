import 'package:crypto_journal_mobile/shared/theme/constants.dart';
import 'package:crypto_journal_mobile/shared/theme/text_styles.dart';
import 'package:crypto_journal_mobile/shared/widgets/containers/base_layout_container.dart';
import 'package:flutter/material.dart';

enum TitleStyle {
  Primary,
  Secondary,
}

class SectionHeader extends StatelessWidget {
  final String title;
  final Widget? leading;
  final Widget? trailing;
  final TitleStyle? titleStyle;

  const SectionHeader({
    Key? key,
    this.leading,
    this.trailing,
    required this.title,
    this.titleStyle = TitleStyle.Primary,
  }) : super(key: key);

  TextStyle _titleStyleBuilder(double containerHeigth) {
    switch (this.titleStyle) {
      case TitleStyle.Primary:
        return boldDefaultTextStyle.copyWith(
          fontSize: (containerHeigth * pageTitleTextStyleSize / defaultHeight),
        );
      case TitleStyle.Secondary:
        return defaultTextStyle.copyWith(
          fontSize: (containerHeigth * pageTitleTextStyleSize / defaultHeight),
        );

      default:
        return defaultTextStyle.copyWith(
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
      child: BaseLayoutContainer(
        builder: (
          BuildContext context,
          double heigth,
        ) {
          return Row(
            children: [
              this.leading ?? Container(),
              Expanded(
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    this.title,
                    style: this._titleStyleBuilder(heigth),
                  ),
                ),
              ),
              this.trailing ?? Container(),
            ],
          );
        },
      ),
    );
  }
}
