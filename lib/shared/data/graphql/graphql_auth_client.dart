import 'package:crypto_journal_mobile/app/user/data/models/auth_payload_model.dart';
import 'package:crypto_journal_mobile/shared/constants/constants.dart';
import 'package:crypto_journal_mobile/shared/data/graphql/auth/mutations.dart';
import 'package:crypto_journal_mobile/shared/data/local_storage/dtos/get_data_dto.dart';
import 'package:crypto_journal_mobile/shared/data/local_storage/dtos/set_data_dto.dart';
import 'package:crypto_journal_mobile/shared/data/local_storage/local_storage.dart';
import 'package:crypto_journal_mobile/shared/errors/api_error/api_exception.dart';
import 'package:crypto_journal_mobile/shared/errors/unexpected/unexpected_error.dart';
import 'package:crypto_journal_mobile/shared/functions/handle_gql_api_error.dart';
import 'package:graphql/client.dart';
import 'graphql_client.dart';

class GraphqlAuthClient implements IGraphqlClient {
  final ILocalStorage localStorage;

  GraphqlAuthClient({
    required this.localStorage,
  });

  Future<GraphQLClient> _useClient() async {
    final _link = HttpLink(API_URL);

    final accessToken = await this.localStorage.getData(
          GetDataDto(key: ACCESS_TOKEN_KEY),
        );

    final _authLink = AuthLink(getToken: () => accessToken);
    final authLink = _authLink.concat(_link);

    return GraphQLClient(
      link: authLink,
      cache: GraphQLCache(),
    );
  }

  @override
  Future<Map<String, dynamic>> query({
    required String query,
    required String dataKey,
    Map<String, dynamic>? variables,
  }) async {
    try {
      final res = await this._query(
        query: query,
        dataKey: dataKey,
        variables: variables,
      );

      return res;
    } on ExpiredSessionException {
      await this._refreshAccessToken();

      final res = await this._query(
        query: query,
        dataKey: dataKey,
        variables: variables,
      );

      return res;
    }
  }

  @override
  Future<Map<String, dynamic>> mutate({
    required String mutation,
    required String dataKey,
    Map<String, dynamic>? variables,
  }) async {
    try {
      final res = await this._mutate(
        mutation: mutation,
        dataKey: dataKey,
        variables: variables,
      );

      return res;
    } on ExpiredSessionException {
      await this._refreshAccessToken();

      final res = await this._mutate(
        mutation: mutation,
        dataKey: dataKey,
        variables: variables,
      );

      return res;
    }
  }

  Future<void> _refreshAccessToken() async {
    final refreshToken = this.localStorage.getData(GetDataDto(
          key: REFRESH_TOKEN_KEY,
        ));

    final res = await this._mutate(
        mutation: REFRESH_TOKEN_MUTATION,
        dataKey: "refreshToken",
        variables: {
          "input": refreshToken,
        });

    final authPayloadModel = AuthPayloadModel.fromJson(res);

    await this.localStorage.setData(SetDataDto(
          key: ACCESS_TOKEN_KEY,
          value: authPayloadModel.accessToken,
        ));

    await this.localStorage.setData(SetDataDto(
          key: REFRESH_TOKEN_KEY,
          value: authPayloadModel.refreshToken,
        ));

    return;
  }

  Future<Map<String, dynamic>> _query({
    required String query,
    required String dataKey,
    Map<String, dynamic>? variables,
  }) async {
    final QueryOptions queryOptions = QueryOptions(
      document: gql(query),
      variables: variables ?? {},
    );

    final queryClient = await this._useClient();

    final queryResult = await queryClient.query(queryOptions);

    if (queryResult.hasException) {
      throw UnexpectedError();
    }

    Map<String, dynamic> data = queryResult.data?[dataKey];

    handleGqlApiError(data);

    return data;
  }

  Future<Map<String, dynamic>> _mutate({
    required String mutation,
    required String dataKey,
    Map<String, dynamic>? variables,
  }) async {
    final MutationOptions mutationOptions = MutationOptions(
      document: gql(mutation),
      variables: variables ?? {},
    );

    final mutationClient = await this._useClient();

    final mutationResult = await mutationClient.mutate(mutationOptions);

    if (mutationResult.hasException) {
      throw UnexpectedError();
    }

    Map<String, dynamic> data = mutationResult.data?[dataKey];

    handleGqlApiError(data);

    return data;
  }
}
