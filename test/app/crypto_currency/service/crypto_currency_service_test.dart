import 'dart:convert';

import 'package:crypto_journal_mobile/app/crypto_currency/data/models/crypto_currency_model.dart';
import 'package:crypto_journal_mobile/app/crypto_currency/service/dtos/search_crypto_currency_dto.dart';
import 'package:crypto_journal_mobile/app/crypto_currency/service/repositories/crypto_currency_repository.dart';
import 'package:crypto_journal_mobile/app/crypto_currency/service/services/crypto_currency_service.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../shared/fixtures/fixture_reader.dart';
import 'crypto_currency_service_test.mocks.dart';

@GenerateMocks([ICryptoCurrencyRepository])
void main() {
  late MockICryptoCurrencyRepository cryptoCurrencyRepository;
  late CryptoCurrencyService cryptoCurrencyService;

  final cryptoCurrencyJson = json
      .decode(fixtureReader("crypto_currency/crypto_currency_fixture.json"));
  final cryptoCurrencyDto = CryptoCurrencyModel.fromJson(cryptoCurrencyJson);

  final searchCryptoCurrencyResult = [cryptoCurrencyDto];

  setUp(() {
    cryptoCurrencyRepository = MockICryptoCurrencyRepository();
    cryptoCurrencyService = CryptoCurrencyService(
      cryptoCurrencyRepository: cryptoCurrencyRepository,
    );
  });

  group("CryptoCurrencyService", () {
    test('should be an instance of ICryptoCurrencyService', () {
      // assert
      expect(cryptoCurrencyService, isA<ICryptoCurrencyService>());
    });
  });

  group("CryptoCurrencyService.searchCryptoCurrency", () {
    test(
        'should call the SearchCryptoCurrency method of the ICryptoCurrencyRepository class',
        () async {
      // arrange
      when(
        cryptoCurrencyRepository.searchCryptoCurrency(
          any,
        ),
      ).thenAnswer((_) => Future.value(Right(searchCryptoCurrencyResult)));

      final searchCryptoCurrencyDto = SearchCryptoCurrencyDto(text: "BTC");

      // act
      final res = await cryptoCurrencyService.searchCryptoCurrency(
        searchCryptoCurrencyDto,
      );

      // assert
      verify(cryptoCurrencyRepository.searchCryptoCurrency(
        any,
      ));
      expect(res, equals(Right(searchCryptoCurrencyResult)));
    });
  });
}
