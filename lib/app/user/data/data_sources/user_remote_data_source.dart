import 'package:crypto_journal_mobile/app/user/data/graphql/mutations.dart';
import 'package:crypto_journal_mobile/app/user/data/graphql/queries.dart';
import 'package:crypto_journal_mobile/app/user/data/inputs/update_user_input.dart';
import 'package:crypto_journal_mobile/app/user/data/models/user_model.dart';
import 'package:crypto_journal_mobile/shared/data/graphql/graphql_auth_client.dart';
import 'package:crypto_journal_mobile/shared/data/graphql/graphql_client.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class IUserRemoteDataSource {
  Future<UserModel> getUser();
  Future<UserModel> updateUser(UpdateUserInput updateUserInput);
}

final userRemoteDataSourceProvider =
    FutureProvider<UserRemoteDataSource>((ProviderReference ref) async {
  final graphqlAuthClient = await ref.read(graphqlAuthClientProvider.future);

  final userRemoteDataSource =
      UserRemoteDataSource(graphqlAuthClient: graphqlAuthClient);

  return userRemoteDataSource;
});

class UserRemoteDataSource implements IUserRemoteDataSource {
  final IGraphqlClient _graphqlAuthClient;

  UserRemoteDataSource({
    required IGraphqlClient graphqlAuthClient,
  }) : this._graphqlAuthClient = graphqlAuthClient;

  @override
  Future<UserModel> getUser() async {
    final res = await this._graphqlAuthClient.query(
          query: GET_LOGGED_USER_QUERY,
          dataKey: GET_LOGGED_USER_QUERY_DATA_KEY,
        );

    return UserModel.fromJson(res);
  }

  @override
  Future<UserModel> updateUser(UpdateUserInput updateUserInput) async {
    final res = await this._graphqlAuthClient.mutate(
        mutation: UPDATE_LOGGED_USER_MUTATION,
        dataKey: UPDATE_LOGGED_USER_MUTATION_DATA_KEY,
        variables: {"input": updateUserInput.toJson()});

    return UserModel.fromJson(res);
  }
}
