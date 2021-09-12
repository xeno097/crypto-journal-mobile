import 'package:crypto_journal_mobile/app/auth/service/services/auth_service.dart';
import 'package:crypto_journal_mobile/app/auth/service/dtos/sign_in_dto.dart';
import 'package:crypto_journal_mobile/shared/errors/api_error/api_error.dart';
import 'package:crypto_journal_mobile/shared/errors/base_error.dart';
import 'package:crypto_journal_mobile/shared/errors/firebase/user_already_exists_with_another_provider_error.dart';
import 'package:crypto_journal_mobile/shared/errors/network/network_connection_error.dart';
import 'package:crypto_journal_mobile/shared/errors/unexpected/unexpected_error.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum SignInResult {
  SignedIn,
  UnauthorizedUserError,
  BlockedUserError,
  UnexpectedError,
  NetworkConnectionError,
  UserAlreadyExistsError,
}

SignInResult _mapErrorsToSignInResult(BaseError error) {
  if (error is UnauthorizedUserError) {
    return SignInResult.UnauthorizedUserError;
  }

  if (error is BlockedUserError) {
    return SignInResult.BlockedUserError;
  }

  if (error is NetworkConnectionError) {
    return SignInResult.NetworkConnectionError;
  }

  if (error is UserAlreadyExistsWithAnotherSignInProviderError) {
    return SignInResult.UserAlreadyExistsError;
  }

  return SignInResult.UnexpectedError;
}

String mapSignInResultToErrorMessage(SignInResult signInResult) {
  switch (signInResult) {
    case SignInResult.BlockedUserError:
      return BLOCKED_USER_ERROR_MESSAGE;
    case SignInResult.NetworkConnectionError:
      return NETWORK_CONNECTION_ERROR;
    case SignInResult.UnauthorizedUserError:
      return UNAUTHORIZED_USER_ERROR_MESSAGE;
    case SignInResult.UserAlreadyExistsError:
      return USER_ALREADY_EXISTS_WITH_ANOTHER_PROVIDER_ERROR_MESSAGE;
    case SignInResult.UnexpectedError:
    default:
      return UNEXPECTED_ERROR_MESSAGE;
  }
}

final signInProvider =
    FutureProvider.autoDispose.family<SignInResult, SignInDto>((
  ProviderReference ref,
  SignInDto signInDto,
) async {
  final authService = await ref.read(authServiceProvider.future);

  final signInResult = await authService.signIn(signInDto);

  return signInResult.fold(
    (err) => _mapErrorsToSignInResult(err),
    (authPayloadDto) => SignInResult.SignedIn,
  );
});
