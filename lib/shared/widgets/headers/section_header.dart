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
  final Widget Function(BuildContext context, double height)? leadingBuilder;
  final Widget? trailing;
  final Widget Function(BuildContext context, double height)? trailingBuilder;
  final TitleStyle? titleStyle;

  const SectionHeader({
    Key? key,
    this.leading,
    this.leadingBuilder,
    this.trailing,
    this.trailingBuilder,
    required this.title,
    this.titleStyle = TitleStyle.Primary,
  }) : super(key: key);

  TextStyle _titleStyleBuilder(double height) {
    final fontSize = (height * pageTitleTextStyleSize / defaultHeight);

    switch (this.titleStyle) {
      case TitleStyle.Primary:
        return boldDefaultTextStyle.copyWith(
          fontSize: fontSize,
        );
      case TitleStyle.Secondary:
        return defaultTextStyle.copyWith(
          fontSize: fontSize,
        );

      default:
        return defaultTextStyle.copyWith(
          fontSize: fontSize,
        );
    }
  }

  Widget _leadingBuilder(BuildContext context, double height) {
    if (this.leadingBuilder != null) {
      return this.leadingBuilder!(context, height);
    }

    if (this.leading != null) {
      return this.leading!;
    }

    return Container();
  }

  Widget _trailingBuilder(BuildContext context, double height) {
    if (this.trailingBuilder != null) {
      return this.trailingBuilder!(context, height);
    }

    if (this.trailing != null) {
      return this.trailing!;
    }

    return Container();
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
          Size size,
        ) {
          final height = size.height;

          return Row(
            children: [
              this._leadingBuilder(context, height),
              Expanded(
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    this.title,
                    style: this._titleStyleBuilder(height),
                  ),
                ),
              ),
              this._trailingBuilder(context, height),
            ],
          );
        },
      ),
    );
  }
}
