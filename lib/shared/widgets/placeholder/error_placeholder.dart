import 'package:crypto_journal_mobile/shared/theme/constants.dart';
import 'package:crypto_journal_mobile/shared/theme/text_styles.dart';
import 'package:crypto_journal_mobile/shared/widgets/containers/base_layout_container.dart';
import "package:flutter/material.dart";

class ErrorPlaceholder extends StatelessWidget {
  const ErrorPlaceholder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: BaseLayoutContainer(
        builder: (context, size) {
          final height = size.height;
          print(height);

          return Center(
            child: Text(
              "An error occured. Try again later",
              style: secondaryTextStyle.copyWith(
                fontSize: height * primaryTextStyleSize / defaultHeight,
              ),
            ),
          );
        },
      ),
    );
  }
}
