import 'dart:convert';

import 'package:crypto_journal_mobile/app/transaction/data/data_sources/transaction_remote_data_source.dart';
import 'package:crypto_journal_mobile/app/transaction/data/inputs/create_transaction_input.dart';
import 'package:crypto_journal_mobile/app/transaction/data/inputs/delete_transaction_input.dart';
import 'package:crypto_journal_mobile/app/transaction/data/inputs/get_transaction_input.dart';
import 'package:crypto_journal_mobile/app/transaction/data/models/transaction_model.dart';
import 'package:crypto_journal_mobile/app/transaction/data/repositories/transaction_repository.dart';
import 'package:crypto_journal_mobile/app/transaction/service/dtos/create_transaction_dto.dart';
import 'package:crypto_journal_mobile/app/transaction/service/dtos/delete_transaction_dto.dart';
import 'package:crypto_journal_mobile/app/transaction/service/dtos/get_transactions_dto.dart';
import 'package:crypto_journal_mobile/app/transaction/service/repositories/transaction_repository.dart';
import 'package:crypto_journal_mobile/shared/data/network_info/network_info.dart';
import 'package:crypto_journal_mobile/shared/errors/network/network_connection_error.dart';
import 'package:crypto_journal_mobile/shared/errors/unexpected/unexpected_error.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../shared/fixtures/fixture_reader.dart';
import 'transaction_repository_test.mocks.dart';

