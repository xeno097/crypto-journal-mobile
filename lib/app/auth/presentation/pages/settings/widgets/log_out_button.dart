import 'package:crypto_journal_mobile/app/auth/presentation/pages/settings/functions/sign_out.dart';
import 'package:crypto_journal_mobile/shared/theme/colors.dart';
import 'package:crypto_journal_mobile/shared/widgets/buttons/base_button.dart';
import 'package:crypto_journal_mobile/shared/widgets/buttons/default_text_button.dart';
import "package:flutter/material.dart";

class LogOutButton extends StatelessWidget {
  const LogOutButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTextButton(
      text: "Log out",
      width: ButtonWidth.Small,
      color: googleButtonBackGroundColor,
      onTap: () async => signOut(context),
    );
  }
}
