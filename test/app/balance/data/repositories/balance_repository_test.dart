import 'dart:convert';

import 'package:crypto_journal_mobile/app/balance/data/data_sources/balance_remote_data_source.dart';
import 'package:crypto_journal_mobile/app/balance/data/inputs/get_balance_input.dart';
import 'package:crypto_journal_mobile/app/balance/data/models/balance_model.dart';
import 'package:crypto_journal_mobile/app/balance/data/repositories/balance_repository.dart';
import 'package:crypto_journal_mobile/app/balance/service/dtos/get_balance_dto.dart';
import 'package:crypto_journal_mobile/app/balance/service/repositories/balance_repository.dart';
import 'package:crypto_journal_mobile/shared/data/network_info/network_info.dart';
import 'package:crypto_journal_mobile/shared/errors/network/network_connection_error.dart';
import 'package:crypto_journal_mobile/shared/errors/unexpected/unexpected_error.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../shared/fixtures/fixture_reader.dart';
import 'balance_repository_test.mocks.dart';

@GenerateMocks([
  IBalanceRemoteDataSource,
  INetworkInfo,
])
void main() {
  late MockIBalanceRemoteDataSource balanceRemoteDataSourceMock;
  late MockINetworkInfo networkInfoMock;
  late BalanceRepository balanceRepository;

  final balanceModel = BalanceModel.fromJson(
    json.decode(
      fixtureReader("balance/balance_fixture.json"),
    ),
  );

  setUp(() {
    balanceRemoteDataSourceMock = MockIBalanceRemoteDataSource();
    networkInfoMock = MockINetworkInfo();
    balanceRepository = BalanceRepository(
      balanceRemoteDataSource: balanceRemoteDataSourceMock,
      networkInfo: networkInfoMock,
    );
  });

  group("BalanceRepository", () {
    test('it should be an instance of IBalanceRepository', () {
      expect(balanceRepository, isA<IBalanceRepository>());
    });
  });

  group("BalanceRepository.getBalance", () {
    setFailureMock() {
      when(networkInfoMock.isConnected).thenAnswer((_) => Future.value(false));
    }

    setSuccessMock() {
      when(networkInfoMock.isConnected).thenAnswer((_) => Future.value(true));
      when(
        balanceRemoteDataSourceMock.getBalance(
          any,
        ),
      ).thenAnswer((_) async => Future.value(balanceModel));
    }

    test('should call the isConnected method of the INetworkInfo class',
        () async {
      // arrange
      setSuccessMock();

      // act
      await balanceRepository.getBalance(GetBalanceDto());

      // assert
      verify(networkInfoMock.isConnected);
    });

    test(
        'should call the getBalance method of the IBalanceRemoteDataSource class if the connection is ok',
        () async {
      // arrange
      setSuccessMock();

      // act
      await balanceRepository.getBalance(
        GetBalanceDto(),
      );

      // assert
      verify(networkInfoMock.isConnected);
      verify(
        balanceRemoteDataSourceMock.getBalance(
          GetBalanceInput(),
        ),
      );
    });

    test(
        'should not call the getBalance method of the IBalanceRemoteDataSource class if the connection is not ok',
        () async {
      // arrange
      setFailureMock();

      // act
      await balanceRepository.getBalance(
        GetBalanceDto(),
      );

      // assert
      verify(networkInfoMock.isConnected);
      verifyZeroInteractions(balanceRemoteDataSourceMock);
    });

    test('should return NetworkConnectionError if the connection is not ok',
        () async {
      // arrange
      setFailureMock();

      // act
      final res = await balanceRepository.getBalance(
        GetBalanceDto(),
      );

      // assert
      expect(res, equals(Left(NetworkConnectionError())));
    });

    test('should return an UnexpectedError if an uncaught exption occurs',
        () async {
      // arrange
      when(networkInfoMock.isConnected).thenThrow(Exception());

      // act
      final res = await balanceRepository.getBalance(
        GetBalanceDto(),
      );

      // assert
      expect(res, equals(Left(UnexpectedError())));
    });
  });
}
