import 'dart:convert';
import 'package:crypto_journal_mobile/app/user/data/data_sources/user_remote_data_source.dart';
import 'package:crypto_journal_mobile/app/user/data/inputs/update_user_input.dart';
import 'package:crypto_journal_mobile/app/user/data/models/user_model.dart';
import 'package:crypto_journal_mobile/app/user/data/repositories/user_repository.dart';
import 'package:crypto_journal_mobile/app/user/service/dtos/update_user_dto.dart';
import 'package:crypto_journal_mobile/app/user/service/repositories/user_repository.dart';
import 'package:crypto_journal_mobile/shared/data/network_info/network_info.dart';
import 'package:crypto_journal_mobile/shared/errors/network/network_connection_error.dart';
import 'package:crypto_journal_mobile/shared/errors/unexpected/unexpected_error.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import '../../../../shared/fixtures/fixture_reader.dart';
import 'user_repository_test.mocks.dart';

@GenerateMocks([
  IUserRemoteDataSource,
  INetworkInfo,
])
void main() {
  late MockIUserRemoteDataSource userRemoteDataSourceMock;
  late MockINetworkInfo networkInfoMock;
  late UserRepository userRepository;

  final userJson = json.decode(fixtureReader("user/user_fixture.json"));
  final userModel = UserModel.fromJson(userJson);

  setUp(() {
    userRemoteDataSourceMock = MockIUserRemoteDataSource();
    networkInfoMock = MockINetworkInfo();
    userRepository = UserRepository(
      userRemoteDataSource: userRemoteDataSourceMock,
      networkInfo: networkInfoMock,
    );
  });

  group('UserRepository', () {
    test('should be an instance of IUserRepository', () {
      // assert
      expect(userRepository, isA<IUserRepository>());
    });
  });

  setFailureMock() {
    when(networkInfoMock.isConnected).thenAnswer((_) => Future.value(false));
  }

  group("UserRepository.getUser", () {
    setSuccessMock() {
      when(networkInfoMock.isConnected).thenAnswer((_) => Future.value(true));
      when(userRemoteDataSourceMock.getUser())
          .thenAnswer((_) async => Future.value(userModel));
    }

    test('should call the isConnected method of the INetworkInfo class',
        () async {
      // arrange
      setSuccessMock();

      // act
      await userRepository.getUser();

      // assert
      verify(networkInfoMock.isConnected);
    });

    test('should call the getUser method of the IUserRemoteDataSource class',
        () async {
      // arrange
      setSuccessMock();

      // act
      final res = await userRepository.getUser();

      // assert
      verify(userRemoteDataSourceMock.getUser());
      expect(res, equals(Right(userModel)));
    });

    test(
        'should not call the getUser method of the IUserRemoteDataSource class if the connection is not ok ',
        () async {
      // arrange
      setFailureMock();

      // act
      await userRepository.getUser();

      // assert
      verifyZeroInteractions(userRemoteDataSourceMock);
    });

    test('should return NetworkConnectionError if the connection is not ok  ',
        () async {
      // arrange
      setFailureMock();

      // act
      final res = await userRepository.getUser();

      // assert
      expect(res, equals(Left(NetworkConnectionError())));
    });

    test('should return an UnexpectedError if an uncaught exption occurs',
        () async {
      // arrange
      when(networkInfoMock.isConnected).thenThrow(Exception());

      // act
      final res = await userRepository.getUser();

      // assert
      expect(res, equals(Left(UnexpectedError())));
    });
  });

  group('UserRepository.updateUser', () {
    setSuccessMock() {
      when(networkInfoMock.isConnected).thenAnswer((_) => Future.value(true));
      when(userRemoteDataSourceMock.updateUser(UpdateUserInput()))
          .thenAnswer((_) async => Future.value(userModel));
    }

    test('should call the isConnected method of the INetworkInfo class',
        () async {
      // arrange
      setSuccessMock();

      // act
      await userRepository.updateUser(UpdateUserDto());

      // assert
      verify(networkInfoMock.isConnected);
    });

    test('should call the updateUser method of the UserRemoteDataSource class',
        () async {
      // arrange
      setSuccessMock();

      // act
      final res = await userRepository.updateUser(UpdateUserDto());

      // assert
      verify(userRemoteDataSourceMock.updateUser(UpdateUserInput()));
      expect(res, equals(Right(userModel)));
    });

    test(
        'should not call the updateUser method of the IUserRemoteDataSource class if the connection is not ok ',
        () async {
      // arrange
      setFailureMock();

      // act
      await userRepository.updateUser(UpdateUserDto());

      // assert
      verifyZeroInteractions(userRemoteDataSourceMock);
    });

    test('should return NetworkConnectionError if the connection is not ok  ',
        () async {
      // arrange
      setFailureMock();

      // act
      final res = await userRepository.updateUser(UpdateUserDto());

      // assert
      expect(res, equals(Left(NetworkConnectionError())));
    });

    test('should return an UnexpectedError if an uncaught exption occurs',
        () async {
      // arrange
      when(networkInfoMock.isConnected).thenThrow(Exception());

      // act
      final res = await userRepository.updateUser(UpdateUserDto());

      // assert
      expect(res, equals(Left(UnexpectedError())));
    });
  });
}
