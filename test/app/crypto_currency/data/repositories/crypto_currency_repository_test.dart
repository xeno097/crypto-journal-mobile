import 'dart:convert';

import 'package:crypto_journal_mobile/app/crypto_currency/data/data_sources/crypto_currency_remote_data_source.dart';
import 'package:crypto_journal_mobile/app/crypto_currency/data/models/crypto_currency_model.dart';
import 'package:crypto_journal_mobile/app/crypto_currency/data/repositories/crypto_currency_repository.dart';
import 'package:crypto_journal_mobile/app/crypto_currency/service/dtos/search_crypto_currency_dto.dart';
import 'package:crypto_journal_mobile/app/crypto_currency/service/repositories/crypto_currency_repository.dart';
import 'package:crypto_journal_mobile/shared/data/network_info/network_info.dart';
import 'package:crypto_journal_mobile/shared/errors/network/network_connection_error.dart';
import 'package:crypto_journal_mobile/shared/errors/unexpected/unexpected_error.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../shared/fixtures/fixture_reader.dart';
import 'crypto_currency_repository_test.mocks.dart';

@GenerateMocks([
  ICryptoCurrencyRemoteDataSource,
  INetworkInfo,
])
void main() {
  late MockICryptoCurrencyRemoteDataSource cryptoCurrencyRemoteDataSourceMock;
  late MockINetworkInfo networkInfoMock;
  late CryptoCurrencyRepository cryptoCurrencyRepository;

  final searchCryptoCurrencyDto = SearchCryptoCurrencyDto(text: "BTC");
  final cryptoCurrencyModel = CryptoCurrencyModel.fromJson(
    json.decode(
      fixtureReader("crypto_currency/crypto_currency_fixture.json"),
    ),
  );

  final expectedValue = [cryptoCurrencyModel];

  setUp(() {
    cryptoCurrencyRemoteDataSourceMock = MockICryptoCurrencyRemoteDataSource();
    networkInfoMock = MockINetworkInfo();
    cryptoCurrencyRepository = CryptoCurrencyRepository(
      cryptoCurrencyRemoteDataSource: cryptoCurrencyRemoteDataSourceMock,
      networkInfo: networkInfoMock,
    );
  });

  group("CryptoCurrencyRepository", () {
    test('it should be an instance of ICryptoCurrencyRepository', () {
      expect(cryptoCurrencyRepository, isA<ICryptoCurrencyRepository>());
    });
  });

  group("CryptoCurrencyRepository.searchCryptoCurrency", () {
    setFailureMock() {
      when(networkInfoMock.isConnected).thenAnswer((_) => Future.value(false));
    }

    setSuccessMock() {
      when(networkInfoMock.isConnected).thenAnswer((_) => Future.value(true));
      when(
        cryptoCurrencyRemoteDataSourceMock.searchCryptoCurrency(
          any,
        ),
      ).thenAnswer((_) async => Future.value(expectedValue));
    }

    test('should call the isConnected method of the INetworkInfo class',
        () async {
      // arrange
      setSuccessMock();

      // act
      await cryptoCurrencyRepository.searchCryptoCurrency(
        searchCryptoCurrencyDto,
      );

      // assert
      verify(networkInfoMock.isConnected);
    });

    test(
        'should call the searchCryptoCurrency method of the ICryptoCurrencyRepository class if the connection is ok',
        () async {
      // arrange
      setSuccessMock();

      // act
      await cryptoCurrencyRepository.searchCryptoCurrency(
        searchCryptoCurrencyDto,
      );

      // assert
      verify(networkInfoMock.isConnected);
      verify(
        cryptoCurrencyRemoteDataSourceMock.searchCryptoCurrency(
          any,
        ),
      );
    });

    test(
        'should not call the searchCryptoCurrency method of the ICryptoCurrencyRepository class if the connection is not ok',
        () async {
      // arrange
      setFailureMock();

      // act
      await cryptoCurrencyRepository.searchCryptoCurrency(
        searchCryptoCurrencyDto,
      );

      // assert
      verify(networkInfoMock.isConnected);
      verifyZeroInteractions(cryptoCurrencyRemoteDataSourceMock);
    });

    test('should return NetworkConnectionError if the connection is not ok',
        () async {
      // arrange
      setFailureMock();

      // act
      final res = await cryptoCurrencyRepository.searchCryptoCurrency(
        searchCryptoCurrencyDto,
      );

      // assert
      expect(res, equals(Left(NetworkConnectionError())));
    });

    test('should return an UnexpectedError if an uncaught exption occurs',
        () async {
      // arrange
      when(networkInfoMock.isConnected).thenThrow(Exception());

      // act
      final res = await cryptoCurrencyRepository.searchCryptoCurrency(
        searchCryptoCurrencyDto,
      );

      // assert
      expect(res, equals(Left(UnexpectedError())));
    });
  });
}
