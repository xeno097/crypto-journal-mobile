import 'package:crypto_journal_mobile/app/user/service/services/user_service.dart';
import 'package:crypto_journal_mobile/shared/errors/api_error/api_error.dart';
import 'package:crypto_journal_mobile/shared/errors/base_error.dart';
import 'package:crypto_journal_mobile/shared/errors/network/network_connection_error.dart';
import 'package:crypto_journal_mobile/shared/errors/unexpected/unexpected_error.dart';
import "package:flutter_riverpod/flutter_riverpod.dart";

enum AuthStatus {
  SignedIn,
  NotSignedIn,
  UnauthorizedUserError,
  BlockedUserError,
  UnexpectedError,
  NetworkConnectionError
}

AuthStatus _mapErrorsToAuthStatus(BaseError error) {
  if (error is UnauthorizedUserError) {
    return AuthStatus.UnauthorizedUserError;
  }

  if (error is BlockedUserError) {
    return AuthStatus.BlockedUserError;
  }

  if (error is UnexpectedError) {
    return AuthStatus.UnexpectedError;
  }

  if (error is NetworkConnectionError) {
    return AuthStatus.NetworkConnectionError;
  }

  return AuthStatus.NotSignedIn;
}

String mapAuthStatusToErrorMessage(AuthStatus authStatus) {
  switch (authStatus) {
    case AuthStatus.NetworkConnectionError:
      return NETWORK_CONNECTION_ERROR;
    case AuthStatus.UnexpectedError:
      return UNEXPECTED_ERROR_MESSAGE;
    default:
      return UNEXPECTED_ERROR_MESSAGE;
  }
}

final getLoginStatusProvider = FutureProvider.autoDispose<AuthStatus>((
  ProviderReference ref,
) async {
  final userService = await ref.read(userServiceProvider.future);

  final res = await userService.getLoggedUser();

  final loginStatus = res.fold(
    (err) => _mapErrorsToAuthStatus(err),
    (data) => AuthStatus.SignedIn,
  );

  return loginStatus;
});
