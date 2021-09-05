import 'package:crypto_journal_mobile/shared/theme/constants.dart';
import 'package:crypto_journal_mobile/shared/theme/text_styles.dart';
import 'package:crypto_journal_mobile/shared/widgets/containers/base_layout_container.dart';
import "package:flutter/material.dart";

class SubSectionHeader extends StatelessWidget {
  final String subTitle;

  const SubSectionHeader({
    Key? key,
    required this.subTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: defaultRowItemPadding,
      ),
      child: BaseLayoutContainer(
        heigthProp: subTitleHeight,
        builder: (context, size) {
          final height = size.height;

          return Container(
            alignment: Alignment.centerLeft,
            child: Text(
              this.subTitle,
              style: defaultTextStyle.copyWith(
                fontSize: height * subTitleTextStyleSize / subTitleHeight,
              ),
            ),
          );
        },
      ),
    );
  }
}
