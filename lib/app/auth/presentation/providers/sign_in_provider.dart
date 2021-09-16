import 'package:crypto_journal_mobile/app/auth/service/services/auth_service.dart';
import 'package:crypto_journal_mobile/app/auth/service/dtos/sign_in_dto.dart';
import 'package:crypto_journal_mobile/shared/errors/functions/handle_error.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum SignInResult {
  SignedIn,
  SignInError,
}

final signInProvider =
    FutureProvider.autoDispose.family<SignInResult, SignInDto>((
  ProviderReference ref,
  SignInDto signInDto,
) async {
  final authService = await ref.read(authServiceProvider.future);

  final signInResult = await authService.signIn(signInDto);

  return signInResult.fold(
    (err) => handleProviderErrorResult<SignInResult>(
      ref,
      err,
      callback: () => SignInResult.SignInError,
    ),
    (authPayloadDto) => SignInResult.SignedIn,
  );
});
