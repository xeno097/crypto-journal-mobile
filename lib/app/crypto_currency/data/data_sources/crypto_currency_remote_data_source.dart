import 'package:crypto_journal_mobile/app/crypto_currency/data/graphql/queries.dart';
import 'package:crypto_journal_mobile/app/crypto_currency/data/inputs/search_crypto_currency_input.dart';
import 'package:crypto_journal_mobile/app/crypto_currency/data/models/crypto_currency_model.dart';
import 'package:crypto_journal_mobile/shared/data/graphql/graphql_auth_client.dart';
import 'package:crypto_journal_mobile/shared/data/graphql/graphql_client.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class ICryptoCurrencyRemoteDataSource {
  Future<List<CryptoCurrencyModel>> searchCryptoCurrency(
    SearchCryptoCurrencyInput searchCryptoCurrencyInput,
  );
}

final cryptoCurrencyRemoteDataSourceProvider =
    FutureProvider<CryptoCurrencyRemoteDataSource>((
  ProviderReference ref,
) async {
  final graphqlAuthClient = await ref.read(
    graphqlAuthClientProvider.future,
  );

  final cryptoCurrencyRemoteDataSource = CryptoCurrencyRemoteDataSource(
    graphqlAuthClient: graphqlAuthClient,
  );

  return cryptoCurrencyRemoteDataSource;
});

class CryptoCurrencyRemoteDataSource
    implements ICryptoCurrencyRemoteDataSource {
  final IGraphqlClient graphqlAuthClient;

  CryptoCurrencyRemoteDataSource({
    required this.graphqlAuthClient,
  });

  @override
  Future<List<CryptoCurrencyModel>> searchCryptoCurrency(
    SearchCryptoCurrencyInput searchCryptoCurrencyInput,
  ) async {
    final List res = await this.graphqlAuthClient.query(
        query: SEARCH_CRYPTO_CURRENCY_QUERY,
        dataKey: SEARCH_CRYPTO_CURRENCY_DATA_KEY,
        variables: {
          "input": searchCryptoCurrencyInput.text,
        });

    final ret = res
        .map((operation) => CryptoCurrencyModel.fromJson(operation))
        .toList();

    return ret;
  }
}
