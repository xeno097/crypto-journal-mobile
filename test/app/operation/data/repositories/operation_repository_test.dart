import 'dart:convert';

import 'package:crypto_journal_mobile/app/operation/data/data_sources/operation_remote_data_source.dart';
import 'package:crypto_journal_mobile/app/operation/data/models/operation_model.dart';
import 'package:crypto_journal_mobile/app/operation/data/repositories/operation_repository.dart';
import 'package:crypto_journal_mobile/app/operation/service/repositories/operation_repository.dart';
import 'package:crypto_journal_mobile/shared/data/network_info/network_info.dart';
import 'package:crypto_journal_mobile/shared/errors/network/network_connection_error.dart';
import 'package:crypto_journal_mobile/shared/errors/unexpected/unexpected_error.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../shared/fixtures/fixture_reader.dart';
import 'operation_repository_test.mocks.dart';

@GenerateMocks([
  IOperationRemoteDataSource,
  INetworkInfo,
])
void main() {
  late MockIOperationRemoteDataSource operationRemoteDataSourceMock;
  late MockINetworkInfo networkInfoMock;
  late OperationRepository operationRepository;
  final getOperationsResult = [
    OperationModel.fromJson(
        json.decode(fixtureReader("operation_fixture.json")))
  ];

  setUp(() {
    operationRemoteDataSourceMock = MockIOperationRemoteDataSource();
    networkInfoMock = MockINetworkInfo();
    operationRepository = OperationRepository(
      operationRemoteDataSource: operationRemoteDataSourceMock,
      networkInfo: networkInfoMock,
    );
  });

  group("OperationRepository", () {
    test('should be an instance of IOperationRepository', () {
      // assert
      expect(operationRepository, isA<IOperationRepository>());
    });
  });

  group("OperationRepository.getOperations", () {
    setFailureMock() {
      when(networkInfoMock.isConnected).thenAnswer((_) => Future.value(false));
    }

    setSuccessMock() {
      when(networkInfoMock.isConnected).thenAnswer((_) => Future.value(true));
      when(operationRemoteDataSourceMock.getOperations())
          .thenAnswer((_) async => Future.value(getOperationsResult));
    }

    test('should call the isConnected method of the INetworkInfo class',
        () async {
      // arrange
      setSuccessMock();

      // act
      await operationRepository.getOperations();

      // assert
      verify(networkInfoMock.isConnected);
    });

    test(
        'should call the getOperations method of the IOperationRemoteDataSource class if the connection is ok',
        () async {
      // arrange
      setSuccessMock();

      // act
      await operationRepository.getOperations();

      // assert
      verify(networkInfoMock.isConnected);
      verify(operationRemoteDataSourceMock.getOperations());
    });

    test(
        'should not call the getOperations method of the IOperationRemoteDataSource class if the connection is not ok',
        () async {
      // arrange
      setFailureMock();

      // act
      await operationRepository.getOperations();

      // assert
      verify(networkInfoMock.isConnected);
      verifyZeroInteractions(operationRemoteDataSourceMock);
    });

    test('should return NetworkConnectionError if the connection is not ok',
        () async {
      // arrange
      setFailureMock();

      // act
      final res = await operationRepository.getOperations();

      // assert
      expect(res, equals(Left(NetworkConnectionError())));
    });

    test('should return an UnexpectedError if an uncaught exption occurs',
        () async {
      // arrange
      when(networkInfoMock.isConnected).thenThrow(Exception());

      // act
      final res = await operationRepository.getOperations();

      // assert
      expect(res, equals(Left(UnexpectedError())));
    });
  });
}
