import 'dart:convert';

import 'package:crypto_journal_mobile/app/crypto_currency/data/models/crypto_currency_model.dart';
import 'package:crypto_journal_mobile/app/crypto_currency/service/dtos/crypto_currency_dto.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../shared/fixtures/fixture_reader.dart';

void main() {
  final cryptoCurrencyModel = CryptoCurrencyModel(
    id: "BTC",
    name: "Bitcoin",
    price: 50000.0,
    symbol: "BTC",
  );

  group("CryptoCurrencyModel", () {
    test('it should be an instance of CryptoCurrencyDto', () {
      expect(cryptoCurrencyModel, isA<CryptoCurrencyDto>());
    });
  });

  group('CryptoCurrencyModel.fromJson', () {
    test(
        'it should return a valid CryptoCurrencyModel when a valid json is provided',
        () {
      // arrange
      final Map<String, dynamic> jsonMap = json.decode(
          fixtureReader("crypto_currency/crypto_currency_fixture.json"));

      // act
      final res = CryptoCurrencyModel.fromJson(jsonMap);

      // assert
      expect(res, cryptoCurrencyModel);
    });
  });
}
