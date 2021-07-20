import 'package:crypto_journal_mobile/shared/constants/constants.dart';
import 'package:crypto_journal_mobile/shared/data/local_storage/local_storage.dart';
import 'package:graphql/client.dart';

import 'graphql_client.dart';

class GraphqlAuthClient implements GraphqlClient {
  late final GraphQLClient client;
  final LocalStorage localStorage;

  GraphqlAuthClient({
    required this.localStorage,
  }) {
    final _link = HttpLink(api_url);

    final accessToken = this.localStorage.getData(
          GetDataDto(
            key: ACCESS_TOKEN_KEY,
          ),
        );

    final _authLink = AuthLink(getToken: () async => accessToken);
    final authLink = _authLink.concat(_link);

    this.client = GraphQLClient(
      link: authLink,
      cache: GraphQLCache(),
    );
  }

  @override
  GraphQLClient get instance {
    return this.client;
  }
}
