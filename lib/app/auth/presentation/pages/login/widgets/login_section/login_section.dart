import 'package:crypto_journal_mobile/app/auth/presentation/pages/login/widgets/login_section/about_button.dart';
import 'package:crypto_journal_mobile/app/auth/presentation/pages/login/widgets/login_section/sign_in_with_facebook_button.dart';
import 'package:crypto_journal_mobile/app/auth/presentation/pages/login/widgets/login_section/sign_in_with_google_button.dart';
import 'package:crypto_journal_mobile/shared/theme/constants.dart';
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
          SignInWithGoogleButton(),
          SizedBox(
            height: defaultListElementPadding,
          ),
          SignInWithFacebookButton(),
          SizedBox(
            height: defaultRowItemPadding,
          ),
          AboutButton(),
        ],
      ),
    );
  }
}
