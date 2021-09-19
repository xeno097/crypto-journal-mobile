import 'dart:convert';

import 'package:crypto_journal_mobile/app/transaction/data/models/transaction_model.dart';
import 'package:crypto_journal_mobile/app/transaction/service/dtos/create_transaction_dto.dart';
import 'package:crypto_journal_mobile/app/transaction/service/dtos/delete_transaction_dto.dart';
import 'package:crypto_journal_mobile/app/transaction/service/dtos/get_transactions_dto.dart';
import 'package:crypto_journal_mobile/app/transaction/service/repositories/transaction_repository.dart';
import 'package:crypto_journal_mobile/app/transaction/service/services/transaction_service.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../shared/fixtures/fixture_reader.dart';
import 'transaction_service_test.mocks.dart';

@GenerateMocks([ITransactionRepository])
void main() {
  late MockITransactionRepository transactionRepository;
  late TransactionService transactionService;

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

  final deleteTransactionDto = DeleteTransactionDto(
    id: transactionDto.id,
  );

  final getTransactionsDto = GetTransactionsDto(
    start: 0,
    limit: 15,
  );

  final getTransactionsResult = [
    transactionDto,
    transactionDto,
  ];

  setUp(() {
    transactionRepository = MockITransactionRepository();
    transactionService = TransactionService(
      transactionRepository: transactionRepository,
    );
  });

  group("TransactionService", () {
    test('should be an instance of ITransactionService', () {
      // assert
      expect(transactionService, isA<ITransactionService>());
    });
  });

  group("TransactionService.getTransactions", () {
    test(
        'should call the getTransactions method of the ITransactionRepository class',
        () async {
      // arrange
      when(transactionRepository.getTransactions(any))
          .thenAnswer((_) => Future.value(Right(getTransactionsResult)));

      // act
      final res = await transactionService.getTransactions(getTransactionsDto);

      // assert
      verify(transactionRepository.getTransactions(any));
      expect(res, equals(Right(getTransactionsResult)));
    });
  });

  group("TransactionService.createTransaction", () {
    test(
        'should call the createTransaction method of the ITransactionRepository class',
        () async {
      // arrange
      when(transactionRepository.createTransaction(any))
          .thenAnswer((_) => Future.value(Right(transactionDto)));

      // act
      final res =
          await transactionService.createTransaction(createTransactionDto);

      // assert
      verify(transactionRepository.createTransaction(createTransactionDto));
      expect(res, equals(Right(transactionDto)));
    });
  });

  group("TransactionService.deleteTransaction", () {
    test(
        'should call the deleteTransaction method of the ITransactionRepository class',
        () async {
      // arrange
      when(transactionRepository.deleteTransaction(any))
          .thenAnswer((_) => Future.value(Right(transactionDto)));

      // act
      final res =
          await transactionService.deleteTransaction(deleteTransactionDto);

      // assert
      verify(transactionRepository.deleteTransaction(deleteTransactionDto));
      expect(res, equals(Right(transactionDto)));
    });
  });
}
