import 'package:crypto_journal_mobile/app/user/presentation/pages/login/login_page.dart';
import 'package:crypto_journal_mobile/app/auth/presentation/providers/sign_out_provider.dart';
import 'package:crypto_journal_mobile/shared/theme/colors.dart';
import 'package:crypto_journal_mobile/shared/widgets/buttons/default_text_button.dart';
import "package:flutter/material.dart";
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LogOutButton extends StatelessWidget {
  const LogOutButton({Key? key}) : super(key: key);

  void _signOut(BuildContext context) async {
    final signOut = await context.read(signOutProvider.future);

    if (!signOut) {
      print("ERROR");
    }

    Navigator.pushNamedAndRemoveUntil(
      context,
      LoginPage.route,
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTextButton(
      text: "Log out",
      width: ButtonWidth.Small,
      color: googleButtonBackGroundColor,
      onTap: () async => this._signOut(context),
    );
  }
}
