import 'package:crypto_journal_mobile/app/user/data/data_sources/user_remote_data_source.dart';
import 'package:crypto_journal_mobile/app/user/data/inputs/update_user_input.dart';
import 'package:crypto_journal_mobile/app/user/service/dtos/update_user_dto.dart';
import 'package:crypto_journal_mobile/app/user/service/dtos/user_dto.dart';
import 'package:crypto_journal_mobile/app/user/service/repositories/user_repository.dart';
import 'package:crypto_journal_mobile/shared/data/network_info/network_info.dart';
import 'package:crypto_journal_mobile/shared/data/repository/base_repository.dart';
import 'package:crypto_journal_mobile/shared/errors/base_error.dart';
import 'package:crypto_journal_mobile/shared/errors/network/network_connection_exception.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userRepositoryProvider = FutureProvider<UserRepository>((
  ProviderReference ref,
) async {
  final userRemoteDataSource = await ref.read(
    userRemoteDataSourceProvider.future,
  );
  final networkInfo = ref.read(networkInfoProvider);

  final userRepository = UserRepository(
    userRemoteDataSource: userRemoteDataSource,
    networkInfo: networkInfo,
  );

  return userRepository;
});

class UserRepository extends BaseRepository implements IUserRepository {
  final IUserRemoteDataSource _userRemoteDataSource;
  final INetworkInfo _networkInfo;

  UserRepository({
    required IUserRemoteDataSource userRemoteDataSource,
    required INetworkInfo networkInfo,
  })  : this._networkInfo = networkInfo,
        this._userRemoteDataSource = userRemoteDataSource;

  @override
  Future<Either<BaseError, UserDto>> getUser() async {
    return await this.safeRequestHandler<UserDto>(() async {
      final bool isConnected = await this._networkInfo.isConnected;

      if (!isConnected) {
        throw NetworkConnectionException();
      }

      return await this._userRemoteDataSource.getUser();
    });
  }

  @override
  Future<Either<BaseError, UserDto>> updateUser(
    UpdateUserDto updateUserDto,
  ) async {
    return await this.safeRequestHandler<UserDto>(() async {
      final bool isConnected = await this._networkInfo.isConnected;

      if (!isConnected) {
        throw NetworkConnectionException();
      }

      return await this._userRemoteDataSource.updateUser(UpdateUserInput(
            profilePicture: updateUserDto.profilePicture,
            userName: updateUserDto.userName,
          ));
    });
  }
}
