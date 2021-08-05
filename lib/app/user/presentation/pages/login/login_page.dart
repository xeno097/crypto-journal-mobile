import 'package:crypto_journal_mobile/app/user/presentation/pages/login/widgets/login_section.dart';
import 'package:crypto_journal_mobile/app/user/presentation/pages/login/widgets/welcome_section.dart';
import 'package:crypto_journal_mobile/shared/theme/colors.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  static final String route = "/login";

  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColorPrimary,
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(
            21.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Container(),
              ),
              Expanded(
                flex: 2,
                child: WelcomeSection(),
              ),
              Expanded(
                flex: 2,
                child: LoginSection(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
