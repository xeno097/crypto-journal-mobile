import 'dart:convert';

import 'package:crypto_journal_mobile/app/crypto_currency/data/models/crypto_currency_model.dart';
import 'package:crypto_journal_mobile/app/operation/data/models/operation_model.dart';
import 'package:crypto_journal_mobile/app/transaction/data/models/transaction_model.dart';
import 'package:crypto_journal_mobile/app/transaction/service/dtos/transaction_dto.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../shared/fixtures/fixture_reader.dart';

void main() {
  final transactionModel = TransactionModel(
    id: "1",
    coinSymbol: "ETH",
    coins: 1000,
    cost: 10,
    date: "12/02/2020",
    fee: 0,
    operation: OperationModel.fromJson(
      json.decode(
        fixtureReader("operations/operation_fixture.json"),
      ),
    ),
    cryptoCurrency: CryptoCurrencyModel.fromJson(
      json.decode(
        fixtureReader("crypto_currency/crypto_currency_fixture.json"),
      ),
    ),
  );

  group("TransactionModel", () {
    test('should be an instance of TransactionDto', () {
      // assert
      expect(transactionModel, isA<TransactionDto>());
    });
  });

  group("TransactionModel.fromJson", () {
    test('should return a valid TransactionModel when a valid json is provided',
        () {
      // arrange
      final Map<String, dynamic> jsonMap =
          json.decode(fixtureReader("transactions/transaction_fixture.json"));

      // act
      final res = TransactionModel.fromJson(jsonMap);

      // assert
      expect(res, transactionModel);
    });
  });
}
