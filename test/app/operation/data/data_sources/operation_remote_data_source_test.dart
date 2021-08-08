import 'dart:convert';

import 'package:crypto_journal_mobile/app/operation/data/data_sources/operation_remote_data_source.dart';
import 'package:crypto_journal_mobile/app/operation/data/models/operation_model.dart';
import 'package:crypto_journal_mobile/shared/data/graphql/graphql_client.dart';
import 'package:crypto_journal_mobile/shared/data/graphql/operation/queries.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../shared/fixtures/fixture_reader.dart';
import 'operation_remote_data_source_test.mocks.dart';

@GenerateMocks([IGraphqlClient])
void main() {
  late MockIGraphqlClient graphqlAuthClient;
  late OperationRemoteDataSource operationRemoteDataSource;
  final operationJson = json.decode(fixtureReader("operation_fixture.json"));

  setUp(() {
    graphqlAuthClient = MockIGraphqlClient();
    operationRemoteDataSource = OperationRemoteDataSource(
      graphqlAuthClient: graphqlAuthClient,
    );
  });

  group("OperationRemoteDataSource", () {
    test('should be a instance of IOperationRemoteDataSource', () {
      // assert
      expect(operationRemoteDataSource, isA<IOperationRemoteDataSource>());
    });
  });

  group("OperationRemoteDataSource.getOperations", () {
    setSuccessMocks() {
      when(graphqlAuthClient.query(
        dataKey: anyNamed('dataKey'),
        query: anyNamed('query'),
        variables: anyNamed('variables'),
      )).thenAnswer((_) => Future.value([
            operationJson,
            operationJson,
          ]));
    }

    test('should call the query method of the IGraphqlClient class', () async {
      // arrange
      setSuccessMocks();

      // act
      await operationRemoteDataSource.getOperations();

      // assert
      verify(graphqlAuthClient.query(
        query: GET_OPERATIONS_QUERY,
        dataKey: GET_OPERATIONS_DATA_KEY,
      ));
    });

    test('should return a list of OperationModels', () async {
      // arrange
      setSuccessMocks();
      final expectedResult = [
        OperationModel.fromJson(operationJson),
        OperationModel.fromJson(operationJson),
      ];

      // act
      final res = await operationRemoteDataSource.getOperations();

      // assert
      verify(graphqlAuthClient.query(
        query: GET_OPERATIONS_QUERY,
        dataKey: GET_OPERATIONS_DATA_KEY,
      ));
      expect(res, expectedResult);
    });
  });
}
