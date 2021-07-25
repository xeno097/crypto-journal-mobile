import 'package:crypto_journal_mobile/shared/constants/constants.dart';
import 'package:crypto_journal_mobile/shared/errors/unexpected/unexpected_error.dart';
import 'package:crypto_journal_mobile/shared/functions/handle_gql_api_error.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graphql/client.dart';
import 'graphql_client.dart';

final graphqlPublicClientProvider =
    Provider((ProviderReference ref) => GraphqlPublicClient());

class GraphqlPublicClient implements IGraphqlClient {
  late final GraphQLClient _client;

  GraphqlPublicClient() {
    this._client = GraphQLClient(
      link: HttpLink(API_URL),
      cache: GraphQLCache(),
    );
  }

  @override
  Future<Map<String, dynamic>> mutate({
    required String mutation,
    required String dataKey,
    Map<String, dynamic>? variables,
  }) async {
    final MutationOptions mutationOptions = MutationOptions(
      document: gql(mutation),
      variables: variables ?? {},
    );

    final mutationResult = await this._client.mutate(mutationOptions);

    if (mutationResult.hasException) {
      throw UnexpectedError();
    }

    Map<String, dynamic> data = mutationResult.data?[dataKey];

    handleGqlApiError(data);

    return data;
  }

  @override
  Future<Map<String, dynamic>> query({
    required String query,
    required String dataKey,
    Map<String, dynamic>? variables,
  }) async {
    final QueryOptions queryOptions = QueryOptions(
      document: gql(query),
      variables: variables ?? {},
    );

    final queryResult = await this._client.query(queryOptions);

    if (queryResult.hasException) {
      throw UnexpectedError();
    }

    Map<String, dynamic> data = queryResult.data?[dataKey];

    handleGqlApiError(data);

    return data;
  }
}
