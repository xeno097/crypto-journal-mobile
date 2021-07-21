import 'package:crypto_journal_mobile/app/user/data/data_sources/user_remote_data_source.dart';
import 'package:crypto_journal_mobile/app/user/service/dtos/update_user_dto.dart';
import 'package:crypto_journal_mobile/app/user/service/repositories/user_repository.dart';
import 'package:crypto_journal_mobile/shared/data/network_info/network_info.dart';

class UserRepository implements IUserRepository {
  final IUserRemoteDataSource userRemoteDataSource;
  final INetworkInfo networkInfo;

  UserRepository({
    required this.userRemoteDataSource,
    required this.networkInfo,
  });

  @override
  Future getUser() {
    // TODO: implement getUser
    throw UnimplementedError();
  }

  @override
  Future updateUser(UpdateUserDto updateUserDto) {
    // TODO: implement updateUser
    throw UnimplementedError();
  }
}
