import 'package:crypto_journal_mobile/app/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:crypto_journal_mobile/app/auth/data/inputs/sign_in_input.dart';
import 'package:crypto_journal_mobile/app/auth/service/repositories/auth_repository.dart';
import 'package:crypto_journal_mobile/app/auth/service/dtos/sign_in_dto.dart';
import 'package:crypto_journal_mobile/app/auth/service/dtos/auth_payload_dto.dart';
import 'package:crypto_journal_mobile/shared/data/network_info/network_info.dart';
import 'package:crypto_journal_mobile/shared/data/repository/base_repository.dart';
import 'package:crypto_journal_mobile/shared/errors/network/network_connection_exception.dart';
import 'package:dartz/dartz.dart';
import 'package:crypto_journal_mobile/shared/errors/base_error.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authRepositoryProvider = FutureProvider<AuthRepository>((
  ProviderReference ref,
) async {
  final authRemoteDataSource = await ref.read(
    authRemoteDataSourceProvider.future,
  );
  final networkInfo = ref.read(networkInfoProvider);

  final authRepository = AuthRepository(
    authRemoteDataSource: authRemoteDataSource,
    networkInfo: networkInfo,
  );

  return authRepository;
});

class AuthRepository extends BaseRepository implements IAuthRepository {
  final IAuthRemoteDataSource _authRemoteDataSource;
  final INetworkInfo _networkInfo;

  AuthRepository({
    required IAuthRemoteDataSource authRemoteDataSource,
    required INetworkInfo networkInfo,
  })  : this._authRemoteDataSource = authRemoteDataSource,
        this._networkInfo = networkInfo;

  @override
  Future<Either<BaseError, AuthPayloadDto>> signIn(SignInDto signInDto) async {
    return await this.safeRequestHandler<AuthPayloadDto>(() async {
      final bool connectionStatus = await this._networkInfo.isConnected;

      if (!connectionStatus) {
        throw NetworkConnectionException();
      }

      return await this._authRemoteDataSource.signIn(SignInInput(
            provider: signInDto.provider,
          ));
    });
  }

  @override
  Future<Either<BaseError, bool>> signOut() async {
    return await this.safeRequestHandler<bool>(() async {
      final bool connectionStatus = await this._networkInfo.isConnected;

      if (!connectionStatus) {
        throw NetworkConnectionException();
      }

      return await this._authRemoteDataSource.signOut();
    });
  }
}
