import 'package:crypto_journal_mobile/app/auth/service/services/auth_service.dart';
import 'package:crypto_journal_mobile/shared/errors/base_error.dart';
import 'package:crypto_journal_mobile/shared/errors/network/network_connection_error.dart';
import 'package:crypto_journal_mobile/shared/errors/unexpected/unexpected_error.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum SignOutResult {
  SignedOut,
  UnexpectedError,
  NetworkConnectionError,
}

SignOutResult _mapErrorsToSignOutResult(BaseError error) {
  if (error is NetworkConnectionError) {
    return SignOutResult.NetworkConnectionError;
  }

  return SignOutResult.UnexpectedError;
}

String mapSignOutResultToErrorMessage(SignOutResult signOutResult) {
  switch (signOutResult) {
    case SignOutResult.NetworkConnectionError:
      return NETWORK_CONNECTION_ERROR;
    case SignOutResult.UnexpectedError:
      return UNEXPECTED_ERROR_MESSAGE;
    default:
      return UNEXPECTED_ERROR_MESSAGE;
  }
}

final signOutProvider = FutureProvider.autoDispose<SignOutResult>((
  ProviderReference ref,
) async {
  final authService = await ref.read(authServiceProvider.future);

  final res = await authService.signOut();

  final signOutResult = res.fold(
    (err) => _mapErrorsToSignOutResult(err),
    (res) => SignOutResult.SignedOut,
  );

  return signOutResult;
});
