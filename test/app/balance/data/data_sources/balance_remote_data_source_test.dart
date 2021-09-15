import 'dart:convert';

import 'package:crypto_journal_mobile/app/balance/data/data_sources/balance_remote_data_source.dart';
import 'package:crypto_journal_mobile/app/balance/data/graphql/queries.dart';
import 'package:crypto_journal_mobile/app/balance/data/inputs/get_balance_input.dart';
import 'package:crypto_journal_mobile/app/balance/data/models/balance_model.dart';
import 'package:crypto_journal_mobile/shared/data/graphql/graphql_client.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../shared/fixtures/fixture_reader.dart';
import 'balance_remote_data_source_test.mocks.dart';

@GenerateMocks([IGraphqlClient])
void main() {
  late MockIGraphqlClient graphqlAuthClient;
  late BalanceRemoteDataSource balanceRemoteDataSource;
  final balanceJson =
      json.decode(fixtureReader("balance/balance_fixture.json"));

  setUp(() {
    graphqlAuthClient = MockIGraphqlClient();
    balanceRemoteDataSource = BalanceRemoteDataSource(
      graphqlAuthClient: graphqlAuthClient,
    );
  });

  group("BalanceRemoteDataSource", () {
    test('should be a instance of IBalanceRemoteDataSource', () {
      // assert
      expect(balanceRemoteDataSource, isA<IBalanceRemoteDataSource>());
    });
  });

  group("BalanceRemoteDataSource.getBalance", () {
    setSuccessMocks() {
      when(graphqlAuthClient.query(
        dataKey: anyNamed('dataKey'),
        query: anyNamed('query'),
        variables: anyNamed('variables'),
      )).thenAnswer((_) => Future.value(balanceJson));
    }

    test('should call the query method of the IGraphqlClient class', () async {
      // arrange
      setSuccessMocks();

      // act
      await balanceRemoteDataSource.getBalance(GetBalanceInput());

      // assert
      verify(graphqlAuthClient.query(
        query: GET_SELF_BALANCE_QUERY,
        dataKey: GET_SELF_BALANCE_DATA_KEY,
      ));
    });

    test('should return a BalanceModel', () async {
      // arrange
      setSuccessMocks();
      final expectedResult = BalanceModel.fromJson(balanceJson);

      // act
      final res = await balanceRemoteDataSource.getBalance(GetBalanceInput());

      // assert
      verify(graphqlAuthClient.query(
        query: GET_SELF_BALANCE_QUERY,
        dataKey: GET_SELF_BALANCE_DATA_KEY,
      ));
      expect(res, expectedResult);
    });
  });
}
