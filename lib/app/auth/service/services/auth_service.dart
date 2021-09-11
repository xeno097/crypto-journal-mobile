import 'package:crypto_journal_mobile/app/auth/data/repositories/auth_repository.dart';
import 'package:crypto_journal_mobile/app/auth/service/repositories/auth_repository.dart';
import 'package:crypto_journal_mobile/app/auth/service/dtos/auth_payload_dto.dart';
import 'package:crypto_journal_mobile/app/auth/service/dtos/sign_in_dto.dart';
import 'package:crypto_journal_mobile/shared/errors/base_error.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authServiceProvider = FutureProvider<AuthService>((
  ProviderReference ref,
) async {
  final authRepository = await ref.read(authRepositoryProvider.future);

  final authService = AuthService(authRepository: authRepository);

  return authService;
});

class AuthService {
  final IAuthRepository _authRepository;

  AuthService({
    required IAuthRepository authRepository,
  }) : this._authRepository = authRepository;

  Future<Either<BaseError, AuthPayloadDto>> signIn(SignInDto signInDto) async {
    return await this._authRepository.signIn(signInDto);
  }

  Future<Either<BaseError, bool>> signOut() async {
    return await this._authRepository.signOut();
  }
}
