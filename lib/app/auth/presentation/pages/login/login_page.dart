import 'package:crypto_journal_mobile/app/auth/presentation/pages/login/widgets/login_section/login_section.dart';
import 'package:crypto_journal_mobile/app/auth/presentation/pages/login/widgets/welcome_section/welcome_section.dart';
import 'package:crypto_journal_mobile/shared/theme/colors.dart';
import 'package:crypto_journal_mobile/shared/widgets/containers/default_page_container.dart';
import 'package:crypto_journal_mobile/shared/widgets/scaffold/default_scaffold.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  static final String route = "/login";

  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      child: Container(
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: defaultBackgroundGradient,
        ),
        child: DefaultPageContainer(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height / 4,
                ),
                WelcomeSection(),
                Container(
                  height: MediaQuery.of(context).size.height / 5,
                ),
                LoginSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
