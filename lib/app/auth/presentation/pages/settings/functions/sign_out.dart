import 'package:crypto_journal_mobile/app/auth/presentation/pages/login/login_page.dart';
import 'package:crypto_journal_mobile/app/auth/presentation/providers/sign_out_provider.dart';
import 'package:crypto_journal_mobile/shared/widgets/snackbars/error_snackbar.dart';
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

void signOut(BuildContext context) async {
  final signOutResult = await context.read(signOutProvider.future);

  switch (signOutResult) {
    case SignOutResult.SignedOut:
      Navigator.pushNamedAndRemoveUntil(
        context,
        LoginPage.route,
        (route) => false,
      );

      break;
    default:
      ScaffoldMessenger.of(context).showSnackBar(
        buildErrorSnackBar(
          message: mapSignOutResultToErrorMessage(signOutResult),
        ),
      );
  }
}
