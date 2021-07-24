import 'package:crypto_journal_mobile/app/user/data/data_sources/auth_remote_data_source.dart';
import 'package:crypto_journal_mobile/app/user/data/models/auth_payload_model.dart';
import 'package:crypto_journal_mobile/app/user/data/models/user_model.dart';
import 'package:crypto_journal_mobile/app/user/data/repositories/auth_repository.dart';
import 'package:crypto_journal_mobile/app/user/service/dtos/sign_in_dto.dart';
import 'package:crypto_journal_mobile/app/user/service/repositories/auth_repository.dart';
import 'package:crypto_journal_mobile/shared/data/network_info/network_info.dart';
import 'package:crypto_journal_mobile/shared/errors/network/network_connection_error.dart';
import 'package:crypto_journal_mobile/shared/errors/unexpected/unexpected_error.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'auth_repository_test.mocks.dart';

@GenerateMocks([
  INetworkInfo,
  IAuthRemoteDataSource,
])
void main() {
  late AuthRepository authRepository;
  late MockINetworkInfo networkInfoMock;
  late MockIAuthRemoteDataSource authRemoteDataSourceMock;
  final SignInDto signInDto = SignInDto(
    provider: SIGN_IN_PROVIDER.GOOGLE,
  );

  final AuthPayloadModel authPayloadDto = AuthPayloadModel(
    accessToken: "1234567890",
    refreshToken: "1234567890",
    user: UserModel(
      email: "test@email.com",
      id: "1234567890",
      profilePicture: "",
      userName: "test",
    ),
  );

  setUp(() {
    networkInfoMock = MockINetworkInfo();
    authRemoteDataSourceMock = MockIAuthRemoteDataSource();
    authRepository = AuthRepository(
      authRemoteDataSource: authRemoteDataSourceMock,
      networkInfo: networkInfoMock,
    );
  });

  group('AuthRepository', () {
    test("should be an instance of IAuthRepository", () {
      // assert
      expect(authRepository, isA<IAuthRepository>());
    });
  });

  setFailureMock() {
    when(networkInfoMock.isConnected).thenAnswer((_) => Future.value(false));
  }

  group('AuthRepository.signIn', () {
    setSuccessMock() {
      when(networkInfoMock.isConnected).thenAnswer((_) => Future.value(true));
      when(authRemoteDataSourceMock.signIn(any))
          .thenAnswer((_) async => Future.value(authPayloadDto));
    }

    test('should call the isConnected method of the INetworkInfo class',
        () async {
      // arrange
      setSuccessMock();

      // act
      await authRepository.signIn(signInDto);

      // assert
      verify(networkInfoMock.isConnected);
    });

    test(
        'should call the signIn method of the IAuthRemoteDataSource class if the connection is ok',
        () async {
      // arrange
      setSuccessMock();

      // act
      final res = await authRepository.signIn(signInDto);

      // assert
      verify(authRemoteDataSourceMock.signIn(signInDto.provider));
      expect(res, Right(authPayloadDto));
    });

    test(
        'should not call the signIn method of the IAuthRemoteDataSource class if the connection is not ok ',
        () async {
      // arrange
      setFailureMock();

      // act
      await authRepository.signIn(signInDto);

      // assert
      verifyZeroInteractions(authRemoteDataSourceMock);
    });

    test('should return NetworkConnectionError if the connection is not ok ',
        () async {
      // arrange
      setFailureMock();

      // act
      final res = await authRepository.signIn(signInDto);

      // assert
      expect(res, equals(Left(NetworkConnectionError())));
    });

    test('should return an UnexpectedError if an uncaught exption occurs',
        () async {
      // arrange
      when(networkInfoMock.isConnected).thenThrow(Exception());

      // act
      final res = await authRepository.signIn(signInDto);

      // assert
      expect(res, equals(Left(UnexpectedError())));
    });
  });

  group("AuthRepository.signOut", () {
    setSuccessMock() {
      when(networkInfoMock.isConnected).thenAnswer((_) => Future.value(true));
      when(authRemoteDataSourceMock.signOut())
          .thenAnswer((_) async => Future.value(true));
    }

    test('should call the isConnected method of the INetworkInfo class',
        () async {
      // arrange
      setSuccessMock();

      // act
      await authRepository.signOut();

      // assert
      verify(networkInfoMock.isConnected);
    });

    test(
        'should call the signOut method of the IAuthRemoteDataSource class if the connection is ok',
        () async {
      // arrange
      setSuccessMock();

      // act
      final res = await authRepository.signOut();

      // assert
      verify(authRemoteDataSourceMock.signOut());
      expect(res, equals(Right(true)));
    });

    test(
        'should not call the signOut method of the IAuthRemoteDataSource class if the connection is not ok ',
        () async {
      // arrange
      setFailureMock();

      // act
      await authRepository.signOut();

      // assert
      verifyZeroInteractions(authRemoteDataSourceMock);
    });

    test('should return NetworkConnectionError if the connection is not ok ',
        () async {
      // arrange
      setFailureMock();

      // act
      final res = await authRepository.signOut();

      // assert
      expect(res, equals(Left(NetworkConnectionError())));
    });

    test('should return an UnexpectedError if an uncaught exption occurs',
        () async {
      // arrange
      when(networkInfoMock.isConnected).thenThrow(Exception());

      // act
      final res = await authRepository.signOut();

      // assert
      expect(res, equals(Left(UnexpectedError())));
    });
  });
}
