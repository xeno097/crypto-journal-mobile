import 'package:crypto_journal_mobile/app/auth/presentation/pages/login/login_page.dart';
import 'package:crypto_journal_mobile/app/user/presentation/pages/home/home_page.dart';
import 'package:crypto_journal_mobile/app/user/presentation/providers/get_login_status_provider.dart';
import 'package:crypto_journal_mobile/shared/widgets/loading/default_circular_progress_indicator.dart';
import 'package:crypto_journal_mobile/shared/widgets/scaffold/default_scaffold.dart';
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

class SplashScreen extends StatefulWidget {
  static final String route = "/splash";

  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    this._getHomePage(context);
  }

  void _getHomePage(BuildContext context) async {
    final authStatus = await context.read(getLoginStatusProvider.future);

    switch (authStatus) {
      case AuthStatus.SignedIn:
        Navigator.pushReplacementNamed(context, HomePage.route);
        break;

      case AuthStatus.NotSignedIn:
      default:
        Navigator.pushReplacementNamed(context, LoginPage.route);
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      child: DefaultCircularProgressIndicator(),
    );
  }
}
