import 'package:crypto_journal_mobile/app/user/data/data_sources/auth_remote_data_source.dart';
import 'package:crypto_journal_mobile/app/user/service/dtos/sign_in_dto.dart';
import 'package:crypto_journal_mobile/app/user/service/dtos/auth_payload_dto.dart';
import 'package:crypto_journal_mobile/app/user/service/repositories/auth_repository.dart';
import 'package:crypto_journal_mobile/shared/data/network_info/network_info.dart';
import 'package:dartz/dartz.dart';
import 'package:crypto_journal_mobile/shared/errors/base_error.dart';

class AuthRepository implements IAuthRepository {
  final IAuthRemoteDataSource authRemoteDataSource;
  final INetworkInfo networkInfo;

  AuthRepository({
    required this.authRemoteDataSource,
    required this.networkInfo,
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
