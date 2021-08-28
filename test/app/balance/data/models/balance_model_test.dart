import 'dart:convert';

import 'package:crypto_journal_mobile/app/balance/data/models/balance_model.dart';
import 'package:crypto_journal_mobile/app/balance/service/dtos/balance_dto.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../shared/fixtures/fixture_reader.dart';

void main() {
  final balanceModel = BalanceModel(
    id: "BTC",
    balance: 0.0,
    cryptoCurrency: "BTC",
    cryptoValue: 0.0,
  );

  group("BalanceModel", () {
    test('it should be an instance of BalanceDto', () {
      expect(balanceModel, isA<BalanceDto>());
    });
  });

  group('BalanceModel.fromJson', () {
    test('it should return a valid BalanceModel when a valid json is provided',
        () {
      // arrange
      final Map<String, dynamic> jsonMap =
          json.decode(fixtureReader("balance/balance_fixture.json"));

      // act
      final res = BalanceModel.fromJson(jsonMap);

      // assert
      expect(res, balanceModel);
    });
  });
}
