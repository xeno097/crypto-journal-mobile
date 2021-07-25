import 'package:crypto_journal_mobile/app/user/data/repositories/auth_repository.dart';
import 'package:crypto_journal_mobile/app/user/service/dtos/auth_payload_dto.dart';
import 'package:crypto_journal_mobile/app/user/service/dtos/sign_in_dto.dart';
import 'package:crypto_journal_mobile/app/user/service/repositories/auth_repository.dart';
import 'package:crypto_journal_mobile/shared/errors/base_error.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authServiceProvider =
    FutureProvider<AuthService>((ProviderReference ref) async {
  final authRepository = await ref.read(authRepositoryProvider.future);

  final authService = AuthService(authRepository: authRepository);

  return authService;
});

class AuthService {
  final IAuthRepository authRepository;

  AuthService({required this.authRepository});

  Future<Either<BaseError, AuthPayloadDto>> signIn(SignInDto signInDto) async {
    return await this.authRepository.signIn(signInDto);
  }

  Future<Either<BaseError, bool>> signOut() async {
    return await this.authRepository.signOut();
  }
}
