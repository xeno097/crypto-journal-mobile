import 'dart:convert';

import 'package:crypto_journal_mobile/app/holding/data/data_sources/holding_remote_data_source.dart';
import 'package:crypto_journal_mobile/app/holding/data/graphql/queries.dart';
import 'package:crypto_journal_mobile/app/holding/data/inputs/get_holding_input.dart';
import 'package:crypto_journal_mobile/app/holding/data/models/holding_model.dart';
import 'package:crypto_journal_mobile/shared/data/graphql/graphql_client.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../shared/fixtures/fixture_reader.dart';
import 'holding_remote_data_source_test.mocks.dart';

@GenerateMocks([IGraphqlClient])
void main() {
  late MockIGraphqlClient graphqlAuthClient;
  late HoldingRemoteDataSource holdingRemoteDataSource;
  final holdingJson =
      json.decode(fixtureReader("holdings/holding_fixture.json"));
  final getHoldingsResult = [
    holdingJson,
    holdingJson,
  ];

  setUp(() {
    graphqlAuthClient = MockIGraphqlClient();
    holdingRemoteDataSource = HoldingRemoteDataSource(
      graphqlAuthClient: graphqlAuthClient,
    );
  });

  group("HoldingRemoteDataSource", () {
    test('should be a instance of IHoldingRemoteDataSource', () {
      // assert
      expect(holdingRemoteDataSource, isA<IHoldingRemoteDataSource>());
    });
  });

  group("HoldingRemoteDataSource.getHoldings", () {
    setSuccessMocks() {
      when(graphqlAuthClient.query(
        dataKey: anyNamed('dataKey'),
        query: anyNamed('query'),
        variables: anyNamed('variables'),
      )).thenAnswer((_) => Future.value(getHoldingsResult));
    }

    test('should call the query method of the IGraphqlClient class', () async {
      // arrange
      setSuccessMocks();

      // act
      await holdingRemoteDataSource.getHoldings(
          getHoldingInput: GetHoldingInput());

      // assert
      verify(graphqlAuthClient.query(
        query: GET_SELF_HOLDINGS_QUERY,
        dataKey: GET_SELF_HOLDINGS_DATA_KEY,
      ));
    });

    test('should return a list of HoldingModels', () async {
      // arrange
      setSuccessMocks();
      final expectedHoldingModel = HoldingModel.fromJson(holdingJson);
      final expectedResult = [
        expectedHoldingModel,
        expectedHoldingModel,
      ];

      // act
      final res = await holdingRemoteDataSource.getHoldings(
          getHoldingInput: GetHoldingInput());

      // assert
      verify(graphqlAuthClient.query(
        query: GET_SELF_HOLDINGS_QUERY,
        dataKey: GET_SELF_HOLDINGS_DATA_KEY,
      ));
      expect(res, expectedResult);
    });
  });
}
