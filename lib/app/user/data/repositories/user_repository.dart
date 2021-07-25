import 'package:crypto_journal_mobile/app/user/data/data_sources/user_remote_data_source.dart';
import 'package:crypto_journal_mobile/app/user/data/inputs/update_user_input.dart';
import 'package:crypto_journal_mobile/app/user/service/dtos/update_user_dto.dart';
import 'package:crypto_journal_mobile/app/user/service/dtos/user_dto.dart';
import 'package:crypto_journal_mobile/app/user/service/repositories/user_repository.dart';
import 'package:crypto_journal_mobile/shared/data/network_info/network_info.dart';
import 'package:crypto_journal_mobile/shared/errors/base_error.dart';
import 'package:crypto_journal_mobile/shared/errors/network/network_connection_error.dart';
import 'package:crypto_journal_mobile/shared/errors/network/network_connection_exception.dart';
import 'package:crypto_journal_mobile/shared/errors/unexpected/unexpected_error.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userRepositoryProvider =
    FutureProvider<UserRepository>((ProviderReference ref) async {
  final userRemoteDataSource =
      await ref.read(userRemoteDataSourceProvider.future);
  final networkInfo = ref.read(networkInfoProvider);

  final userRepository = UserRepository(
      userRemoteDataSource: userRemoteDataSource, networkInfo: networkInfo);

  return userRepository;
});

class UserRepository implements IUserRepository {
  final IUserRemoteDataSource userRemoteDataSource;
  final INetworkInfo networkInfo;

  UserRepository({
    required this.userRemoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<BaseError, UserDto>> getUser() async {
    try {
      final bool isConnected = await this.networkInfo.isConnected;

      if (!isConnected) {
        throw NetworkConnectionException();
      }

      final res = await this.userRemoteDataSource.getUser();

      return Right(res);
    } on NetworkConnectionException {
      return Left(NetworkConnectionError());
    } catch (e) {
      return Left(UnexpectedError());
    }
  }

  @override
  Future<Either<BaseError, UserDto>> updateUser(
      UpdateUserDto updateUserDto) async {
    try {
      final bool isConnected = await this.networkInfo.isConnected;

      if (!isConnected) {
        throw NetworkConnectionException();
      }

      final res = await this.userRemoteDataSource.updateUser(UpdateUserInput(
            profilePicture: updateUserDto.profilePicture,
            userName: updateUserDto.userName,
          ));

      return Right(res);
    } on NetworkConnectionException {
      return Left(NetworkConnectionError());
    } catch (e) {
      return Left(UnexpectedError());
    }
  }
}
