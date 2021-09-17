import 'package:crypto_journal_mobile/app/auth/service/services/auth_service.dart';
import 'package:crypto_journal_mobile/shared/providers/functions/handle_provider_error_result.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum SignOutResult {
  SignedOut,
  SignOutError,
}

final signOutProvider = FutureProvider.autoDispose<SignOutResult>((
  ProviderReference ref,
) async {
  final authService = await ref.read(authServiceProvider.future);

  final res = await authService.signOut();

  return res.fold(
    (err) => handleProviderErrorResult<SignOutResult>(
      ref,
      err,
      callback: () => SignOutResult.SignOutError,
    ),
    (res) => SignOutResult.SignedOut,
  );
});
