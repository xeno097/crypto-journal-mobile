import 'dart:convert';

import 'package:crypto_journal_mobile/app/holding/data/data_sources/holding_remote_data_source.dart';
import 'package:crypto_journal_mobile/app/holding/data/inputs/get_holding_input.dart';
import 'package:crypto_journal_mobile/app/holding/data/models/holding_model.dart';
import 'package:crypto_journal_mobile/app/holding/data/repositories/holding_repository.dart';
import 'package:crypto_journal_mobile/app/holding/service/dtos/get_holdings_dto.dart';
import 'package:crypto_journal_mobile/app/holding/service/repositories/holding_repository.dart';
import 'package:crypto_journal_mobile/shared/data/network_info/network_info.dart';
import 'package:crypto_journal_mobile/shared/errors/network/network_connection_error.dart';
import 'package:crypto_journal_mobile/shared/errors/unexpected/unexpected_error.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../shared/fixtures/fixture_reader.dart';
import 'holding_repository_test.mocks.dart';

@GenerateMocks([
  IHoldingRemoteDataSource,
  INetworkInfo,
])
void main() {
  late MockIHoldingRemoteDataSource holdingRemoteDataSourceMock;
  late MockINetworkInfo networkInfoMock;
  late HoldingRepository holdingRepository;

  final holdingModel = HoldingModel.fromJson(
    json.decode(
      fixtureReader("holdings/holding_fixture.json"),
    ),
  );

  final getHoldingsResult = [holdingModel];

  setUp(() {
    holdingRemoteDataSourceMock = MockIHoldingRemoteDataSource();
    networkInfoMock = MockINetworkInfo();
    holdingRepository = HoldingRepository(
      holdingRemoteDataSource: holdingRemoteDataSourceMock,
      networkInfo: networkInfoMock,
    );
  });

  group("HoldingRepository", () {
    test('it should be an instance of IHoldingRepository', () {
      expect(holdingRepository, isA<IHoldingRepository>());
    });
  });

  group("HoldingRepository.getHoldings", () {
    setFailureMock() {
      when(networkInfoMock.isConnected).thenAnswer((_) => Future.value(false));
    }

    setSuccessMock() {
      when(networkInfoMock.isConnected).thenAnswer((_) => Future.value(true));
      when(
        holdingRemoteDataSourceMock.getHoldings(
          getHoldingInput: anyNamed("getHoldingInput"),
        ),
      ).thenAnswer((_) async => Future.value(getHoldingsResult));
    }

    test('should call the isConnected method of the INetworkInfo class',
        () async {
      // arrange
      setSuccessMock();

      // act
      await holdingRepository.getHoldings(
        getHoldingsDto: GetHoldingsDto(),
      );

      // assert
      verify(networkInfoMock.isConnected);
    });

    test(
        'should call the getHoldings method of the IHoldingRemoteDataSource class if the connection is ok',
        () async {
      // arrange
      setSuccessMock();

      // act
      await holdingRepository.getHoldings(
        getHoldingsDto: GetHoldingsDto(),
      );

      // assert
      verify(networkInfoMock.isConnected);
      verify(
        holdingRemoteDataSourceMock.getHoldings(
          getHoldingInput: GetHoldingInput(),
        ),
      );
    });

    test(
        'should not call the getHoldings method of the IHoldingRemoteDataSource class if the connection is not ok',
        () async {
      // arrange
      setFailureMock();

      // act
      await holdingRepository.getHoldings(
        getHoldingsDto: GetHoldingsDto(),
      );

      // assert
      verify(networkInfoMock.isConnected);
      verifyZeroInteractions(holdingRemoteDataSourceMock);
    });

    test('should return NetworkConnectionError if the connection is not ok',
        () async {
      // arrange
      setFailureMock();

      // act
      final res = await holdingRepository.getHoldings(
        getHoldingsDto: GetHoldingsDto(),
      );

      // assert
      expect(res, equals(Left(NetworkConnectionError())));
    });

    test('should return an UnexpectedError if an uncaught exption occurs',
        () async {
      // arrange
      when(networkInfoMock.isConnected).thenThrow(Exception());

      // act
      final res = await holdingRepository.getHoldings(
        getHoldingsDto: GetHoldingsDto(),
      );

      // assert
      expect(res, equals(Left(UnexpectedError())));
    });
  });
}
