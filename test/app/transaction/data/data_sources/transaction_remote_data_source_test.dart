import 'dart:convert';

import 'package:crypto_journal_mobile/app/transaction/data/data_sources/transaction_remote_data_source.dart';
import 'package:crypto_journal_mobile/app/transaction/data/inputs/create_transaction_input.dart';
import 'package:crypto_journal_mobile/app/transaction/data/models/transaction_model.dart';
import 'package:crypto_journal_mobile/shared/data/graphql/graphql_client.dart';
import 'package:crypto_journal_mobile/shared/data/graphql/transaction/mutations.dart';
import 'package:crypto_journal_mobile/shared/data/graphql/transaction/queries.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../shared/fixtures/fixture_reader.dart';
import 'transaction_remote_data_source_test.mocks.dart';

@GenerateMocks([IGraphqlClient])
void main() {
  late MockIGraphqlClient graphqlAuthClient;
  late TransactionRemoteDataSource transactionRemoteDataSource;
  final transactionJson =
      json.decode(fixtureReader("transactions/transaction_fixture.json"));

  final transactionModel = TransactionModel.fromJson(transactionJson);

  final createTransactionInput = CreateTransactionInput(
    coinSymbol: "ETH",
    coins: 1000,
    fee: 0,
    coinPrice: 3709,
    date: "12/02/2020",
    operation: "1",
  );

  setUp(() {
    graphqlAuthClient = MockIGraphqlClient();
    transactionRemoteDataSource = TransactionRemoteDataSource(
      graphqlAuthClient: graphqlAuthClient,
    );
  });

  group("TransactionRemoteDataSource", () {
    test('should be a instance of ITransactionRemoteDataSource', () {
      // assert
      expect(transactionRemoteDataSource, isA<ITransactionRemoteDataSource>());
    });
  });

  group("TransactionRemoteDataSource.getTransactions", () {
    setSuccessMocks() {
      when(graphqlAuthClient.query(
        dataKey: anyNamed('dataKey'),
        query: anyNamed('query'),
        variables: anyNamed('variables'),
      )).thenAnswer((_) => Future.value([
            transactionJson,
            transactionJson,
          ]));
    }

    test('should call the query method of the IGraphqlClient class', () async {
      // arrange
      setSuccessMocks();

      // act
      await transactionRemoteDataSource.getTransactions();

      // assert
      verify(graphqlAuthClient.query(
        query: GET_TRANSACTIONS_QUERY,
        dataKey: GET_TRANSACTIONS_DATA_KEY,
      ));
    });

    test('should return a list of TransactionModels', () async {
      // arrange
      setSuccessMocks();

      final expectedResult = [
        transactionModel,
        transactionModel,
      ];

      // act
      final res = await transactionRemoteDataSource.getTransactions();

      // assert
      verify(graphqlAuthClient.query(
        query: GET_TRANSACTIONS_QUERY,
        dataKey: GET_TRANSACTIONS_DATA_KEY,
      ));
      expect(res, expectedResult);
    });
  });

  group("TransactionRemoteDataSource.createTransaction", () {
    setSuccessMocks() {
      when(graphqlAuthClient.mutate(
        dataKey: anyNamed('dataKey'),
        mutation: anyNamed('mutation'),
        variables: anyNamed('variables'),
      )).thenAnswer((_) => Future.value(transactionJson));
    }

    test('should call the mutate method of the IGraphqlClient class', () async {
      // arrange
      setSuccessMocks();

      // act
      await transactionRemoteDataSource
          .createTransaction(createTransactionInput);

      // assert
      verify(graphqlAuthClient.mutate(
        mutation: CREATE_TRANSACTION_MUTATION,
        dataKey: CREATE_TRANSACTION_DATA_KEY,
        variables: {"input": createTransactionInput.toJson()},
      ));
    });

    test('should return the created TransactionModel', () async {
      // arrange
      setSuccessMocks();

      // act
      final res = await transactionRemoteDataSource
          .createTransaction(createTransactionInput);

      // assert
      verify(graphqlAuthClient.mutate(
        mutation: CREATE_TRANSACTION_MUTATION,
        dataKey: CREATE_TRANSACTION_DATA_KEY,
        variables: {
          "input": createTransactionInput.toJson(),
        },
      ));
      expect(res, transactionModel);
    });
  });
}
