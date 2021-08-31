import 'package:crypto_journal_mobile/shared/theme/constants.dart';
import 'package:crypto_journal_mobile/shared/theme/text_styles.dart';
import 'package:flutter/material.dart';

class PageHeader extends StatelessWidget {
  final String title;

  const PageHeader({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: defaultContainerPadding,
      ),
      child: AspectRatio(
        aspectRatio: defaultWidth / defaultHeight,
        child: Container(
          alignment: Alignment.centerLeft,
          child: Text(
            this.title,
            style: boldPageTitleTextStyle,
          ),
        ),
      ),
    );
  }
}
