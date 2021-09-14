import 'package:crypto_journal_mobile/app/auth/presentation/pages/login/login_page.dart';
import 'package:crypto_journal_mobile/app/auth/presentation/providers/sign_out_provider.dart';
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

void signOut(BuildContext context) async {
  final signOutResult = await context.read(signOutProvider.future);

  if (signOutResult == SignOutResult.SignedOut) {
    Navigator.pushNamedAndRemoveUntil(
      context,
      LoginPage.route,
      (route) => false,
    );
  }
}