@GenerateMocks([
  INetworkInfo,
  ITransactionRemoteDataSource,
])
void main() {
  late TransactionRepository transactionRepository;
  late MockINetworkInfo networkInfoMock;
  late MockITransactionRemoteDataSource transactionRemoteDataSource;
  final transactionJson =
      json.decode(fixtureReader("transactions/transaction_fixture.json"));

  final transactionDto = TransactionModel.fromJson(transactionJson);

  final createTransactionDto = CreateTransactionDto(
    coinSymbol: "ETH",
    coins: 1000,
    fee: 0,
    coinPrice: 3709,
    date: "12/02/2020",
    operation: "1",
  );

  final createTransactionInput = CreateTransactionInput(
    coinSymbol: "ETH",
    coins: 1000,
    fee: 0,
    coinPrice: 3709,
    date: "12/02/2020",
    operation: "1",
  );

  final deleteTransactionDto = DeleteTransactionDto(
    id: transactionDto.id,
  );

  final deleteTransactionInput = DeleteTransactionInput(
    id: transactionDto.id,
  );

  final start = 0;
  final limit = 15;

  final getTransactionsDto = GetTransactionsDto(
    start: start,
    limit: limit,
  );

  final getTransactionsInput = GetTransactionsInput(
    start: start,
    limit: limit,
  );

  final getTransactionsResult = [
    transactionDto,
    transactionDto,
  ];

  setUp(() {
    networkInfoMock = MockINetworkInfo();
    transactionRemoteDataSource = MockITransactionRemoteDataSource();
    transactionRepository = TransactionRepository(
      transactionRemoteDataSource: transactionRemoteDataSource,
      networkInfo: networkInfoMock,
    );
  });

  group('TransactionRepository', () {
    test("should be an instance of ITransactionRepository", () {
      // assert
      expect(transactionRepository, isA<ITransactionRepository>());
    });
  });

  setFailureMock() {
    when(networkInfoMock.isConnected).thenAnswer((_) => Future.value(false));
  }

  group('TransactionRepository.getTransactions', () {
    setSuccessMock() {
      when(networkInfoMock.isConnected).thenAnswer((_) => Future.value(true));
      when(transactionRemoteDataSource.getTransactions(any))
          .thenAnswer((_) async => Future.value(getTransactionsResult));
    }

    test('should call the isConnected method of the INetworkInfo class',
        () async {
      // arrange
      setSuccessMock();

      // act
      await transactionRepository.getTransactions(getTransactionsDto);

      // assert
      verify(networkInfoMock.isConnected);
    });

    test(
        'should call the getTransactions method of the ITransactionRemoteDataSource class if the connection is ok',
        () async {
      // arrange
      setSuccessMock();

      // act
      final res =
          await transactionRepository.getTransactions(getTransactionsDto);

      // assert
      verify(transactionRemoteDataSource.getTransactions(getTransactionsInput));
      expect(res, Right(getTransactionsResult));
    });

    test(
        'should not call the getTransactions method of the ITransactionRemoteDataSource class if the connection is not ok ',
        () async {
      // arrange
      setFailureMock();

      // act
      await transactionRepository.getTransactions(getTransactionsDto);

      // assert
      verifyZeroInteractions(transactionRemoteDataSource);
    });

    test('should return NetworkConnectionError if the connection is not ok ',
        () async {
      // arrange
      setFailureMock();

      // act
      final res =
          await transactionRepository.getTransactions(getTransactionsDto);

      // assert
      expect(res, equals(Left(NetworkConnectionError())));
    });

    test('should return an UnexpectedError if an uncaught exption occurs',
        () async {
      // arrange
      when(networkInfoMock.isConnected).thenThrow(Exception());

      // act
      final res =
          await transactionRepository.getTransactions(getTransactionsDto);

      // assert
      expect(res, equals(Left(UnexpectedError())));
    });
  });

  group('TransactionRepository.createTransaction', () {
    setSuccessMock() {
      when(networkInfoMock.isConnected).thenAnswer((_) => Future.value(true));
      when(transactionRemoteDataSource.createTransaction(any))
          .thenAnswer((_) async => Future.value(transactionDto));
    }

    test('should call the isConnected method of the INetworkInfo class',
        () async {
      // arrange
      setSuccessMock();

      // act
      await transactionRepository.createTransaction(createTransactionDto);

      // assert
      verify(networkInfoMock.isConnected);
    });

    test(
        'should call the createTransaction method of the ITransactionRemoteDataSource class if the connection is ok',
        () async {
      // arrange
      setSuccessMock();

      // act
      final res =
          await transactionRepository.createTransaction(createTransactionDto);

      // assert
      verify(transactionRemoteDataSource
          .createTransaction(createTransactionInput));
      expect(res, Right(transactionDto));
    });

    test(
        'should not call the getTransactions method of the ITransactionRemoteDataSource class if the connection is not ok ',
        () async {
      // arrange
      setFailureMock();

      // act
      await transactionRepository.createTransaction(createTransactionDto);

      // assert
      verifyZeroInteractions(transactionRemoteDataSource);
    });

    test('should return NetworkConnectionError if the connection is not ok ',
        () async {
      // arrange
      setFailureMock();

      // act
      final res =
          await transactionRepository.createTransaction(createTransactionDto);

      // assert
      expect(res, equals(Left(NetworkConnectionError())));
    });

    test('should return an UnexpectedError if an uncaught exption occurs',
        () async {
      // arrange
      when(networkInfoMock.isConnected).thenThrow(Exception());

      // act
      final res =
          await transactionRepository.createTransaction(createTransactionDto);

      // assert
      expect(res, equals(Left(UnexpectedError())));
    });
  });

  group('TransactionRepository.deleteTransaction', () {
    setSuccessMock() {
      when(networkInfoMock.isConnected).thenAnswer((_) => Future.value(true));
      when(transactionRemoteDataSource.deleteTransaction(any))
          .thenAnswer((_) async => Future.value(transactionDto));
    }

    test('should call the isConnected method of the INetworkInfo class',
        () async {
      // arrange
      setSuccessMock();

      // act
      await transactionRepository.deleteTransaction(deleteTransactionDto);

      // assert
      verify(networkInfoMock.isConnected);
    });

    test(
        'should call the deleteTransaction method of the ITransactionRemoteDataSource class if the connection is ok',
        () async {
      // arrange
      setSuccessMock();

      // act
      final res =
          await transactionRepository.deleteTransaction(deleteTransactionDto);

      // assert
      verify(transactionRemoteDataSource
          .deleteTransaction(deleteTransactionInput));
      expect(res, Right(transactionDto));
    });

    test(
        'should not call the getTransactions method of the ITransactionRemoteDataSource class if the connection is not ok ',
        () async {
      // arrange
      setFailureMock();

      // act
      await transactionRepository.deleteTransaction(deleteTransactionDto);

      // assert
      verifyZeroInteractions(transactionRemoteDataSource);
    });

    test('should return NetworkConnectionError if the connection is not ok ',
        () async {
      // arrange
      setFailureMock();

      // act
      final res =
          await transactionRepository.deleteTransaction(deleteTransactionDto);

      // assert
      expect(res, equals(Left(NetworkConnectionError())));
    });

    test('should return an UnexpectedError if an uncaught exption occurs',
        () async {
      // arrange
      when(networkInfoMock.isConnected).thenThrow(Exception());

      // act
      final res =
          await transactionRepository.deleteTransaction(deleteTransactionDto);

      // assert
      expect(res, equals(Left(UnexpectedError())));
    });
  });
}
