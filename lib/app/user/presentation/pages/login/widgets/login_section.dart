import 'package:crypto_journal_mobile/app/user/presentation/pages/home/home_page.dart';
import 'package:crypto_journal_mobile/app/user/presentation/providers/sign_in_provider.dart';
import 'package:crypto_journal_mobile/shared/theme/colors.dart';
import 'package:crypto_journal_mobile/shared/theme/constants.dart';
import 'package:crypto_journal_mobile/shared/theme/text_styles.dart';
import 'package:crypto_journal_mobile/shared/widgets/buttons/base_button.dart';
import 'package:crypto_journal_mobile/shared/widgets/buttons/default_text_button.dart';
import 'package:crypto_journal_mobile/shared/widgets/containers/base_layout_container.dart';
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
          DefaultTextButton(
            text: "Sign in with google",
            width: ButtonWidth.Half,
            color: googleButtonBackGroundColor,
            onTap: () async => this._signIn(context),
          ),
          DefaultTextButton(
            text: "Sign in with Facebook",
            width: ButtonWidth.Half,
            color: facebookButtonBackGroundColor,
            onTap: () async => this._signIn(context),
          ),
          DefaultTextButton(
            text: "About the app",
            width: ButtonWidth.Half,
            hasDecoration: false,
            fontSizeProp: secondaryTextStyleSize,
            onTap: () async => {},
          ),
        ],
      ),
    );
  }
}
