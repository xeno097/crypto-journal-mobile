import 'package:crypto_journal_mobile/app/auth/presentation/providers/sign_in_provider.dart';
import 'package:crypto_journal_mobile/app/auth/service/dtos/sign_in_dto.dart';
import 'package:crypto_journal_mobile/app/user/presentation/pages/home/home_page.dart';
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

void signIn(
  BuildContext context,
  SIGN_IN_PROVIDER provider,
) async {
  final res = await context.read(signInProvider(
    SignInDto(provider: provider),
  ).future);

  if (res == SignInResult.SignedIn) {
    Navigator.pushNamedAndRemoveUntil(
        context, HomePage.route, (route) => false);
  }
}
