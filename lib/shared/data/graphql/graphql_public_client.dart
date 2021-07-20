import 'package:crypto_journal_mobile/shared/constants/constants.dart';
import 'package:graphql/client.dart';
import 'graphql_client.dart';

class GraphqlPublicClient implements IGraphqlClient {
  late final GraphQLClient _client;

  GraphqlPublicClient() {
    this._client = GraphQLClient(
      link: HttpLink(api_url),
      cache: GraphQLCache(),
    );
  }

  @override
  GraphQLClient get instance {
    return this._client;
  }
}
