import 'package:crypto_journal_mobile/app/user/data/data_sources/user_remote_data_source.dart';
import 'package:crypto_journal_mobile/app/user/service/dtos/update_user_dto.dart';
import 'package:crypto_journal_mobile/app/user/service/dtos/user_dto.dart';
import 'package:crypto_journal_mobile/app/user/service/repositories/user_repository.dart';
import 'package:crypto_journal_mobile/shared/data/network_info/network_info.dart';
import 'package:crypto_journal_mobile/shared/errors/base_error.dart';
import 'package:dartz/dartz.dart';

class UserRepository implements IUserRepository {
  final IUserRemoteDataSource userRemoteDataSource;
  final INetworkInfo networkInfo;

  UserRepository({
    required this.userRemoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<BaseError, UserDto>> getUser() {
    // TODO: implement getUser
    throw UnimplementedError();
  }

  @override
  Future<Either<BaseError, UserDto>> updateUser(UpdateUserDto updateUserDto) {
    // TODO: implement updateUser
    throw UnimplementedError();
  }
}
