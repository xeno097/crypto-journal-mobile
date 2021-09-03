import 'package:crypto_journal_mobile/app/user/presentation/pages/login/widgets/about_button.dart';
import 'package:crypto_journal_mobile/app/user/presentation/pages/login/widgets/sign_in_with_facebook_button.dart';
import 'package:crypto_journal_mobile/app/user/presentation/pages/login/widgets/sign_in_with_google_button.dart';
import 'package:crypto_journal_mobile/shared/theme/constants.dart';
import 'package:crypto_journal_mobile/shared/widgets/containers/default_list_element_padding.dart';
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
