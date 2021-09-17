import 'package:crypto_journal_mobile/shared/theme/constants.dart';
import 'package:crypto_journal_mobile/shared/theme/text_styles.dart';
import 'package:crypto_journal_mobile/shared/widgets/containers/base_layout_container.dart';
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
        BaseLayoutContainer(
          heigthProp: loginPageMainTitleSectionHeight,
          builder: (context, size) {
            final height = size.height;

            return Text(
              "Start your hodling journey",
              textAlign: TextAlign.center,
              style: defaultTextStyle.copyWith(
                fontSize: height *
                    mainTitleTextStyleSize /
                    loginPageMainTitleSectionHeight,
              ),
            );
          },
        ),
        BaseLayoutContainer(
          heigthProp: loginPageSubTitleSectionHeight,
          builder: (context, size) {
            final height = size.height;
            final width = size.width;

            return Align(
              child: Container(
                width: width / 2,
                child: Text(
                  "Track your crypto investements",
                  textAlign: TextAlign.center,
                  style: defaultTextStyle.copyWith(
                    fontSize: height *
                        subTitleTextStyleSize /
                        loginPageSubTitleSectionHeight,
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
