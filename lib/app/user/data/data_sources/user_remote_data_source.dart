import 'package:crypto_journal_mobile/app/user/data/inputs/update_user_input.dart';
import 'package:crypto_journal_mobile/app/user/data/models/user_model.dart';
import 'package:crypto_journal_mobile/shared/data/graphql/graphql_client.dart';

abstract class IUserRemoteDataSource {
  Future<UserModel> getUser();
  Future<UserModel> updateUser(UpdateUserInput updateUserInput);
}

class UserRemoteDataSource implements IUserRemoteDataSource {
  final IGraphqlClient graphqlAuthClient;

  UserRemoteDataSource({
    required this.graphqlAuthClient,
  });

  @override
  Future<UserModel> getUser() {
    // TODO: implement getUser
    throw UnimplementedError();
  }

  @override
  Future<UserModel> updateUser(UpdateUserInput updateUserInput) {
    // TODO: implement updateUser
    throw UnimplementedError();
  }
}
