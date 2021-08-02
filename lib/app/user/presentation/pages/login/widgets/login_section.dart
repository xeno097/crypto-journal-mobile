import 'package:crypto_journal_mobile/app/user/presentation/pages/home/home_page.dart';
import 'package:crypto_journal_mobile/app/user/presentation/providers/sign_in_provider.dart';
import 'package:crypto_journal_mobile/shared/theme/colors.dart';
import 'package:crypto_journal_mobile/shared/theme/text_styles.dart';
import 'package:crypto_journal_mobile/shared/widgets/buttons/base_button.dart';
import 'package:crypto_journal_mobile/shared/widgets/containers/layout_container.dart';
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

class LoginSection extends StatelessWidget {
  const LoginSection({
    Key? key,
  }) : super(key: key);

  void _signIn(BuildContext context) async {
    final res = await context.read(signInProvider.future);

    if (res != null) {
      Navigator.pushNamedAndRemoveUntil(
          context, HomePage.route, (route) => false);
    }
  }

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
              onTap: () async => this._signIn(context),
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
              onTap: () async => this._signIn(context),
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
