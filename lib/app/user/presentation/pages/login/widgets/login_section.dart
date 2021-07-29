import 'package:crypto_journal_mobile/shared/theme/colors.dart';
import 'package:crypto_journal_mobile/shared/theme/text_styles.dart';
import 'package:crypto_journal_mobile/shared/widgets/buttons/base_button.dart';
import 'package:crypto_journal_mobile/shared/widgets/containers/layout_container.dart';
import "package:flutter/material.dart";

class LoginSection extends StatelessWidget {
  const LoginSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: BaseButton(
              backGroundColor: googleButtonBackGroundColor,
              child: Center(
                child: Text(
                  "Sign in with google",
                  style: defaultTextStyle,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10.0,
            ),
            child: BaseButton(
              backGroundColor: facebookButtonBackGroundColor,
              child: Center(
                child: Text(
                  "Sign in with Facebook",
                  style: defaultTextStyle,
                ),
              ),
            ),
          ),
          LayoutContainer(
            height: 40.0,
            child: Center(
              child: Text(
                "About the app",
                style: secondaryTextStyle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
