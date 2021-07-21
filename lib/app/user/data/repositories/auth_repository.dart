import 'package:crypto_journal_mobile/app/user/data/data_sources/auth_remote_data_source.dart';
import 'package:crypto_journal_mobile/app/user/service/dtos/sign_in_dto.dart';
import 'package:crypto_journal_mobile/app/user/service/dtos/auth_payload_dto.dart';
import 'package:crypto_journal_mobile/app/user/service/repositories/auth_repository.dart';
import 'package:crypto_journal_mobile/shared/data/network_info/network_info.dart';
import 'package:crypto_journal_mobile/shared/errors/network/network_connection_error.dart';
import 'package:crypto_journal_mobile/shared/errors/network/network_connection_exception.dart';
import 'package:crypto_journal_mobile/shared/errors/unexpected/unexpected_error.dart';
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
  Future<Either<BaseError, AuthPayloadDto>> signIn(SignInDto signInDto) async {
    try {
      final bool connectionStatus = await this.networkInfo.isConnected;

      if (!connectionStatus) {
        throw NetworkConnectionException();
      }

      final AuthPayloadDto authPayloadDto =
          await this.authRemoteDataSource.signIn(signInDto.provider);

      return Right(authPayloadDto);
    } on NetworkConnectionException {
      return Left(NetworkConnectionError());
    } catch (e) {
      return Left(UnexpectedError());
    }
  }

  @override
  Future<Either<BaseError, bool>> signOut() async {
    try {
      final bool connectionStatus = await this.networkInfo.isConnected;

      if (!connectionStatus) {
        throw NetworkConnectionException();
      }

      final signOutRes = await this.authRemoteDataSource.signOut();

      return Right(signOutRes);
    } on NetworkConnectionException {
      return Left(NetworkConnectionError());
    } catch (e) {
      return Left(UnexpectedError());
    }
  }
}
