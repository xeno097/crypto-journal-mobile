import 'package:crypto_journal_mobile/shared/theme/text_styles.dart';
import 'package:crypto_journal_mobile/shared/widgets/containers/layout_container.dart';
import "package:flutter/material.dart";

class WelcomeSection extends StatelessWidget {
  const WelcomeSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          child: Text(
            " Start your hodling journey",
            textAlign: TextAlign.center,
            style: mainTitleTextStyle,
          ),
        ),
        Expanded(
          child: LayoutContainer(
            child: Text(
              "Track your crypto investements",
              textAlign: TextAlign.center,
              style: subTitleTextStyle,
            ),
          ),
        ),
      ],
    );
  }
}
