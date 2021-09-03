import 'package:crypto_journal_mobile/app/user/presentation/pages/home/home_page.dart';
import 'package:crypto_journal_mobile/app/user/presentation/pages/login/login_page.dart';
import 'package:crypto_journal_mobile/app/user/presentation/providers/get_login_status_provider.dart';
import 'package:crypto_journal_mobile/shared/theme/colors.dart';
import 'package:crypto_journal_mobile/shared/widgets/loading/default_circular_progress_indicator.dart';
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

class SplashScreen extends StatelessWidget {
  static final String route = "/splash";

  const SplashScreen({Key? key}) : super(key: key);

  void _getHomePage(BuildContext context) async {
    final loginStatus = await context.read(getLoginStatusProvider.future);
    String routeName = loginStatus ? HomePage.route : LoginPage.route;

    Navigator.pushReplacementNamed(context, routeName);
  }

  @override
  Widget build(BuildContext context) {
    this._getHomePage(context);

    return Scaffold(
      backgroundColor: backGroundColorPrimary,
      body: Container(
        decoration: BoxDecoration(
          gradient: defaultBackgroundGradient,
        ),
        child: Center(
          child: DefaultCircularProgressIndicator(),
        ),
      ),
    );
  }
}
