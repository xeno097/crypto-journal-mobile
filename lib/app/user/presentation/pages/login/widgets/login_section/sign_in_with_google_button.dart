import 'package:crypto_journal_mobile/app/user/presentation/pages/home/home_page.dart';
import 'package:crypto_journal_mobile/app/auth/presentation/providers/sign_in_provider.dart';
import 'package:crypto_journal_mobile/shared/theme/colors.dart';
import 'package:crypto_journal_mobile/shared/widgets/buttons/default_text_button.dart';

import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:flutter/material.dart";

class SignInWithGoogleButton extends StatelessWidget {
  const SignInWithGoogleButton({Key? key}) : super(key: key);

  void _signIn(BuildContext context) async {
    final res = await context.read(signInProvider.future);

    if (res != null) {
      Navigator.pushNamedAndRemoveUntil(
          context, HomePage.route, (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTextButton(
      text: "Sign in with google",
      width: ButtonWidth.Half,
      color: googleButtonBackGroundColor,
      onTap: () async => this._signIn(context),
    );
  }
}
