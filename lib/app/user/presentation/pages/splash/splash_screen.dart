import 'package:crypto_journal_mobile/app/auth/presentation/pages/login/login_page.dart';
import 'package:crypto_journal_mobile/app/user/presentation/pages/home/home_page.dart';
import 'package:crypto_journal_mobile/app/user/presentation/providers/get_login_status_provider.dart';
import 'package:crypto_journal_mobile/shared/errors/api_error/api_error.dart';
import 'package:crypto_journal_mobile/shared/theme/colors.dart';
import 'package:crypto_journal_mobile/shared/widgets/loading/default_circular_progress_indicator.dart';
import 'package:crypto_journal_mobile/shared/widgets/snackbars/error_snackbar.dart';
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

class SplashScreen extends StatelessWidget {
  static final String route = "/splash";

  const SplashScreen({Key? key}) : super(key: key);

  void _getHomePage(BuildContext context) async {
    final authStatus = await context.read(getLoginStatusProvider.future);

    switch (authStatus) {
      case AuthStatus.SignedIn:
        Navigator.pushReplacementNamed(context, HomePage.route);
        break;

      case AuthStatus.NotSignedIn:
      case AuthStatus.UnauthorizedUserError:
        Navigator.pushReplacementNamed(context, LoginPage.route);
        break;

      case AuthStatus.BlockedUserError:
        ScaffoldMessenger.of(context).showSnackBar(
          buildErrorSnackBar(
            message: BLOCKED_USER_ERROR_MESSAGE,
          ),
        );

        Navigator.pushReplacementNamed(context, LoginPage.route);
        break;

      default:
        ScaffoldMessenger.of(context).showSnackBar(
          buildErrorSnackBar(
            message: mapAuthStatusToErrorMessage(authStatus),
          ),
        );
    }
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
