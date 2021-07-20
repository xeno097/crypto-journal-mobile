import 'package:crypto_journal_mobile/app/user/data/data_sources/auth_remote_data_source.dart';
import 'package:crypto_journal_mobile/app/user/service/dtos/sign_in_dto.dart';
import 'package:crypto_journal_mobile/app/user/service/dtos/auth_payload_dto.dart';
import 'package:crypto_journal_mobile/app/user/service/repositories/repository.dart'
    as repo;
import 'package:dartz/dartz.dart';
import 'package:crypto_journal_mobile/shared/errors/base_error.dart';

class AuthRepository implements repo.AuthRepository {
  final AuthRemoteDataSource authRemoteDataSource;

  AuthRepository({
    required this.authRemoteDataSource,
  });

  @override
  Future<Either<BaseError, AuthPayloadDto>> signIn(SignInDto signInDto) {
    // TODO: implement signIn
    throw UnimplementedError();
  }

  @override
  Future<Either<BaseError, bool>> signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }
}
