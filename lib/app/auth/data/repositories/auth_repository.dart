import 'package:crypto_journal_mobile/app/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:crypto_journal_mobile/app/auth/service/repositories/auth_repository.dart';
import 'package:crypto_journal_mobile/app/auth/service/dtos/sign_in_dto.dart';
import 'package:crypto_journal_mobile/app/auth/service/dtos/auth_payload_dto.dart';
import 'package:crypto_journal_mobile/shared/data/network_info/network_info.dart';
import 'package:crypto_journal_mobile/shared/errors/network/network_connection_error.dart';
import 'package:crypto_journal_mobile/shared/errors/network/network_connection_exception.dart';
import 'package:crypto_journal_mobile/shared/errors/unexpected/unexpected_error.dart';
import 'package:dartz/dartz.dart';
import 'package:crypto_journal_mobile/shared/errors/base_error.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authRepositoryProvider = FutureProvider<AuthRepository>((
  ProviderReference ref,
) async {
  final authRemoteDataSource =
      await ref.read(authRemoteDataSourceProvider.future);
  final networkInfo = ref.read(networkInfoProvider);

  final authRepository = AuthRepository(
      authRemoteDataSource: authRemoteDataSource, networkInfo: networkInfo);

  return authRepository;
});

class AuthRepository implements IAuthRepository {
  final IAuthRemoteDataSource _authRemoteDataSource;
  final INetworkInfo _networkInfo;

  AuthRepository({
    required IAuthRemoteDataSource authRemoteDataSource,
    required INetworkInfo networkInfo,
  })  : this._authRemoteDataSource = authRemoteDataSource,
        this._networkInfo = networkInfo;

  @override
  Future<Either<BaseError, AuthPayloadDto>> signIn(SignInDto signInDto) async {
    try {
      final bool connectionStatus = await this._networkInfo.isConnected;

      if (!connectionStatus) {
        throw NetworkConnectionException();
      }

      final AuthPayloadDto authPayloadDto =
          await this._authRemoteDataSource.signIn(signInDto.provider);

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
      final bool connectionStatus = await this._networkInfo.isConnected;

      if (!connectionStatus) {
        throw NetworkConnectionException();
      }

      final signOutRes = await this._authRemoteDataSource.signOut();

      return Right(signOutRes);
    } on NetworkConnectionException {
      return Left(NetworkConnectionError());
    } catch (e) {
      return Left(UnexpectedError());
    }
  }
}
