import 'package:crypto_journal_mobile/app/user/service/dtos/auth_payload_dto.dart';
import 'package:crypto_journal_mobile/app/user/service/dtos/sign_in_dto.dart';
import 'package:crypto_journal_mobile/app/user/service/services/auth_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final signInProvider =
    FutureProvider.autoDispose<AuthPayloadDto?>((ProviderReference ref) async {
  final authService = await ref.read(authServiceProvider.future);

  final signInResult =
      await authService.signIn(SignInDto(provider: SIGN_IN_PROVIDER.GOOGLE));

  return signInResult.fold(
    (err) => null,
    (authPayloadDto) => authPayloadDto,
  );
});
