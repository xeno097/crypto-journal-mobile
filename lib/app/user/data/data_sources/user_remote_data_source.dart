import 'package:crypto_journal_mobile/app/user/data/inputs/update_user_input.dart';
import 'package:crypto_journal_mobile/app/user/data/models/user_model.dart';
import 'package:crypto_journal_mobile/shared/data/graphql/graphql_client.dart';
import 'package:crypto_journal_mobile/shared/data/graphql/user/mutations.dart';
import 'package:crypto_journal_mobile/shared/data/graphql/user/queries.dart';

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
  Future<UserModel> getUser() async {
    final res = await this.graphqlAuthClient.query(
          query: GET_LOGGED_USER_QUERY,
          dataKey: GET_LOGGED_USER_QUERY_DATA_KEY,
        );

    return UserModel.fromJson(res);
  }

  @override
  Future<UserModel> updateUser(UpdateUserInput updateUserInput) async {
    final res = await this.graphqlAuthClient.mutate(
        mutation: UPDATE_LOGGED_USER_MUTATION,
        dataKey: UPDATE_LOGGED_USER_MUTATION_DATA_KEY,
        variables: {"input": updateUserInput.toJson()});

    return UserModel.fromJson(res);
  }
}
