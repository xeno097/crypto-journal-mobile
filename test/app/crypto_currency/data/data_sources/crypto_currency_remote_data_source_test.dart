import 'dart:convert';

import 'package:crypto_journal_mobile/app/crypto_currency/data/data_sources/crypto_currency_remote_data_source.dart';
import 'package:crypto_journal_mobile/app/crypto_currency/data/graphql/queries.dart';
import 'package:crypto_journal_mobile/app/crypto_currency/data/inputs/search_crypto_currency_input.dart';
import 'package:crypto_journal_mobile/app/crypto_currency/data/models/crypto_currency_model.dart';
import 'package:crypto_journal_mobile/shared/data/graphql/graphql_client.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../shared/fixtures/fixture_reader.dart';
import 'crypto_currency_remote_data_source_test.mocks.dart';

@GenerateMocks([IGraphqlClient])
void main() {
  late MockIGraphqlClient graphqlAuthClient;
  late CryptoCurrencyRemoteDataSource cryptoCurrencyRemoteDataSource;

  final SearchCryptoCurrencyInput searchCryptoCurrencyInput =
      SearchCryptoCurrencyInput(
    text: "BTC",
  );
  final cryptoCurrencyJson = json
      .decode(fixtureReader("crypto_currency/crypto_currency_fixture.json"));

  setUp(() {
    graphqlAuthClient = MockIGraphqlClient();
    cryptoCurrencyRemoteDataSource = CryptoCurrencyRemoteDataSource(
      graphqlAuthClient: graphqlAuthClient,
    );
  });

  group("CryptoCurrencyRemoteDataSource", () {
    test('should be a instance of ICryptoCurrencyRemoteDataSource', () {
      // assert
      expect(cryptoCurrencyRemoteDataSource,
          isA<ICryptoCurrencyRemoteDataSource>());
    });
  });

  group("CryptoCurrencyRemoteDataSource.searchCryptoCurrency", () {
    setSuccessMocks() {
      when(graphqlAuthClient.query(
        dataKey: anyNamed('dataKey'),
        query: anyNamed('query'),
        variables: anyNamed('variables'),
      )).thenAnswer((_) => Future.value([cryptoCurrencyJson]));
    }

    test('should call the query method of the IGraphqlClient class', () async {
      // arrange
      setSuccessMocks();

      // act
      await cryptoCurrencyRemoteDataSource.searchCryptoCurrency(
        searchCryptoCurrencyInput: searchCryptoCurrencyInput,
      );

      // assert
      verify(graphqlAuthClient.query(
          query: SEARCH_CRYPTO_CURRENCY_QUERY,
          dataKey: SEARCH_CRYPTO_CURRENCY_DATA_KEY,
          variables: {"input": searchCryptoCurrencyInput.text}));
    });

    test('should return a list of CryptoCurrencyModels', () async {
      // arrange
      setSuccessMocks();
      final expectedResult = [CryptoCurrencyModel.fromJson(cryptoCurrencyJson)];

      // act
      final res = await cryptoCurrencyRemoteDataSource.searchCryptoCurrency(
        searchCryptoCurrencyInput: searchCryptoCurrencyInput,
      );

      // assert
      verify(graphqlAuthClient.query(
          query: SEARCH_CRYPTO_CURRENCY_QUERY,
          dataKey: SEARCH_CRYPTO_CURRENCY_DATA_KEY,
          variables: {"input": searchCryptoCurrencyInput.text}));
      expect(res, expectedResult);
    });
  });
}
