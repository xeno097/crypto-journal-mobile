import 'package:crypto_journal_mobile/app/auth/presentation/pages/login/functions/sign_in.dart';
import 'package:crypto_journal_mobile/app/auth/service/dtos/sign_in_dto.dart';
import 'package:crypto_journal_mobile/shared/theme/colors.dart';
import 'package:crypto_journal_mobile/shared/widgets/buttons/base_button.dart';
import 'package:crypto_journal_mobile/shared/widgets/buttons/default_text_button.dart';
import "package:flutter/material.dart";

class SignInWithGoogleButton extends StatelessWidget {
  const SignInWithGoogleButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTextButton(
      text: "Sign in with google",
      width: ButtonWidth.Half,
      color: googleButtonBackGroundColor,
      onTap: () async => signIn(
        context,
        SIGN_IN_PROVIDER.GOOGLE,
      ),
    );
  }
}
