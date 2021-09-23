import 'package:crypto_journal_mobile/app/auth/presentation/pages/login/login_page.dart';
import 'package:crypto_journal_mobile/app/user/presentation/pages/home/home_page.dart';
import 'package:crypto_journal_mobile/app/user/presentation/providers/user_auth_state.dart';
import 'package:crypto_journal_mobile/app/user/presentation/providers/user_auth_state_notifier.dart';
import 'package:crypto_journal_mobile/shared/widgets/loading/default_circular_progress_indicator.dart';
import 'package:crypto_journal_mobile/shared/widgets/scaffold/default_scaffold.dart';
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

class SplashScreen extends StatelessWidget {
  static final String route = "/splash";

  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      child: ProviderListener(
        onChange: (
          context,
          UserAuthState state,
        ) {
          if (state is NotLoggedUserAuthState ||
              state is ErrorLoggedUserAuthState) {
            Navigator.pushReplacementNamed(
              context,
              LoginPage.route,
            );
          }

          if (state is LoggedUserAuthState) {
            Navigator.pushReplacementNamed(
              context,
              HomePage.route,
            );
          }
        },
        provider: userAuthStateNotifierProvider,
        child: DefaultCircularProgressIndicator(),
      ),
    );
  }
}
