import 'package:crypto_journal_mobile/app/auth/service/services/auth_service.dart';
import 'package:crypto_journal_mobile/app/auth/service/dtos/auth_payload_dto.dart';
import 'package:crypto_journal_mobile/app/auth/service/dtos/sign_in_dto.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final signInProvider =
    FutureProvider.autoDispose.family<AuthPayloadDto?, SignInDto>((
  ProviderReference ref,
  SignInDto signInDto,
) async {
  final authService = await ref.read(authServiceProvider.future);

  final signInResult = await authService.signIn(signInDto);

  return signInResult.fold(
    (err) => null,
    (authPayloadDto) => authPayloadDto,
  );
});
