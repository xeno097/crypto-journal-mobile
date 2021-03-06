import 'package:crypto_journal_mobile/app/auth/service/services/auth_service.dart';
import 'package:crypto_journal_mobile/app/auth/service/dtos/sign_in_dto.dart';
import 'package:crypto_journal_mobile/shared/providers/functions/handle_provider_error_result.dart';
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
      providerReference: ref,
      error: err,
      callback: () => SignInResult.SignInError,
    ),
    (authPayloadDto) => SignInResult.SignedIn,
  );
});
