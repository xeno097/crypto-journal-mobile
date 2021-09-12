import 'package:crypto_journal_mobile/app/auth/service/services/auth_service.dart';
import 'package:crypto_journal_mobile/app/auth/service/dtos/sign_in_dto.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum SignInResult {
  SignedIn,
  UnauthorizedUserError,
  UnexpectedError,
  NetworkError
}

final signInProvider =
    FutureProvider.autoDispose.family<SignInResult, SignInDto>((
  ProviderReference ref,
  SignInDto signInDto,
) async {
  final authService = await ref.read(authServiceProvider.future);

  final signInResult = await authService.signIn(signInDto);

  return signInResult.fold(
    (err) {
      return SignInResult.UnexpectedError;
    },
    (authPayloadDto) => SignInResult.SignedIn,
  );
});
